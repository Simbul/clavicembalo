class Chords
  SEMITONES = %w(C C# D D# E F F# G G# A Bb B)
  MAJOR_INTERVALS = [0, 4, 7]
  MINOR_INTERVALS = [0, 3, 7]
  DIMINISHED_INTERVALS = [0, 3, 6]

  def self.chord name
    root_note, quality = name[0..-2], name[-1..-1]
    shifted_semitones = semitones_from(root_note)
    case quality
    when 'M'
      MAJOR_INTERVALS.map{ |interval| shifted_semitones[interval] }
    when 'm'
      MINOR_INTERVALS.map{ |interval| shifted_semitones[interval] }
    when 'o'
      DIMINISHED_INTERVALS.map{ |interval| shifted_semitones[interval] }
    end
  end

  def self.semitones_from root_note
    root_index = SEMITONES.index(root_note)
    SEMITONES[root_index..-1] + SEMITONES[0...root_index]
  end
end
