\version "2.19.3"

\header	{
  title = "Wielkie i dziwne są dzieła Twoje"
  subtitle = " "
  composer = "muzyka: ks. H. Markwica"
  arranger = "opracowanie: Marek Miziołek"
  poet = "słowa: por. Ap 15, 3-4"
}

%--------------------------------MUZYKA
metrumitp = {
  \key g \major
  \time 2/4
}

melodiaSopranu =
\relative f' {
  \metrumitp
  g4 g8 g8
  fis4 fis4 |
  a4 a8 e8 |
  g8( fis8) e4 |
  b'4 b4 |
  a4 a4 |
  a4 a4 |
  g4 fis4 |
  g4 g8 g8 |
  d4 d4 |
  d4 d8 d8 |
  e4 e4 |
  \break
  e2 |
  fis4. fis8 |
  g8( fis8) e4 ~ |
  e r4 |
  e2 |
  fis4. fis8 |
  g8( fis8) e4 ~ |
  e4 r |
  \bar "|."
}
melodiaAltu =
\relative f' {
  \metrumitp
  g4 g8 g8
  fis4 fis4 |
  e4 e8 c8 |
  d4 e4 |
  e4 e4 |
  a8( g8) a4 |
  e4 e4 |
  c4 d4 |
  d4 d8 g8 |
  e4 d4 |
  a4 b8 a8 |
  b4 b4 |
  e2 |
  d4. d8 |
  e8( d8) e4 ~ |
  e4 r4 |
  e2 |
  d4. d8 |
  e8( d8) e4 ~ |
  e4 r4 |
  \bar "|."
}
melodiaTenorow =
\relative f {
  \metrumitp
  b4 b8
  d8 |
  a4 a4 |
  c4 d8 e8 |
  g8( d8) e4 |
  b4 b4 |
  d4 d4 |
  e4 e4 |
  c4 d4 |
  g,4 d8 g8 |
  a8( g8) a4 |
  d4 b8 d8 |
  g8( fis8) e4 |
  c8( b8 a8 g8) |
  a4. a8 |
  b8( a8) b4 ~ |
  b4 r4 |
  e,8( fis8 g4) |
  a4. a8 |
  b8( a8) b4 ~ |
  b4 r4 |
  \bar "|."
}
melodiaBasow =
\relative f {
  \metrumitp
  b,4 b8 d8 |
  a4 a4 |
  a4 a8 e8 |
  g4 b4 |
  g4 g4 |
  d'4 d4 |
  a4 b8( c8) |
  d4 d4 |
  g,4 g8 g8 |
  d'4 d4 |
  b4 b8 b8 |
  c8( b8) a4 |
  c2 |
  a4. a8 |
  b8( a8) b4 ~ |
  b4 r4 |
  c2 |
  a4. a8 |
  b8( a8) b4 ~ |
  b4 r4 |
  \bar "|."
}
akordy = \chordmode {
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
  top-markup-spacing #'basic-distance = 8
  markup-system-spacing #'basic-distance = 18
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

\markup \stanzas-in-two-columns { \zwrotkaII } { \zwrotkaIII }
