\version "2.19.3"

\header	{
  title = "Jezu, mój Jezu"
  subtitle = "(kanon)"
}

%--------------------------------MUZYKA
melodia = \relative f' {
  \key e \minor
  \time 4/4
  \set Score.beamExceptions = #'()
  \tempo 4=60
  \set Score.tempoHideNote = ##t

  e4 d8 fis e4 b |
  e8 e fis fis g a16( g) fis4 |
  b8 b a a g a16 g fis8 b, |
  e4 d8 fis e2
  \bar "|."
}
akordy = \chordmode {
  e4:m d e:m b:m7
  e4:m d e:m b:m7
  e4:m d e:m b:m7
  e4:m d e2:m
}

%--------------------------------SŁOWA
tekst =  \lyricmode {
  \set stanza = "1."
  Je -- zu, mój Je -- zu, |
  dziś do Cie -- bie mó -- wić chcę, |
  Ty mi da -- jesz Swo -- je -- go Du -- cha, |
  u -- wiel -- biam Cię.
}
zwrotkaII = \markup \column {
  "Dobry Panie, serce me z wdzięczności drży,"
  "Ty mi dałeś Swojego Ducha. Cześć, chwała Ci."
}
zwrotkaIII = \markup \column {
  "Jezu miły, czy potrafię kochać Cię?"
  "Ty mnie pierwszy ukochałeś, wciąż kochasz mnie."
}
zwrotkaIV = \markup \column {
  "Jezu Chryste, jam nie godzien łaski Twej."
  "Pragnę pełnić wolę Twoją, wciąż wielbić Cię."
}
%--------------------------------USTAWIENIA
#(set-global-staff-size 18)

\include "templates/predefined-instruments/instrument-context-definitions.ily"
\include "templates/adjustable-centered-stanzas/definitions.ily"
\include "ustawienia.ily"

\paper {
  system-count = 2
  indent = 0
  short-indent = 0
  top-markup-spacing.basic-distance = 10
  markup-system-spacing.basic-distance = 22
  system-system-spacing.basic-distance = 18
  score-markup-spacing.basic-distance = 18
}

%--------------------------------STRUKTURA
\score {
  \new ChoirStaff <<
    \new ChordNames \akordy
    \new SopranoVoice = sopran \melodia
    \new Lyrics \lyricsto sopran \tekst
  >>
  \layout {
    \set Staff.instrumentName = ""
    \set Staff.shortInstrumentName = ""
  }
  \midi {}
}

\markup
\override #'(odstepMiedzyZwrotkami . 1.5)
\zwrotki #1 { \zwrotkaII \zwrotkaIII \zwrotkaIV }
