\version "2.19.3"

\header	{
  title = "O, Jezu, cichy i pokorny"
  subtitle = "(kanon)"
  poet = "słowa: por. Mt 11,29"
  composer = "muzyka: Jacques Berthier, Taizé"
}

%--------------------------------MUZYKA
melodia = \relative f' {
  \key d \minor
  \time 2/2
  \tempo 2=55
  \set Score.tempoHideNote = ##t

  f2 (d) | e4 c a2  \bar "||"
  d4 f a f | e2 e  \bar "||"
  a a | c4 a a2  \bar "||"
  a4 a f d | e2 e  \bar "|."
}
akordy = \chordmode {
  d1:m a:m
  d:m7 a:m
  d:m a:m
  d:m7 a:m
}

%--------------------------------SŁOWA
tekst =  \lyricmode {
  O, Je -- zu,
  ci -- chy i po -- kor -- ny,
  u -- czyń ser -- ce me
  we -- dług se -- rca Twe -- go.
}

%--------------------------------USTAWIENIA
#(set-global-staff-size 18)

\include "templates/predefined-instruments/instrument-context-definitions.ily"
\include "templates/adjustable-centered-stanzas/definitions.ily"
\include "ustawienia.ily"

\paper {
  ragged-right = ##f
  indent = 0
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
