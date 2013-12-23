class Keyboard
  KEYBOARD = <<-eos
    |  | | | |  |  | | | | | |  |  | | | |  |  | | | | | |  |
    |  |c| |d|  |  |f| |g| |b|  |  |c| |d|  |  |f| |g| |b|  |
    |  └┬┘ └┬┘  |  └┬┘ └┬┘ └┬┘  |  └┬┘ └┬┘  |  └┬┘ └┬┘ └┬┘  |
    | C | D | E | F | G | A | B | C | D | E | F | G | A | B |
    └───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┘
  eos

  def self.press *notes
    KEYBOARD
      .gsub(/[A-Z]/i){ |keyboard_note| notes.include?(expand(keyboard_note)) ? '●' : ' ' }
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
end
