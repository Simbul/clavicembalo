class Keyboard
  KEYBOARD = <<-eos
    |  | | | |  |  | | | | | |  |  | | | |  |  | | | | | |  |
    |  |c| |d|  |  |f| |g| |b|  |  |c| |d|  |  |f| |g| |b|  |
    |  └┬┘ └┬┘  |  └┬┘ └┬┘ └┬┘  |  └┬┘ └┬┘  |  └┬┘ └┬┘ └┬┘  |
    | C | D | E | F | G | A | B | C | D | E | F | G | A | B |
    └───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┘
  eos
  SEMITONES = %w(C C# D D# E F F# G G# A Bb B)

  def self.press_all *notes
    press(*notes, with_octave: false)
  end

  def self.press_once *notes
    press(*notes, with_octave: true)
  end


  private

  def self.press *notes, with_octave: false
    note_names = notes.map{ |n| Note.new(n) }.map{ |n| n.name(with_octave: with_octave) }
    expanded_keyboard(with_octave: with_octave)
      .gsub(/[A-Za-z][#b]?\d?/){ |match| note_names.include?(match) ? '●' : ' ' }
  end

  def self.expand keyboard_note
    case keyboard_note
    when 'c' then 'C#'
    when 'd' then 'D#'
    when 'f' then 'F#'
    when 'g' then 'G#'
    when 'b' then 'Bb'
    else keyboard_note
    end
  end

  def self.expanded_keyboard(with_octave: false)
    octaves = {}
    keyboard = KEYBOARD.dup

    if with_octave
      keyboard.gsub!(/[A-Z]/i){ |kn|
        octaves[kn] = octaves[kn].nil? ? 3 : octaves[kn] + 1
        "#{kn}#{octaves[kn]}"
      }
    end

    keyboard.gsub!(/[A-Z]/i){ |kn| expand(kn) }

    keyboard
  end
end
