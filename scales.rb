class Scales
  SEMITONES = %w(C C# D D# E F F# G G# A Bb B)
  MAJOR_INTERVALS = [2, 2, 1, 2, 2, 2]
  CHORDS = %w(M m m M M m o M)

  def self.major_scale root_note
    shifted_semitones = semitones_from(root_note)
    intervals_to_indexes(MAJOR_INTERVALS).map{ |index| shifted_semitones[index] }
  end

  def self.intervals_to_indexes intervals
    intervals.inject([0]){ |memo, item| memo << memo.last + item }
  end

  def self.semitones_from root_note
    root_index = SEMITONES.index(root_note)
    SEMITONES[root_index..-1] + SEMITONES[0...root_index]
  end

  def self.chord_abbrevs_for root_note
    scale = major_scale(root_note)
    chords = CHORDS.dup
    scale.map { |note| note + chords.shift }
  end
end
