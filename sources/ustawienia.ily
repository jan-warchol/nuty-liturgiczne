
#(ly:set-option 'strokeadjust #t)

\paper {
  indent = 2 \mm
  short-indent = 2 \mm
  left-margin = 15 \mm
  right-margin = 15 \mm
}

\paper {
  tagline =
  \markup \tiny
  \override #'(baseline-skip . 2.1)
  \center-column {
    "skład nut: Jan Warchoł (jan.warchol@gmail.com, 509 078 203)"
    \with-url
    #"http://lilypond.org/"
    #(format #f "LilyPond v~a"
       (lilypond-version))
  }
}

\layout {
  \override Score.MetronomeMark.padding = 3
  \context {
    \ChordNames
    \germanChords
    chordNameLowercaseMinor = ##t
    majorSevenSymbol = \markup { 7+ }
  }
  \context {
    \SopranoStaff
    instrumentName = "S "
    shortInstrumentName = "S "
  }
  \context {
    \AltoStaff
    instrumentName = "A "
    shortInstrumentName = "A "
  }
  \context {
    \TenorStaff
    instrumentName = "T "
    shortInstrumentName = "T "
  }
  \context {
    \BassStaff
    instrumentName = "B "
    shortInstrumentName = "B "
  }
}
