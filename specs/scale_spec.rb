require_relative '../scale'

describe Scale do
  describe ".new" do
    subject{ described_class.new(notes) }

    context "with no notes" do
      subject{ described_class.new() }
      it{ expect{ subject }.to raise_error ArgumentError }
    end

    context "with 1 note" do
      subject{ described_class.new(*notes_from(%w(C))) }
      it{ expect{ subject }.to raise_error ArgumentError }
    end

    context "with multiple notes" do
      subject{ described_class.new(*notes_from(%w(C E))) }
      it{ expect(subject).to be_a Scale }
      its(:notes){ should eq notes_from(%w(C E)) }
    end
  end

  describe ".named" do
    subject{ Scale.named(root, mode: mode) }

    context "with an unsupported mode" do
      let(:root){ 'C' }
      let(:mode){ :foobar }
      it{ expect{subject}.to raise_error(ArgumentError, /unsupported mode: foobar/i) }
    end

    context "without a mode" do
      let(:mode){ :major }

      context "from C" do
        let(:root){ 'C' }
        it "defaults to major mode" do
          expect(subject.notes).to eq notes_from(%w(C D E F G A B))
        end
      end
    end

    context "major" do
      let(:mode){ :major }

      context "from C" do
        let(:root){ 'C' }
        it{ expect(subject.notes).to eq notes_from(%w(C D E F G A B)) }
      end

      context "from A" do
        let(:root){ 'A' }
        it{ expect(subject.notes).to eq notes_from(%w(A B C#4 D4 E4 F#4 G#4)) }
      end

      context "from B" do
        let(:root){ 'B' }
        it{ expect(subject.notes).to eq notes_from(%w(B C#4 D#4 E4 F#4 G#4 Bb4)) }
      end
    end

    context "minor" do
      let(:mode){ :minor }

      context "from C" do
        let(:root){ 'C' }
        it{ expect(subject.notes).to eq notes_from(%w(C D D# F G G# Bb)) }
      end

      context "from A" do
        let(:root){ 'A' }
        it{ expect(subject.notes).to eq notes_from(%w(A B C4 D4 E4 F4 G4)) }
      end

      context "from B" do
        let(:root){ 'B' }
        it{ expect(subject.notes).to eq notes_from(%w(B C#4 D4 E4 F#4 G4 A4)) }
      end
    end
  end

  describe "#matches?" do
    let(:scale){ Scale.new(*notes_from(%w(C D))) }
    subject{ scale.matches?(other_scale) }

    context "when the other scale contains the same notes" do
      let(:other_scale){ Scale.new(*notes_from(%w(C D))) }
      it{ expect(subject).to be_true }
    end

    context "when the other scale contains the same notes plus others" do
      let(:other_scale){ Scale.new(*notes_from(%w(C D E F))) }
      it{ expect(subject).to be_true }
    end

    context "when the other scale does not contain all the same notes" do
      let(:other_scale){ Scale.new(*notes_from(%w(C D#))) }
      it{ expect(subject).to be_false }
    end

    describe "not commutative" do
      let(:other_scale){ Scale.new(*notes_from(%w(C D E F))) }

      context "scale -> other_scale" do
        it{ expect(scale.matches?(other_scale)).to be_true }
      end

      context "other_scale -> scale" do
        it{ expect(other_scale.matches?(scale)).to be_false }
      end
    end
  end

  describe "#chords" do
    subject{ scale.chords(mode: mode) }

    context "major chords for a C major scale" do
      let(:mode){ :major }
      let(:scale){ Scale.named('C', mode: mode) }
      it{ expect(subject).to eq chords_from(%w(CM Dm Em FM GM Am Bo)) }
    end

    context "minor chords for a C minor scale" do
      let(:mode){ :minor }
      let(:scale){ Scale.named('C', mode: mode) }
      it{ expect(subject).to eq chords_from(%w(Cm Do D#M Fm Gm G#M BbM)) }
    end
  end

  def notes_from note_names
    note_names.map{ |name| Note.new(name) }
  end

  def chords_from chord_names
    chord_names.map{ |name| Chord.named(name) }
  end
end
