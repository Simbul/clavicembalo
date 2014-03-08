require_relative '../chord'

describe Chord do
  describe ".new" do
    subject{ described_class.new(notes) }

    context "with no notes" do
      subject{ described_class.new() }
      it{ expect{ subject }.to raise_error ArgumentError }
    end

    context "with 1 note" do
      subject{ described_class.new(Note.new('C3')) }
      it{ expect{ subject }.to raise_error ArgumentError }
    end

    context "with multiple notes" do
      subject{ described_class.new(Note.new('C3'), Note.new('E3')) }
      it{ expect(subject).to be_a Chord }
      its(:notes){ should eq [Note.new('C3'), Note.new('E3')] }
    end
  end

  describe "#notes" do
    subject{ described_class.new(Note.new('C4'), Note.new('E3'), Note.new('D3')).notes }

    it "returns a sorted list of notes" do
      expect(subject).to eq [Note.new('D3'), Note.new('E3'), Note.new('C4')]
    end
  end

  describe ".named" do
    subject{ Chord.named(name) }

    context "C major" do
      let(:name){ 'CM' }
      it{ expect(subject.notes).to eq notes_from %w(C3 E3 G3) }
    end

    context "A major" do
      let(:name){ 'AM' }
      it{ expect(subject.notes).to eq notes_from %w(A3 C#4 E4) }
    end

    context "C minor" do
      let(:name){ 'Cm' }
      it{ expect(subject.notes).to eq notes_from %w(C3 D#3 G3) }
    end

    context "A minor" do
      let(:name){ 'Am' }
      it{ expect(subject.notes).to eq notes_from %w(A3 C4 E4) }
    end

    context "C diminished" do
      let(:name){ 'Co' }
      it{ expect(subject.notes).to eq notes_from %w(C3 D#3 F#3) }
    end

    context "A diminished" do
      let(:name){ 'Ao' }
      it{ expect(subject.notes).to eq notes_from %w(A3 C4 D#4) }
    end

    context "C# major" do
      let(:name){ 'C#M' }
      it{ expect(subject.notes).to eq notes_from %w(C#3 F3 G#3) }
    end
  end

  describe "#name" do
    let(:chord){ Chord.new(*notes) }
    subject{ chord.name }

    context "with an unrecognised chord" do
      let(:notes){ notes_from %w(C D E) }
      it{ expect(subject).to be_nil }
    end

    context "C major" do
      let(:notes){ notes_from %w(C3 E3 G3) }
      it{ expect(subject).to eq 'C3M' }
    end

    context "A minor" do
      let(:notes){ notes_from %w(A3 C4 E4) }
      it{ expect(subject).to eq 'A3m' }
    end

    context "C diminished" do
      let(:notes){ notes_from %w(C3 D#3 F#3) }
      it{ expect(subject).to eq 'C3o' }
    end
  end

  describe "#==" do
    let(:chord){ Chord.new(*notes_from(%w(C3 E3 G3))) }
    subject{ chord == other_chord }

    context "when the other chord has the same notes" do
      let(:other_chord){ Chord.new(*notes_from(%w(C3 E3 G3))) }
      it{ expect(subject).to be_true }
    end

    context "when the other chord has the same notes on a different octave" do
      let(:other_chord){ Chord.new(*notes_from(%w(C4 E4 G4))) }
      it{ expect(subject).to be_false }
    end

    context "when the other chord is an inversion" do
      let(:other_chord){ Chord.new(*notes_from(%w(G3 C4 E4))) }
      it{ expect(subject).to be_false }
    end
  end

  def notes_from note_names
    note_names.map{ |name| Note.new(name) }
  end
end
