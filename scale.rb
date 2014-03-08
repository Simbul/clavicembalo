require_relative 'note'
require_relative 'chord'

class Scale
  INTERVALS = {
    major: [2, 2, 1, 2, 2, 2],
    minor: [2, 1, 2, 2, 1, 2],
  }
  CHORD_QUALITIES = %w(M m m M M m o M)

  attr_reader :notes

  def initialize *notes
    raise ArgumentError, 'A scale needs 2+ notes' unless notes.count >= 2

    @notes = notes.sort
  end

  def self.named root_note, mode: :major
    raise ArgumentError, "Unsupported mode: #{mode}" unless INTERVALS.keys.include?(mode)

    root = Note.new(root_note)
    notes = [root]
    INTERVALS[mode].each do |interval|
      notes << notes.last + interval
    end

    Scale.new(*notes)
  end

  def matches? other_scale
    @notes.all?{ |note| other_scale.notes.include?(note) }
  end

  def chords
    notes.each_with_index.map{ |note, i| Chord.named("#{note}#{CHORD_QUALITIES[i]}") }
  end

end
