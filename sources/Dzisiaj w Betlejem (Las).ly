\version "2.19.3"

\header	{
  title = "Dzisiaj w Betlejem"
  subtitle = ""
  arranger = "opracowanie: ks. Józef Łaś SJ (1907-1990)"
}

%--------------------------------MUZYKA
metrumitp = {
  \key g \major
  \time 3/4
  \set beamExceptions = #'()
  \tempo "Animato" 4=120
}

melodiaSopranu =
\relative f' {
  \metrumitp
  g4^\p
  \once \override TextScript #'extra-offset = #'( -2.0 . 0.0 ) g8^\markup { \italic zwrotka }
  d g a |
  b4^\mf b8 a b c |
  d^\f e d4 c |
  b^\> a\! r |
  g4^\p g8 d g a |
  b4^\mf b8 a b c | \break
  d^\f e d4 c |
  b^\> a\! r |
  \repeat volta 2	{
    d4^\mf \once \override TextScript #'extra-offset = #'( -4.0 . 0.0 ) d8^\markup { \italic refren } c b a |
    g4 g8 d g b |
    d4 d8 c b a | \break
    g4 g8 d g b |
    d e d c b c |
    d e d c b c |
    d8^\f d e4 d |
    c4^\markup{\italic rit.} b a^\> |
    g2.\!
  }
  \bar "|."
}
melodiaAltu =
\relative f' {
  \metrumitp
  R1*3/4
  g4^\mf g8 d g a |
  g^\f g g4 g |
  g^\> fis\! r |
  R1*3/4
  g4^\mf g8 d g a |
  g^\f g  g[\melisma fis]\melismaEnd e[\melisma fis]\melismaEnd |
  g4^\> fis\! r |
  \repeat volta 2 {
    fis4^\mf fis8 fis fis fis |
    g4 g8 d g g |
    fis4 g8 a g fis |
    g4 g8 d g g |
    b c b a g a |
    b c b a g a |
    b^\f a gis4 gis |
    e8[\melisma fis]\melismaEnd g4 fis^\> |
    d2.\!
  }
  \bar "|."
}
melodiaTenorow =
\relative f {
  \metrumitp
  R1*3/4*2 |
  b8^\f c b4 c |
  d^\> d\! r |
  R1*3/4*2 |
  b8^\f c b4 c |
  d8[^\>\melisma cis]\melismaEnd d4\! r |
  \repeat volta 2 {
    a8[^\mf\melisma c]\melismaEnd b a d c |
    b[\melisma c]\melismaEnd d c b d |
    a[\melisma c]\melismaEnd b a b c |
    d[\melisma e]\melismaEnd d c b d |
    d4 d d |
    d4 d d |
    d8^\f d b4 b |
    a4 b8[\melisma c]\melismaEnd d[^\>\melisma c]\melismaEnd |
    b2.\!
  }
  \bar "|."
}
melodiaBasow =
\relative f {
  \metrumitp
  R1*3/4*2 |
  g8^\f g g4 e |
  d^\> d\! r |
  R1*3/4*2 |
  g8^\f g g4 a |
  g^\> d\! r |
  \repeat volta 2 {
    d4^\mf d8 d d d |
    g[\melisma a]\melismaEnd b a g g |
    d4 e8 fis g a |
    b[\melisma c]\melismaEnd b a g g |
    g4 g g8[\melisma fis]\melismaEnd |
    e4 fis g |
    g8^\f f e4 e |
    a g d^\> |
    g2.\!
  }
  \bar "|."
}

akordy = \chordmode {
  g2. g g2 c4 g d2
  g2. g g2 a4:m g d2
  \repeat volta 2 {
    d2.:7 g d4 e:m g g2.
    g2. e4:m b:m g g e2 a4:m g d g2.
  }
}

%--------------------------------SŁOWA
tekstSopranu = \lyricmode {
  \set stanza = "1."
  Dzi -- siaj w_Be -- tle -- jem,
  dzi -- siaj w_Be -- tle -- jem
  we -- so -- ła no -- wi -- na,
  że Pan -- na czy -- sta,
  że Pan -- na czy -- sta
  po -- ro -- dzi -- ła Sy -- na.
  Chry -- stus się ro -- dzi
  nas o -- swo -- bo -- dzi,
  a -- nie -- li gra -- ją
  kró -- le wi -- ta -- ją,
  pa -- ste -- rze śpie -- wa -- ją,
  by -- dlę -- ta klę -- ka -- ją,
  cu -- da, cu -- da o -- gła -- sza -- ją.
}
tekstAltu = \lyricmode {
  Dzi -- siaj w_Be -- tle -- jem,
  we -- so -- ła no -- wi -- na,
  że Pan -- na czy -- sta
  po -- ro -- dzi -- ła Sy -- na.
  Chry -- stus się ro -- dzi
  nas o -- swo -- bo -- dzi,
  a -- nie -- li gra -- ją
  kró -- le wi -- ta -- ją,
  pa -- ste -- rze śpie -- wa -- ją,
  by -- dlę -- ta klę -- ka -- ją,
  cu -- da, cu -- da o -- gła -- sza -- ją.
}
tekstTenorow = \lyricmode {
  we -- so -- ła no -- wi -- na,
  po -- ro -- dzi -- ła Sy -- na.
  Chry -- stus się ro -- dzi
  nas o -- swo -- bo -- dzi,
  a -- nie -- li gra -- ją
  kró -- le wi -- ta -- ją,
  pa -- ste -- rze śpie -- wa -- ją,
  cu -- da, cu -- da o -- gła -- sza -- ją.
}
tekstBasow = \tekstTenorow

zwrotkaII = \markup \column {
  "Maryja Panna Dzieciątko piastuje,"
  "i Józef święty Ono pielęgnuje."
}
zwrotkaIII = \markup \column {
  "Choć w stajeneczce Panna Syna rodzi,"
  "przecież On wkrótce ludzi oswobodzi."
}
zwrotkaIV = \markup \column {
  "I Trzej Królowie od wschodu przybyli,"
  "i dary Panu kosztowne złożyli."
}
zwrotkaV = \markup \column {
  "Pójdźmy też i my przywitać Jezusa,"
  "Króla nad królmi, uwielbić Chrystusa."
}

%--------------------------------USTAWIENIA
#(set-global-staff-size 16)

\include "templates/predefined-instruments/instrument-context-definitions.ily"
\include "templates/adjustable-centered-stanzas/definitions.ily"
\include "ustawienia.ily"

\paper {
  top-markup-spacing.basic-distance = 4
  markup-system-spacing.padding = -3
  system-system-spacing.basic-distance = 18
  score-markup-spacing.basic-distance = 14
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

\markup \zwrotki #2 { \zwrotkaII \zwrotkaIII \zwrotkaIV \zwrotkaV }
