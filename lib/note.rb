class Note
  NAMES = %w(C C# D D# E F F# G G# A Bb B)

  attr_reader :octave, :semitone

  def initialize note
    if note.is_a? Note
      @semitone = note.semitone
      @octave = note.octave
    else
      name, octave = note.match(/([A-Z][#b]?)(\d?)/).captures

      raise ArgumentError, "#{name} is not a valid note name" unless NAMES.include?(name)

      @semitone = NAMES.index(name)
      @octave = octave.empty? ? 3 : octave.to_i
    end
  end

  def name(with_octave: false)
    if with_octave
      "#{NAMES[semitone]}#{octave}"
    else
      NAMES[semitone]
    end
  end
  alias :to_s :name

  def absolute_semitones
    @octave * 12 + @semitone
  end

  def == other_note
    octave == other_note.octave && semitone == other_note.semitone
  end

  def <=> other_note
    if octave == other_note.octave
      semitone <=> other_note.semitone
    else
      octave <=> other_note.octave
    end
  end

  def self.from_name_and_octave name, octave
    Note.new("#{name}#{octave}")
  end

  def self.from_octave_and_semitone octave, semitone
    Note.new("#{NAMES[semitone]}#{octave}")
  end

  def self.from_absolute_semitones absolute_semitones
    octave = absolute_semitones / 12
    semitone = absolute_semitones % 12
    from_octave_and_semitone(octave, semitone)
  end

  def + interval
    Note.from_absolute_semitones(absolute_semitones + interval)
  end

  def - interval
    self + (- interval)
  end

  def interval_to other_note
    other_note.absolute_semitones - absolute_semitones
  end

end
