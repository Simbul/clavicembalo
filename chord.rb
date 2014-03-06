require_relative 'note'

class Chord
  INTERVALS = {
    'M' => [0, 4, 7], # major
    'm' => [0, 3, 7], # minor
    'o' => [0, 3, 6], # diminished
  }

  attr_reader :notes

  def initialize *notes
    raise ArgumentError, 'A chord needs 2+ notes' unless notes.count >= 2

    @notes = notes.sort
  end

  def self.named name
    root_note_name, quality = name[0..-2], name[-1..-1]
    root_note = Note.new(root_note_name)
    Chord.new(*INTERVALS[quality].map{ |interval| root_note + interval })
  end

  def name
    absolute_semitones = @notes.map{ |note| note.absolute_semitones }
    intervals = absolute_semitones.map{ |as| as - absolute_semitones.min }
    if quality = INTERVALS.invert[intervals]
      "#{@notes.first}#{quality}"
    else
      nil
    end
  end

end
