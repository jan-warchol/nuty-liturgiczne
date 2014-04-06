%{TODO:
  czy nie powinno być dodatkowego taktu przedłużającego drugie Domine?
  Albo może metrum jest inne? Jak to wpłynie na akompaniament?
  Czy obecny do dwóch głosów nie jest przekombinwowany?
%}
\version "2.19.3"

\header	{
  title = "Gloria Tibi Domine"
  subtitle = "(kanon)"
  subsubtitle = " "
  composer = "muzyka: Taizé"
}

%--------------------------------MUZYKA
melodia = \relative f' {
  \key c \major
  \time 4/4
  \tempo 4=100
  \set Score.tempoHideNote = ##t

  c4 c f f
  e c8 c c2
  e c4 c
  g'4 g a a
  g e8 d c2
  g a4 c
  \bar "|."
}
akordy = \chordmode {
}

%--------------------------------SŁOWA
tekst =  \lyricmode {
  Glo -- ri -- a Ti -- bi, Do -- mi -- ne, Do -- mi -- ne.
  Glo -- ri -- a Ti -- bi, Do -- mi -- ne, Do -- mi -- ne.
}

stanzas = \markup {
  \column {
    \typewriter \bold
    "Gloria Tibi,  Domine."
    \typewriter
    "Chwała Tobie, Panie."
    " "
    "akompaniament:"
    \line {"- dla dwóch głosów:" \typewriter "C d C F e a C d C F e a (...) C"}
    \line {"- dla trzech głosów:" \typewriter "C F C F C F C F C F C F (...) C"}
  }
}

%--------------------------------USTAWIENIA
#(set-global-staff-size 18)

\include "templates/predefined-instruments/instrument-context-definitions.ily"
\include "templates/adjustable-centered-stanzas/definitions.ily"
\include "ustawienia.ily"

\paper {
  ragged-right = ##f
  indent = 0
  top-markup-spacing #'basic-distance = 10
  markup-system-spacing #'basic-distance = 22
  system-system-spacing #'basic-distance = 18
  score-markup-spacing #'basic-distance = 18
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

\stanzas
