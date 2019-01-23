\version "2.19.3"

\header	{
  title = "O siano, siano"
  subtitle = \markup \column { " " " " " " }
  arranger = "opracowanie: Anna Szymanek"
}

%--------------------------------MUZYKA
metrumitp = {
  \key f \major
  \time 3/4
  \tempo 4=80
  \set Score.tempoHideNote = ##t
}
melodiaSopranu =
\relative f' {
  \metrumitp
  a4 a bes |
  d8([ c]) c2 |
  c4 \melisma d2 |
  d4 c2 \melismaEnd
  %-=5=-
  a4 a bes |
  d8([ c]) c2 |
  c4 \melisma d2 |
  d4 c2 \melismaEnd
  c4 bes4. g8 |
  %-=10=-
  bes4 a2 |
  bes8 bes bes4 d |
  d4 c2 |
  f,8[( g]) a4 bes |
  d4 c2 |
  %-=15=-
  c8 c bes4. g8 |
  bes4 a2 |
  c4 bes4. g8 |
  bes4 a2 |
  bes8 bes bes4 d
  %-=20=-
  d4 c2 |
  f,8[( g]) a4 bes |
  d4 c2 |
  d8 c bes4. e,8 |
  g4 f2
  \bar "|."
}
melodiaAltu =
\relative f' {
  \metrumitp
  e4 e d |
  f8([ e]) e2 |
  g4\melisma f2 |
  d4 f2\melismaEnd |
  %-=5=-
  e4 e d |
  f8([ e]) e2 |
  e4\melisma f2 |
  g4 f2\melismaEnd |
  e4 e c8[( g']) |
  %-=10=-
  g4 f2 |
  d8 d f4 d |
  d4 f2 |
  d8[( c]) f4 d |
  g4 g2 |
  %-=15=-
  e8 e d4 e8[( g]) |
  g4 f2 |
  a4 bes g8[( e]) |
  d4 f2 |
  d8 d e4 g |
  %-=20=-
  f4 c2 |
  c8[( bes]) c4 f |
  a4 g2 |
  d8 e f4 f8[( e]) |
  e4 f2
  \bar "|."
}
melodiaTenorow =
\relative f {
  \metrumitp
  R1*3/4
  R1*3/4
  c'8 c bes4. g8 |
  bes4 a2 |
  %-=5=-
  c2 \melisma bes4~ |
  bes8[ g] g2 \melismaEnd
  c8 c bes4. g8 |
  bes4 a2 |
  a4 g4. bes8 |
  %-=10=-
  bes4 c2 |
  d8 d bes4 g |
  bes4 a2 |
  a8[( g]) a4 f |
  bes4 c2 |
  %-=15=-
  a8 a g4. bes8 |
  bes4 f2 |
  f4 d'4. bes8 |
  d4 d2 |
  bes8 g g4 bes |
  %-=20=-
  a4 g2 |
  f8[( d])f4 d |
  d4 e2 |
  f8 a d4. bes8 |
  bes4 c2
  \bar "|."
}
melodiaBasow =
\relative f {
  \metrumitp
  R1*3/4
  R1*3/4
  e8 e d4 d |
  g4 f2 |
  %-=5=-
  f2\melisma e4 |
  f8[ g] e2\melismaEnd |
  g8 f d4 g |
  g4 f2 |
  e4 g e |
  %-=10=-
  g4 f( d) |
  bes8 bes d4 bes |
  bes4 a2 |
  bes8[( c]) f4 bes, |
  d4 e2 |
  %-=15=-
  f8 c d4 bes8[( d]) |
  d4 c2 |
  f4 f g8[( e]) |
  f4 d( f) |
  bes,8 bes g4 d' |
  %-=20=-
  d4 e2 |
  f4 c d |
  d4 c2 |
  d8 c bes4 d8[( e]) |
  g4 f2
  \bar "|."
}

akordy = \chordmode {
}

%--------------------------------SŁOWA
tekstSopranu = \lyricmode {
  \set stanza = "1."
  Ślicz -- na Pa -- nien -- ka a __ w_staj -- ni po -- wi -- wszy a __
  O sia -- no, sia -- no, sia -- no jak li -- li -- ja, na któ -- rym kła -- dzie Je -- zu -- sa Ma -- ry -- ja.
  O sia -- no, sia -- no, sia -- no jak li -- li -- ja, na któ -- rym kła -- dzie Je -- zu -- sa Ma -- ry -- ja.
}
tekstAltu = \tekstSopranu

tekstTenorow = \lyricmode
{
  \set stanza = "1."
  Je -- zu -- sa zro -- dzi -- ła, a __ sian -- kiem Go o -- kry -- ła.
  O sia -- no, sia -- no, sia -- no jak li -- li -- ja, na któ -- rym kła -- dzie Je -- zu -- sa Ma -- ry -- ja.
  O sia -- no, sia -- no, sia -- no jak li -- li -- ja, na któ -- rym kła -- dzie Je -- zu -- sa Ma -- ry -- ja.
}
tekstBasow = \tekstTenorow

%--------------------------------USTAWIENIA
#(set-global-staff-size 16.5)

\include "templates/predefined-instruments/instrument-context-definitions.ily"
\include "templates/adjustable-centered-stanzas/definitions.ily"
\include "ustawienia.ily"

\paper {
  top-markup-spacing.basic-distance = 10
  markup-system-spacing.basic-distance = 18
  system-system-spacing.basic-distance = 18
  score-markup-spacing.basic-distance = 14
}

\layout {
  \context
  {
    \Lyrics
    \override LyricSpace #'minimum-distance = #0.8
  }
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
