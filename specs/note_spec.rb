require_relative '../lib/note'

describe Note do
  describe ".new" do
    subject{ described_class.new(name) }

    context "with an invalid name" do
      let(:name){ 'Z#' }
      it{ expect{ subject }.to raise_error ArgumentError, /name/ }
    end

    context "with a valid name" do
      let(:name){ 'F#3' }

      it{ expect(subject).to be_a Note }
      its(:name){ should eq 'F#' }
      its(:octave){ should eq 3 }
      its(:semitone){ should eq 6 }

      context "without an octave" do
        let(:name){ 'F#' }
        it "defaults to octave 3" do
          expect(subject.octave).to eq 3
        end
      end
    end
  end

  describe "#absolute_semitones" do
    subject{ note.absolute_semitones }

    context "with an arbitrary note" do
      let(:note){ Note.new('F3') }

      it "returns absolute semitones, counting octaves" do
        expect(subject).to eq (12 * 3 + 5)
      end
    end

    context "with the zero note" do
      let(:note){ Note.new('C0') }
      it{ expect(subject).to eq 0 }
    end
  end

  describe "#==" do
    let(:note){ Note.new('F3') }
    subject{ note == other_note }

    context "when the other note has the same octave and semitone" do
      let(:other_note){ Note.new('F3') }
      it{ expect(subject).to be_true }
    end

    context "when the other note does not have the same octave and semitone" do
      let(:other_note){ Note.new('F4') }
      it{ expect(subject).to be_false }
    end
  end

  describe "#<=>" do
    let(:note){ Note.new('F3') }
    subject{ note <=> other_note }

    context "when the other note has the same octave and semitone" do
      let(:other_note){ Note.new('F3') }
      it{ expect(subject).to eq 0 }
    end

    context "when the other note is above the target" do
      let(:other_note){ Note.new('B3') }
      it{ expect(subject).to eq -1 }
    end

    context "when the other note is below the target" do
      let(:other_note){ Note.new('C3') }
      it{ expect(subject).to eq 1 }
    end
  end

  describe ".+" do
    let(:note){ Note.new('F3') }
    subject{ note + interval }

    context "with an empty interval" do
      let(:interval){ 0 }

      it "returns the same note" do
        expect(subject).to eq Note.new('F3')
      end
    end

    context "with an octave interval" do
      let(:interval){ 12 }

      it "returns the same note, one octave higher" do
        expect(subject).to eq Note.new('F4')
      end
    end

    context "with an arbitrary interval" do
      let(:interval){ 19 }

      it "returns the note at the given interval above the target" do
        expect(subject).to eq Note.new('C5')
      end
    end

    context "with a negative interval" do
      let(:interval){ -13 }

      it "returns the note at the given interval below the target" do
        expect(subject).to eq Note.new('E2')
      end
    end
  end

  describe ".-" do
    let(:note){ Note.new('F3') }
    subject{ note - interval }

    context "with an arbitrary interval" do
      let(:interval){ 13 }

      it "returns the note at the given interval below the target" do
        expect(subject).to eq Note.new('E2')
      end
    end
  end

  describe ".interval_to" do
    let(:note){ Note.new('C3') }
    subject{ note.interval_to(other_note) }

    context "between a note and itself" do
      let(:other_note){ Note.new('C3') }

      it{ expect(subject).to eq 0 }
    end

    context "between a note and its higher octave" do
      let(:other_note){ Note.new('C4') }

      it{ expect(subject).to eq 12 }
    end

    context "between two arbitrary notes" do
      let(:other_note){ Note.new('G3') }

      it "returns the number of semitones between the notes" do
        expect(subject).to eq 7
      end
    end

    context "with a note below the target" do
      let(:other_note){ Note.new('B2') }

      it "returns a negative number of semitones between the notes" do
        expect(subject).to eq -1
      end
    end
  end

  describe "#name" do
    let(:note){ Note.new('C3') }
    subject{ note.name }

    it "returns the note name without octave" do
      expect(subject).to eq 'C'
    end

    context 'when parameter "with_octave" is true' do
      subject{ note.name(with_octave: true) }

      it "returns the note name with octave" do
        expect(subject).to eq 'C3'
      end
    end
  end

end
