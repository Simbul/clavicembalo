class Chords
  SEMITONES = %w(C C# D D# E F F# G G# A Bb B)
  INTERVALS = {
    'M' => [0, 4, 7], # major
    'm' => [0, 3, 7], # minor
    'o' => [0, 3, 6], # diminished
  }

  def self.chord name
    root_note, quality = name[0..-2], name[-1..-1]
    shifted_semitones = semitones_from(root_note)
    INTERVALS[quality].map{ |interval| shifted_semitones[interval] }
  end

  def self.semitones_from root_note
    root_index = SEMITONES.index(root_note)
    SEMITONES[root_index..-1] + SEMITONES[0...root_index]
  end
end
