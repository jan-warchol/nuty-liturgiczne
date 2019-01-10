\version "2.19.3"

\header	{
  title = "Wielkie i dziwne są dzieła Twoje"
  subsubtitle = "wersja 2 - nieco inna harmonizacja"
  composer = "muzyka: ks. H. Markwica"
  arranger = "opracowanie: Łukasz Czerwiński, Jan Warchoł"
  poet = "słowa: por. Ap 15, 3-4"
}

%--------------------------------MUZYKA
metrumitp = {
  \key g \major
  \time 2/4
  \tempo Moderato 4=75
}

melodiaSopranu =
\relative f' {
  \metrumitp
  g4 g8 g | fis4 fis | a a8 e | g8 ([fis8]) e4 |
  b'4 b4 | a4 a | a a4 | g4 fis |
  g g8 g | d4 d | d d8 d | e4 e |
  \break
  % 13: Królu narodów...
  e2 | fis4. fis8 | g ([fis]) e4 ~ | e2 |
  e2 | fis4. fis8 | g ([fis]) e4 ~ | e2
  \bar "|."
}
melodiaAltu =
\relative f' {
  \metrumitp
  e4 e8 e | d4 d | e d8 c | b4 b4 |
  d4. d8 | fis4 fis | e4. e8 | e4 d |
  d d8 d8 | a4 a | b b8 d8 | e4 e |
  % 13: Królu narodów...
  c2 | d4. d8 | e8 ([d]) e4 ~ | e2 |
  c2 | d4. d8 | e8 ([fis8]) e4 ~ | e2
  \bar "|."
}
melodiaTenorow =
\relative f {
  \metrumitp
  b4 b8 b8 | a4 a | c4 b8 a8 | g4 g4 |
  b4 b4 | a4 a4 | a4. a8 | c4 a4 |
  r8 b b b | a4 a | r8 fis g a | g4 g |
  % 13: Królu narodów...
  r2 | a | b4. a8 | b ([a]) g4 |
  r4 c4 | a4. a8 | b8 ([a8]) g4 ~ | g2
  \bar "|."
}
melodiaBasow =
\relative f {
  \metrumitp
  e4 e8 e8 | d4 d | a4 a8 c8 | e4 e4 |
  g4. g8 | d4 d4 | c4 c4 | c4 d4 |
  g a8 g | fis4 d | fis g8 fis | e4 e |
  % 13: Królu narodów...
  r2 | d2 | e4. e8 | g8 ([fis]) e4 |
  r4 c4 | d4. d8 | g8 ([fis8]) e4 ~ | e2
  \bar "|."
}

\include "input-shorthands/optional-chord/definitions.ily"

akordy = \chordmode {
  e2:m d a:m e:m g d
  a2:m c4 d g2 d b4:m \optionalChord g8 \optionalChord d e2:m
  %Królu narodów
  c2 d e1:m
  c2 d e1:m
}

%--------------------------------SŁOWA
tekst = \lyricmode {
  \set stanza = "1."
  Wiel -- kie i dziw -- ne są dzie -- ła Two -- je,
  Pa -- nie Bo -- że Wszech -- mo -- gą -- cy
  i spra -- wie -- dli -- we są dro -- gi Two -- je,
  Kró -- lu na -- ro -- dów,
  Kró -- lu na -- ro -- dów.
}

tekstSopranu = \tekst
tekstAltu = \tekst
tekstTenorow = \tekst
tekstBasow = \tekst

zwrotkaII = \markup \column {
  "Któż by się nie bał Ciebie, o Boże,"
  "I nie uwielbił Twego Imienia,"
  "Gdyż sprawiedliwe są sądy Twoje,"
  "Królu Narodów."
}
zwrotkaIII = \markup \column {
  "Toteż przyjdą wszystkie narody"
  "I oddadzą Tobie pokłon,"
  "Gdyż sprawiedliwe są rządy Twoje,"
  "Królu Narodów."
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

\markup \stanzas-in-two-columns { \zwrotkaII } { \zwrotkaIII }
