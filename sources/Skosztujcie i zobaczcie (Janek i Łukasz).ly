\version "2.19.3"

\header	{
  title = "Skosztujcie i zobaczcie"
  subtitle = "Psalm 34"
  composer = "muzyka: ks. Stanisław Ziemiański SJ"
  arranger = "opracowanie: Łukasz Czerwiński, Jan Warchoł"
}

%--------------------------------MUZYKA
metrumitp = {
  \key bes \major
  \time 2/4
  \tempo Moderato 4=75
}

melodiaSopranu =
\relative f' {
  \metrumitp
  \repeat volta 2 {
    r8 g a bes | c bes a[( bes]) | g4.
    g8 | f4 d8 es | f2
  }
  \time 5/4 f8 f g g a f g4 g |
  \time 4/4 g8 g a bes g4 f4 |
  \time 5/4 bes8 bes bes bes c bes g4 g |
  \time 4/4 g8 f d es f4 f \fermata |
  \bar "|."
}
melodiaAltu =
\relative f' {
  \metrumitp
  \repeat volta 2 {
    r8 d d d | g8 g f4 | es4.
    d8 | d[( f16 es]) d8 c | c2
  }
  d8 d d d d d d4 d |
  es8 es es es es4 c4 |
  d8 d d d g g es4 es |
  es8 es es es c4 c \fermata |
  \bar "|."
}
melodiaTenorow =
\relative f {
  \metrumitp
  \repeat volta 2 {
    r8 d' d d | c es d[( a]) | g4.
    bes8 | f4 f8 bes | a2
  }
  a8 a a a a a   bes4 bes |
  bes8 bes bes bes   g4 a4 |
  bes8 bes bes bes bes bes bes4 bes |
  g8 g g g   bes4 a \fermata |
  \bar "|."
}
melodiaBasow =
\relative f {
  \metrumitp
  \repeat volta 2 {
    r8 g g g | c, c d4 | es4.
    g,8 | bes4 bes8 bes | c2
  }
  d8 d d d d d  g,4 g |
  es'8 es es es c4 c4 |
  bes8 bes bes bes bes bes  es4 es |
  c8 c c c f,4 f \fermata
  \bar "|."
}

akordy = \chordmode {
  \repeat volta 2 {
    g2:m c4:m d:m es2
    bes f2
  }
  d2.:m g2:m
  es2 c4:m f4
  bes2. es2
  c2:m f2
}

%--------------------------------SŁOWA
tekst = \lyricmode {
  Skosz -- tuj -- cie i zo -- bacz -- cie,
  jak do -- bry jest Pan.
  \set stanza = "1. "
  Bę -- dę Pa -- nu w_każ -- dej po -- rze
  śpie -- wał pieśń wdzięcz -- no -- ści,
  Niech z_ust mo -- ich chwa -- ła Je -- go
  nie -- u -- stan -- nie pły -- nie.
}

tekstSopranu = \tekst
tekstAltu = \tekst
tekstTenorow = \tekst
tekstBasow = \tekst

zwrotkaII = \markup \column {
  "W Panu cała chluba moja, cieszcie się pokorni;"
  "Wspólnie ze mną chwalcie Pana, sławmy Imię Jego."
}
zwrotkaIII = \markup \column {
  "Kiedym tęsknie szukał Pana, raczył mnie wysłuchać;"
  "I ze wszelkiej trwogi mojej raczył mnie wyzwolić."
}
zwrotkaIV = \markup \column {
  "Skosztujcie i zobaczcie, jaki Pan jest dobry;"
  "Kto do Niego się ucieknie, ten błogosławiony."
}
zwrotkaV = \markup \column {
  "Z czcią i lękiem służcie Panu, Święty Ludu Boży;"
  "Bo nie znają niedostatku ludzie bogobojni."
}

%--------------------------------USTAWIENIA
#(set-global-staff-size 16.5)

\include "templates/predefined-instruments/instrument-context-definitions.ily"
\include "templates/adjustable-centered-stanzas/definitions.ily"
\include "ustawienia.ily"

\paper {
  system-count = #3
}
\paper {
  top-markup-spacing #'basic-distance = 4
  markup-system-spacing #'padding = -2
  system-system-spacing #'basic-distance = 18
  score-markup-spacing #'basic-distance = 14
}

%--------------------------------STRUKTURA

\score {
  %\transpose g a
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
\override #'(line-spacing . 0.85)
\override #'(stanza-vdist . 0.55)
\stanzas-in-one-column { \zwrotkaII \zwrotkaIII \zwrotkaIV \zwrotkaV }