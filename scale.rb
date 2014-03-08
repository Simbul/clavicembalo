require_relative 'note'

class Scale
  INTERVALS = {
    major: [2, 2, 1, 2, 2, 2],
    minor: [2, 1, 2, 2, 1, 2],
  }

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

end
