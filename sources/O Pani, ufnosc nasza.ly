\version "2.19.3"

\header	{
  title = "O Pani, ufność nasza"
  subtitle = "(ostinato)"
  subsubtitle = " "
  composer = "muzyka: Jacek Gałuszka OP"
}

%--------------------------------MUZYKA
metrumitp = {
  \key es \major
  \time 3/4
  \tempo 4=90
  \set Score.tempoHideNote = ##t
  \partial 4
}

melodiaSopranu =
\relative f' {
  \metrumitp
  es4 |
  bes' bes c8 as |
  bes4 bes as |
  g g8[\melisma f]\melismaEnd g as |
  f4 f g |
  es2 bes'8[\melisma f]\melismaEnd |
  g2 as4 |
  g as8 g f4 |
  es2 r4
  \bar "|."
}
melodiaAltu =
\relative f' {
  \metrumitp
  bes,4 |
  g' g as8 f |
  g4 g f |
  es es es8 es |
  d4 d d |
  c2 d4 |
  es2 es8[\melisma f]\melismaEnd |
  es4 es8 es es[\melisma d]\melismaEnd |
  bes2 r4
  \bar "|."
}
melodiaTenorow =
\relative f {
  \metrumitp
  g4 |
  bes bes bes8 bes |
  bes4 bes c |
  bes bes bes8 bes |
  bes4 bes b |
  g2 bes4 |
  bes2 c8[\melisma d]\melismaEnd |
  bes4 c8 c bes4 |
  g2 r4
  \bar "|."
}
melodiaBasow =
\relative f {
  \metrumitp
  es4 |
  es es es8 es |
  es4 es es |
  es es es8 es |
  bes4 bes g |
  c2 bes4 |
  es2 as,8[\melisma bes]\melismaEnd |
  es4 as,8 as bes4 |
  es2 r4
  \bar "|."
}

akordy = \chordmode {
  % Inna możliwość: Es As Es As Es B G c B Es B7 Es As B Es
  s4 es2 es4:sus4 es2 f4:m7 es2. bes2
  g4  c2:m bes4 es2 as4 es as bes es2
}

%--------------------------------SŁOWA
tekst = \lyricmode {
  O Pa -- ni,
  u -- fność na -- sza
  w_mo -- dli -- twy
  Twej o -- bro -- nie,
  chroń nas, chroń nas,
  Kró -- lo -- wo Po -- ko -- ju!
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
  top-markup-spacing.basic-distance = 10
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
