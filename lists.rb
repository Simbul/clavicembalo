require_relative 'lib/scale'
require_relative 'lib/keyboard'

class Lists
  SEMITONES = %w(C C# D D# E F F# G G# A Bb B)

  def self.print_scales
    SEMITONES.each do |note|
      scale = Scale.named(note, mode: :major)
      puts "#{note} major scale: #{scale.notes.map(&:name)}"
      puts Keyboard.press_once(*scale.notes)
    end
  end

  def self.print_chords_of root_note
    chords = Scale.named(root_note).chords
    numbers = %w(I ii iii IV V vi vii)

    puts "#{root_note} chords:"
    chords.each do |chord|
      puts "(#{numbers.shift.rjust(3)})  #{chord.name.rjust(3)}:  #{chord.notes.map(&:name).join(' ')}"
    end
  end
end

Lists.print_scales
Lists::SEMITONES.each do |note|
  Lists.print_chords_of(note)
end
