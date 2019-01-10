\version "2.19.3"

\header	{
  title = "Pójdźmy wszyscy do stajenki"
  subtitle = \markup \column { " " " " }
  arranger = "opracowanie: Wojciech Szaliński"
}

%--------------------------------MUZYKA
metrumitp = {
  \key g \major
  \time 4/4
  \tempo 4=130
  \set Score.tempoHideNote = ##t
}

melodiaSopranu =
\relative f' {
  \metrumitp
  d4 e d e |
  d4. g8 b4 g |
  d e d e |
  d4. g8 b4 g |
  \repeat volta 2 {
    c4. b8 a4 a |
    b4. a8 g4 g |
    fis fis e fis |
  }
  \alternative{
    { g4. a8 b4 b }
    { g4. a8 g4 g }
  }
  \bar "|."
}
melodiaAltu =
\relative f' {
  \metrumitp
  b,4 c b c |
  b4. d8 g4 d |
  b c b c |
  b4. d8 g4 d |
  \repeat volta 2 {
    g4. fis8 e4 e |
    fis4. e8 d4 d |
    d d cis c |
  }
  \alternative {
    { b4. d8 g4 g }
    { b,4. c8 b4 b }
  }
  \bar "|."
}
melodiaTenorow =
\relative f {
  \metrumitp
  g4 g g g |
  g4. b8 d4 b |
  g g g g |
  g4. b8 d4 b |
  \repeat volta 2 {
    e4. d8 c4 c |
    d4. c8 b4 b |
    a a a a |
  }
  \alternative {
    { g g d' d}
    { g, g g g}
  }
  \bar "|."
}
melodiaBasow =
\relative f {
  \metrumitp
  g4 g g g |
  g4. g8 g4 g |
  g g g g |
  g4. g8 g4 g |
  \repeat volta 2 {
    d4 e8->[\melisma fis->]\melismaEnd g4 fis8[->\melisma e]->\melismaEnd |
    d4 e8->[\melisma fis->]\melismaEnd g4 g |
    a a g8[( fis]) e([ d)] |
  }
  \alternative {
    { g4 g g g}
    { g g g, g}
  }
  \bar "|."
}

%{TODO:
  sprawdzić akordy, szczególnie takt 7
%}

akordy = \chordmode {
  g4 c g c g1
  g4 c g c g1
  \repeat volta 2 {
    c2 a:m b:m g d1
  }
  \alternative {
    { g1 }
    { g }
  }
}

%--------------------------------SŁOWA
tekst = \lyricmode {
  \set stanza = "1."
  Pój -- dźmy wszy -- scy do sta -- jen -- ki,
  do Je -- zu -- sa i Pa -- nie -- nki,
  \break
  po -- wi -- taj -- my Ma -- leń -- kie -- go
  i Ma -- ry -- ję, Ma -- tkę Je -- go,
  Ma -- tkę Je -- go.
}

tekstSopranu = \tekst
tekstAltu = \tekst
tekstTenorow = \tekst
tekstBasow = \tekst

zwrotkaII = \markup \column {
  "Witaj, Jezu ukochany, od patriarchów czekany,"
  "Od proroków ogłoszony, od narodów upragniony!"
}
zwrotkaIII = \markup \column {
  "Witaj, Dziecineczko w żłobie, wyznajemy Boga w Tobie,"
  "Coś się narodził tej nocy, byś nas wyrwał z czarta mocy!"
}
zwrotkaIV = \markup \column {
  "Witaj, Jezu nam zjawiony, witaj, dwakroć narodzony,"
  "Raz z Ojca przed wieków wiekiem, a teraz z Matki człowiekiem."
}
zwrotkaV = \markup \column {
  "Któż to słyszał takie dziwy, Tyś człowiek i Bóg prawdziwy,"
  "Ty łączysz w Boskiej Osobie dwie natury różne sobie."
}

%--------------------------------USTAWIENIA
#(set-global-staff-size 17)

\include "templates/predefined-instruments/instrument-context-definitions.ily"
\include "templates/adjustable-centered-stanzas/definitions.ily"
\include "ustawienia.ily"

\paper {
  top-markup-spacing.basic-distance = 10
  markup-system-spacing.basic-distance = 20
  system-system-spacing.basic-distance = 20
  score-markup-spacing.basic-distance = 18
}

%--------------------------------STRUKTURA
\score {
  \new ChoirStaff <<
    \new ChordNames \akordy

    \new SopranoVoice = sopran \melodiaSopranu
    \new Lyrics \lyricsto sopran \tekstSopranu

    \new AltoVoice = alt \melodiaAltu
    \new Lyrics \lyricsto alt \tekstAltu

    \new TenorVoice = tenor \melodiaTenorow
    \new Lyrics \lyricsto tenor \tekstTenorow

    \new BassVoice = bas \melodiaBasow
    \new Lyrics \lyricsto bas \tekstBasow
  >>
  \layout {}
  \midi {}
}

\markup
\override #'(stanza-vdist . 1.5)
\stanzas-in-one-column {
  \zwrotkaII
  \zwrotkaIII
  \zwrotkaIV
  \zwrotkaV
}
