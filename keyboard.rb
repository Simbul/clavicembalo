class Keyboard
  KEYBOARD = <<-eos
    |  | | | |  |  | | | | | |  |  | | | |  |  | | | | | |  |
    |  |c| |d|  |  |f| |g| |b|  |  |c| |d|  |  |f| |g| |b|  |
    |  └┬┘ └┬┘  |  └┬┘ └┬┘ └┬┘  |  └┬┘ └┬┘  |  └┬┘ └┬┘ └┬┘  |
    | C | D | E | F | G | A | B | C | D | E | F | G | A | B |
    └───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┘
  eos
  SEMITONES = %w(C C# D D# E F F# G G# A Bb B)

  def self.press *notes
    KEYBOARD
      .gsub(/[A-Z]/i){ |keyboard_note| notes.include?(expand(keyboard_note)) ? '●' : ' ' }
  end

  def self.add_octave_to *notes
    octave = 3
    notes.map.with_index{ |note, idx|
      octave += 1 if idx > 0 && SEMITONES.index(note) < SEMITONES.index(notes[idx - 1])
      "#{note}#{octave}"
    }
  end

  def self.press_once *notes
    notes_with_octave = add_octave_to(*notes)
    expanded_keyboard.gsub(/[A-Za-z][#b]?\d/) { |match| notes_with_octave.include?(match) ? '●' : ' ' }
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

  def self.expanded_keyboard
    octaves = {}
    KEYBOARD.gsub(/[A-Z]/i){ |kn|
      octaves[kn] = octaves[kn].nil? ? 3 : octaves[kn] + 1
      "#{kn}#{octaves[kn]}"
    }.gsub(/[A-Z]/i){ |kn| expand(kn) }
  end
end
