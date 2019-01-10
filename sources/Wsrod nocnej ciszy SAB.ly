\version "2.19.3"

\header	{
  title = "Wśród nocnej ciszy"
  subtitle = " "
}

%--------------------------------MUZYKA
metrumitp = {
  \key g \major
  \time 4/4
  \tempo 4 = 120
  \set Score.tempoHideNote = ##t
}

melodiaSopranu =
\relative f' {
  \metrumitp
  g2 a4 fis | g2 d | b'4 b c a | b2 r2 |
  g2 a4 fis | g2 d | b'4 b c a | b2 r2 |
  g4 b g b | c4. a8 fis4 d |
  g b g b | c4. a8 fis4 d |
  g g a a | g2 r2
  \bar "|."
}
melodiaAltu =
\relative f' {
  \metrumitp
  b,2 c4 c | b2 a | d4 e e fis | g2 r2 |
  b,2 c4 c | b2 a | d4 e e fis | g2 r2 |
  b,4 d b d | d4. d8 d4 c |
  b4 d b d | d4. d8 d4 c |
  b b e fis | g2 r2
  \bar "|."
}
melodiaBasow =
\relative f {
  \metrumitp
  g2 d4 d | e2 fis | g4 g a d, | g2 r2 |
  g2 d4 d | e2 fis | g4 g a d, | g2 r2 |
  g4 g g g | fis4. fis8 d4 fis |
  g4 g g g | fis4. fis8 d4 fis |
  g e c d | g2 r2
  \bar "|."
}

\include "input-shorthands/optional-chord/definitions.ily"

akordy = \chordmode {
  g2 d:7 e:m d g a4:m \optionalChord d g1
  g2 d:7 e:m d g a4:m \optionalChord d g1
  g1 d:7 g d:7 e2:m a4:m \optionalChord d g1
}

%--------------------------------SŁOWA
tekst = \lyricmode {
  \set stanza = "1."
  Wśród noc -- nej | ci -- szy | głos się roz -- cho -- | dzi: |
  Wstań -- cie, pa -- | ste -- rze, | Bóg się wam ro -- | dzi! |
  Czem prę -- dzej się | wy -- bie -- raj -- cie, |
  do Bet -- le -- jem | po -- spie -- szaj -- cie |
  przy -- wi -- tać Pa -- | na!
}

tekstSopranu = \tekst
tekstAltu = \tekst
tekstBasow = \tekst

zwrotkaII = \markup \column {
  "Poszli, znaleźli Dzieciątko w żłobie,"
  "z wszystkimi znaki danymi sobie."
  "Jako Bogu cześć Mu dali,"
  "A witając zawołali z wielkiej radości:"
}
zwrotkaIII = \markup \column {
  "Ach, witaj Zbawco, z dawna żądany!"
  "Tyle tysięcy lat wyglądany!"
  "Na Ciebie króle, prorocy"
  "Czekali, a Tyś tej nocy nam się objawił!"
}
zwrotkaIV = \markup \column {
  "I my czekamy na Ciebie, Pana,"
  "A skoro przyjdziesz na głos kapłana,"
  "Padniemy na twarz przed Tobą,"
  "Wierząc żeś jest pod osłoną chleba i wina."
}

%--------------------------------USTAWIENIA
#(set-global-staff-size 17)

\include "templates/predefined-instruments/instrument-context-definitions.ily"
\include "templates/adjustable-centered-stanzas/definitions.ily"
\include "ustawienia.ily"

\paper {
  top-markup-spacing.basic-distance = 8
  markup-system-spacing.basic-distance = 18
  system-system-spacing.basic-distance = 18
  score-markup-spacing.basic-distance = 18
  left-margin = 20 \mm
  right-margin = 20 \mm
  system-count = 3
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
