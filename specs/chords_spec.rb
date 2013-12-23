require_relative '../chords'

describe Chords do
  describe ".chord" do
    subject{ Chords.chord name }

    context "C major" do
      let(:name){ 'CM' }
      it{ expect(subject).to eq %w(C E G) }
    end

    context "A major" do
      let(:name){ 'AM' }
      it{ expect(subject).to eq %w(A C# E) }
    end

    context "C minor" do
      let(:name){ 'Cm' }
      it{ expect(subject).to eq %w(C D# G) }
    end

    context "A minor" do
      let(:name){ 'Am' }
      it{ expect(subject).to eq %w(A C E) }
    end

    context "C diminished" do
      let(:name){ 'Co' }
      it{ expect(subject).to eq %w(C D# F#) }
    end

    context "A diminished" do
      let(:name){ 'Ao' }
      it{ expect(subject).to eq %w(A C D#) }
    end

    context "C# major" do
      let(:name){ 'C#M' }
      it{ expect(subject).to eq %w(C# F G#) }
    end
  end
end
