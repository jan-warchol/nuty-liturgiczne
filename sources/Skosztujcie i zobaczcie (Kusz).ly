\version "2.19.3"

\header	{
  title = "Skosztujcie i zobaczcie"
  subtitle = "Psalm 34"
  composer = "muzyka: ks. Stanisław Ziemiański SJ"
  arranger = "opracowanie: Dawid Kusz OP"
}

%--------------------------------MUZYKA
metrumitp = {
  \key bes \major
  \time 2/4
  \tempo 4=75
  \set Score.tempoHideNote = ##t
}

melodiaSopranu =
\relative f' {
  \metrumitp
  \repeat volta 2 {
    r8 g a bes | c bes a[\melisma bes]\melismaEnd g4.
    g8 | f4 d8 es | f2 |
  }
  \time 3/4
  \set Score.beamExceptions = #'()
  f8 f g g bes g | a4 a2 |
  \time 2/4
  g8 g a bes | g4 f |
  \time 3/4
  \set Score.beamExceptions = #'()
  bes8 bes bes bes c bes | g4 g2 |
  \time 2/4
  f8 f d es | f4 f
  \bar "|."
}
melodiaAltu =
\relative f' {
  \metrumitp
  \repeat volta 2 {
    r8 d d g | a f f4 | f4( es8)
    es | d[\melisma c]\melismaEnd bes bes | c2 |
  }
  d8 c es es d es | f4 f2 |
  f8 es es es | es[\melisma d]\melismaEnd c4 |
  g'8 g g g f f | f16[\melisma es d8]\melismaEnd es2 |
  d8 c bes bes | c[\melisma d]\melismaEnd c4 |
  \bar "|."
}
melodiaTenorow =
\relative f {
  \metrumitp
  \repeat volta 2 {
    r8 bes bes es | c c c[\melisma bes]\melismaEnd | c4.
    bes8 | bes4 f8 g | bes4( a) |
  }
  bes8 a bes bes bes bes | c4 d2 |
  bes8 bes bes bes | c[\melisma bes]\melismaEnd a4 |
  es'8 d c bes a bes | bes4 bes2 |
  bes8 a f g | c[\melisma bes]\melismaEnd a4 |
  \bar "|."
}
melodiaBasow =
\relative f {
  \metrumitp
  \repeat volta 2 {
    r8 g g es | f f f16[\melisma es d8]\melismaEnd | es4.
    es8 | bes4 bes8 bes | f'2 |
  }
  bes,8 f' es es g g | f4 d2 |
  es8 es es d | c4 f |
  es8 es es es f d | es4 es2 |
  bes8 bes bes bes | f'4 f |
  \bar "|."
}

akordy = \chordmode {
  \repeat volta 2 {
    g2:m f es bes f
  }
  bes8 f es2 f4 d2:m
  es2 c4:m f
  es2 f8 bes es2.
  bes2 f
}

%--------------------------------SŁOWA
tekst = \lyricmode {
  Sko -- sztuj -- cie i zo -- ba -- czcie,
  jak do -- bry jest Pan.
  \set stanza = "1."
  Bę -- dę Pa -- nu w_każ -- dej po -- rze
  śpie -- wał pieśń wdzię -- czno -- ści,
  Na mych us -- tach chwa -- ła Je -- go
  nie -- u -- stan -- nie go -- ści.
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
  top-markup-spacing #'basic-distance = 5
  markup-system-spacing #'padding = 0
  system-system-spacing #'basic-distance = 18
  score-markup-spacing #'basic-distance = 14
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
\override #'(line-spacing . 0.85)
\override #'(stanza-vdist . 0.55)
\stanzas-in-one-column { \zwrotkaII \zwrotkaIII \zwrotkaIV \zwrotkaV }
