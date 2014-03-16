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
=> C#m
```

Get the chord components:

```ruby
> chord.notes.join(' ')
=> "C# E G#"
```

Or more verbosely, with the note octave:

```ruby
> chord.notes.map{ |note| note.name(with_octave: true) }.join(' ')
=> "C#3 E3 G#3"
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
> scale = Scale.named('C#')
=> ["C#", "D#", "F", "F#", "G#", "Bb", "C"]
```

Display the scale on a keyboard (note that the `Keyboard.press` method will press the notes in all available octaves):

```
> puts Keyboard.press(*scale.notes)
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
