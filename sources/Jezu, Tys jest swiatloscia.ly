\version "2.19.3"

\header	{
  title = "Jezu, Tyś jest światłością"
  subtitle = "(ostinato)"
  composer = "muzyka: Taizé"
}

%--------------------------------MUZYKA
metrumitp = {
  \key b \minor
  \time 4/4
  \tempo 4=70
  \set Score.tempoHideNote = ##t
}

melodiaSopranu =
\relative f' {
  \metrumitp
  b8 b4 fis8 g4 r8 e |
  a4 a8 e fis4 fis |
  d d8 d e4 d8 e |
  fis fis b b ais2 |
  % 5
  b8 b4 fis8 g4 r8 e |
  cis'4 cis8 a fis4 fis |
  d d e4 d8 e |
  fis4 b8 ais b2
  \bar "|."
}
melodiaAltu =
\relative f' {
  \metrumitp
  d8 d4 d8 e4 r8 e |
  cis4 b8 cis d4 d |
  d d8 d cis4 b8 cis |
  d d e e fis2 |
  % 5
  d8 d4 d8 e4 r8 e |
  cis4 b8 cis d4 d |
  d d e4 d8 e |
  d4 cis8 cis d2
  \bar "|."
}
melodiaTenorow =
\relative f {
  \metrumitp
  fis8 fis4 b8 b4 r8 g |
  e4 e8 a a4 a |
  b fis8 fis a4 a8 a |
  a a b b cis2 |
  % 5
  b8 fis4 b8 b4 r8 g |
  e4 e8 a a4 a |
  b b b b8 b |
  b4 fis8 fis fis2
  \bar "|."
}
melodiaBasow =
\relative f {
  \metrumitp
  b,8 b4 b8 e4 r8 e |
  a,4 a8 a d4 d |
  b b8 b a4 a8 a |
  d d g g fis2 |
  % 5
  b,8 b4 b8 e4 r8 e |
  a,4 a8 a d4 d |
  g g g g8 g |
  fis4 fis8 fis b,2
  \bar "|."
}

akordy = \chordmode {
  b2:m e:m a d b:m a d4 e:m fis2
  b2:m e:m a d g e:m b4:m fis b2:m
}

%--------------------------------SŁOWA
tekst = \lyricmode {
  Je -- zu, Tyś jest świa --  | tło -- ścią mej du -- szy,  |
  niech cie -- mność ma nie prze --  | ma -- wia do mnie już! |
  % 5
  Je -- zu, Tyś jest świa --  | tło -- ścią mej du -- szy,  |
  daj mi moc przy -- jąć  | dziś mi -- łość Twą.
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
