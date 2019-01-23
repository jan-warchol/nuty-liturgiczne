\version "2.19.3"

\header	{
  title = "Niech oblicze Twe"
  subtitle = " "
  composer = "muzyka: Jacek Sykulski"
}

%--------------------------------MUZYKA
metrumitp = {
  \key d \minor
  \time 4/4
  \tempo 4=80
  \set Score.tempoHideNote = ##t
  \partial 4
}

melodiaSopranu =
\relative f' {
  \metrumitp
  d8 e | f4 e d f8 g | a2.
  a8 c | d4 c4. d8 c f, | g2.
  c8 a | f4 e d e8 e | d2. r4
  \bar "|."
}
melodiaAltu =
\relative f' {
  \metrumitp
  d8 cis | d4 cis d d8 e | f2.
  f8 f | f4 f4. f8 f d | e2.
  e8 e | d4 d8[\melisma cis]\melismaEnd d4 d8 cis | d2. r4
  \bar "|."
}
melodiaTenorow =
\relative f {
  \metrumitp
  a8 a | a4 a a a8 c | c2.
  c8 c | bes4 a4. bes8 c a | c2.
  c8 c | a4 a a bes8 a | a2. r4
  \bar "|."
}
melodiaBasow =
\relative f {
  \metrumitp
  d8 a | d4 a d d8 c | f2.
  f8 a, | bes4 f'4. bes,8 a d | c2.
  a8 a | d4 a d g,8 a | d2. r4
  \bar "|."
}
%{
  Tutaj zkordy zmieniają się co jedną nutę,
  więc albo jest ich za dużo (i brzmi to zresztą dość dziwnie),
  albo w ogóle nie zgadzają się z melodią.
  Co zrobić?
%}
akordy = \chordmode {
  d8:m a d4:m a d4.:m c8 f1
  bes4 f4. bes8 a:m d:m c2.
  a4:m d:m a d:m g8:m a d2:m
}

%--------------------------------SŁOWA
tekst = \lyricmode {
  Niech o --  | bli -- cze Twe, Pa -- nie | mój,
  za -- ja --  | śnie -- je nad słu -- gą  | Twym,
  niech prze -- | ni -- ka mnie Je -- go | blask.
}

tekstSopranu = \tekst
tekstAltu = \tekst
tekstTenorow = \tekst
tekstBasow = \tekst

%--------------------------------USTAWIENIA
#(set-global-staff-size 17)

\include "templates/predefined-instruments/instrument-context-definitions.ily"
\include "templates/adjustable-centered-stanzas/definitions.ily"
\include "ustawienia.ily"

\paper {
  system-count = 2
  top-markup-spacing.basic-distance = 8
  markup-system-spacing.basic-distance = 18
  system-system-spacing.basic-distance = 20
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
