require_relative '../scales'

describe Scales do
  describe ".intervals_to_indexes" do
    let(:intervals){ [1, 2, 3] }
    subject{ Scales.intervals_to_indexes(intervals) }

    it "converts the array from intervals to positions in an array" do
      expect(subject).to eq [0, 1, 3, 6]
    end
  end

  describe ".semitones_from" do
    subject{ Scales.semitones_from(root) }

    context "from C" do
      let(:root){ 'C' }
      it{ expect(subject).to eq %w(C C# D D# E F F# G G# A Bb B) }
    end

    context "from B" do
      let(:root){ 'B' }
      it{ expect(subject).to eq %w(B C C# D D# E F F# G G# A Bb) }
    end

    context "from E" do
      let(:root){ 'E' }
      it{ expect(subject).to eq %w(E F F# G G# A Bb B C C# D D#) }
    end
  end

  describe ".major_scale" do
    subject{ Scales.major_scale(root) }

    context "from C" do
      let(:root){ 'C' }
      it{ expect(subject).to eq %w(C D E F G A B) }
    end

    context "from A" do
      let(:root){ 'A' }
      it{ expect(subject).to eq %w(A B C# D E F# G#) }
    end

    context "from B" do
      let(:root){ 'B' }
      it{ expect(subject).to eq %w(B C# D# E F# G# Bb) }
    end
  end

  describe ".chord_abbrevs_for" do
    subject{ Scales.chord_abbrevs_for(root) }

    context "from C" do
      let(:root){ 'C' }
      it{ expect(subject).to eq %w(CM Dm Em FM GM Am Bo) }
    end
  end
end
