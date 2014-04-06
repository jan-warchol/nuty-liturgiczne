\version "2.19.3"

\header	{
  title = "Cicha noc"
  subtitle = \markup \column { " " " " }
  composer = "muzyka: Franz Xaver Gruber (1787-1863)"
  poet = \markup \column {
    "słowa: ks. Józef Mohr (1792-1848)"
    "tłumaczenie: Piotr Maszyński"
  }
}

%--------------------------------MUZYKA
metrumitp = {
  \key c \major
  \time 6/8
  \tempo 4 = 50
  \set Score.tempoHideNote = ##t
}

melodiaSopranu =
\relative f' {
  \metrumitp
  g8.[( a16]) g8 e4. |
  g8.[( a16]) g8 e4. \breathe |
  d'4 d8 b4 b8 |
  c4 c8 g4. \breathe |
  % 5
  a4 a8 c8.[( b16)] a8 |
  g8.[( a16)] g8 e4 e8 \breathe |
  a4 a8 c8.[( b16)] a8 |
  g8.[( a16)] g8 e4 e8 \breathe |
  % 9
  d'4 d8 f8.[( d16)] b8 |
  c4.( e\fermata) \breathe |
  c8.[( g16)] e8 g8.[( f16)] d8 |
  c2.
  \bar "|."
}
melodiaAltu =
\relative f' {
  \metrumitp
  e8.[( f16]) e8 c4. |
  c4 c8 c4. \breathe |
  d4 a'8 g4 f8 |
  e4 e8 c4. \breathe |
  % 5
  c4 c8 f4 f8 |
  e4 b8 c4 c8 \breathe |
  f4 f8 a8.[( g16)] f8 |
  e4 b8 c4 c8 \breathe |
  % 9
  f4 a8 g4 f8 |
  e4.( b') \breathe |
  e,4 c8 b4 b8 |
  c2.
  \bar "|."
}
melodiaBasow =
\relative f {
  \metrumitp
  r4. g8.[( a16]) g8 |
  e4. g8.[( a16]) g8 \breathe |
  f4 f8 g4 g8 |
  c,4 c8 e4. \breathe |
  % 5
  f4 e8 d4 d8 |
  e4 e8 a4 a8 \breathe |
  f4 f8 d4 d8 |
  e4 e8 a,4 a8 \breathe |
  % 9
  d4 f8 g4 g8 |
  a4.( g) \breathe |
  c,4 c8 d4 g8 |
  c,2.
  \bar "|."
}

akordy = \chordmode {
  %czy e-molle na początku w akordach nie są przekombinowane?
  e4.:m c e:m c d4.:m g c2.
  f4. d:m7 e:m a:m f d:m7 e:m a:m
  d:m g:7 a:m e:m c g c2.
}

%--------------------------------SŁOWA
tekstSopranu = \lyricmode {
  \set stanza = "1."
  Ci -- cha noc! | Świę -- ta noc! |
  Po -- kój nie -- sie | lu -- dziom wszem, | \break
  a u żłó -- bka | Ma -- tka Świę -- ta |
  czu -- wa sa -- ma | u -- śmiech -- nię -- ta | \break
  nad Dzie -- cią -- tka | snem, |
  nad Dzie -- cią -- tka | snem. |
}

tekstAltu = \tekstSopranu

tekstBasow = \lyricmode {
  \set stanza = "1."
  Ci -- cha | noc! Świę -- ta! |
  Po -- kój nie -- sie | lu -- dziom wszem, |
  a u żłó -- bka | Ma -- tka Świę -- ta |
  czu -- wa sa -- ma | u -- śmiech -- nię -- ta |
  nad Dzie -- cią -- tka | snem, |
  nad Dzie -- cią -- tka | snem. |
}

zwrotkaII = \markup \column {
  "Cicha noc, święta noc!"
  "Pastuszkowie od swych trzód"
  "biegną wielce zadziwieni"
  "za anielskich głosem pieni,"
  "gdzie się spełnił cud,"
  "gdzie się spełnił cud."
}
zwrotkaIII = \markup \column {
  "Cicha noc, święta noc!"
  "Narodzony Boży Syn,"
  "Pan wielkiego majestatu"
  "niesie dziś całemu światu"
  "odkupienie win,"
  "odkupienie win."
}

%--------------------------------USTAWIENIA
#(set-global-staff-size 17)

\include "templates/predefined-instruments/instrument-context-definitions.ily"
\include "templates/adjustable-centered-stanzas/definitions.ily"
\include "ustawienia.ily"

\paper {
  top-markup-spacing #'basic-distance = 8
  markup-system-spacing #'basic-distance = 24
  system-system-spacing #'basic-distance = 18
  score-markup-spacing #'basic-distance = 16
  left-margin = 20 \mm
  right-margin = 20 \mm
}

%--------------------------------STRUKTURA
\score {
  \new ChoirStaff <<
    \new ChordNames \akordy

    \new SopranoVoice = sopran \melodiaSopranu
    \new Lyrics \lyricsto sopran \tekstSopranu

    \new AltoVoice = alt \melodiaAltu
    \new Lyrics \lyricsto alt \tekstAltu

    \new BassVoice = bas \melodiaBasow
    \new Lyrics \lyricsto bas \tekstBasow
  >>
  \layout {}
  \midi {}
}

\markup \stanzas-in-two-columns { \zwrotkaII } { \zwrotkaIII }
