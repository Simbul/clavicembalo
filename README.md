# Clavicembalo

Clavicembalo is a lightweight library to deal with basic musical concepts such as notes, chords and scales.

This is very much a work in progress, so the interface is not refined as it could be. *Hic sunt leones* ;)


## Installation

Just get the required gems with:

```
$ bundle install
```

## Examples

You can run all the examples in `irb`.

Create a C sharp minor chord:

```ruby
> chord = Chord.named('C#m')
=> #<Chord:0x007f946dfc8c18 @notes=[#<Note:0x007f946dfc9000 @semitone=1, @octave=3>, #<Note:0x007f946dfc8e98 @semitone=4, @octave=3>, #<Note:0x007f946dfc8d30 @semitone=8, @octave=3>]>
```

By default, chords are based on the middle C (C3) octave:

```ruby
> chord.name
=> "C#3m"
```

Get the chord components:

```ruby
> chord.notes.join(' ')
=> "C#3 E3 G#3"
```

Or more succinctly:

```ruby
> chord.notes.map(&:name).join(' ')
=> "C# E G#"
```

Display the chord on a keyboard (note the splat operator):

```
> puts Keyboard.press_once(*chord.notes.map(&:name))
    |  | | | |  |  | | | | | |  |  | | | |  |  | | | | | |  |
    |  |●| | |  |  | | |●| | |  |  | | | |  |  | | | | | |  |
    |  └┬┘ └┬┘  |  └┬┘ └┬┘ └┬┘  |  └┬┘ └┬┘  |  └┬┘ └┬┘ └┬┘  |
    |   |   | ● |   |   |   |   |   |   |   |   |   |   |   |
    └───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┘
=> nil
```

Get a major C# scale:

```ruby
> scale = Scales.major_scale('C#')
=> ["C#", "D#", "F", "F#", "G#", "Bb", "C"]
```

Display the scale on a keyboard:

```
> puts Keyboard.press(*scale)
    |  | | | |  |  | | | | | |  |  | | | |  |  | | | | | |  |
    |  |●| |●|  |  |●| |●| |●|  |  |●| |●|  |  |●| |●| |●|  |
    |  └┬┘ └┬┘  |  └┬┘ └┬┘ └┬┘  |  └┬┘ └┬┘  |  └┬┘ └┬┘ └┬┘  |
    | ● |   |   | ● |   |   |   | ● |   |   | ● |   |   |   |
    └───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┘
=> nil
```

## List

You can get a list of all major scales and all the corresponding chords with:

```bash
$ ruby list.rb
```
