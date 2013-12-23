require_relative 'scales'
require_relative 'chords'
require_relative 'keyboard'

class Lists
  SEMITONES = %w(C C# D D# E F F# G G# A Bb B)

  def self.print_scales
    SEMITONES.each do |note|
      scale = Scales.major_scale(note)
      puts "#{note} major scale: #{scale}"
      puts Keyboard.press_once(*scale)
    end
  end

  def self.print_chords_of root_note
    chord_abbrevs = Scales.chord_abbrevs_for(root_note)
    chords = chord_abbrevs.map { |chord_abbrev| Chords.chord(chord_abbrev) }
    numbers = %w(I ii iii IV V vi vii)

    puts "#{root_note} chords:"
    chords.each do |chord|
      puts "(#{numbers.shift.rjust(3)})  #{chord_abbrevs.shift.rjust(3)}:  #{chord.join(' ')}"
    end
  end
end

Lists.print_scales
Lists::SEMITONES.each do |note|
  Lists.print_chords_of(note)
end
