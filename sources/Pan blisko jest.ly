\version "2.19.3"

\header	{
  title = "Pan blisko jest"
  subtitle = "(ostinato)"
  subsubtitle = " "
  arranger = "opracowanie: Taizé"
}

%--------------------------------MUZYKA
metrumitp = {
  \key e \minor
  \time 2/2
  \tempo 4=100
  \set Score.tempoHideNote = ##t
}

melodiaSopranu =
\relative f' {
  \metrumitp
  g2 g4. e8 |
  g2 r4 g |
  fis2 fis |
  fis2. r4 | \break
  g2 a4. a8 |
  b2 r4 b |
  c2 b |
  e,2. r4
  \bar "|."
}
melodiaAltu =
\relative f' {
  \metrumitp
  e2 e4. e8 |
  e2 r4 e |
  e2 e |
  dis2. r4 |
  e2 fis4. fis8 |
  g2 r4 g |
  e2 dis |
  e2. r4
  \bar "|."
}
melodiaTenorow =
\relative f {
  \metrumitp
  b2 b4. b8
  c2 r4 c
  c2 c
  b2. r4 |
  b2 d4. d8
  d2 r4 g,
  a( g) fis2
  g2. r4
  \bar "|."
}
melodiaBasow =
\relative f {
  \metrumitp
  e2 e4. e8
  c2 r4 c
  a2 a
  b2. r4 |
  e2 d4. d8
  g2 r4 e
  a,2 b
  e2. r4
  \bar "|."
}

akordy = \chordmode {
}

%--------------------------------SŁOWA
tekst = \lyricmode {
  Pan bli -- sko jest, o -- cze -- kuj Go.
  Pan bli -- sko jest, w_Nim ser -- ca moc.
}

tekstSopranu = \tekst
tekstAltu = \tekst
tekstTenorow = \tekst
tekstBasow = \tekst

%--------------------------------USTAWIENIA
#(set-global-staff-size 18)

\include "templates/predefined-instruments/instrument-context-definitions.ily"
\include "templates/adjustable-centered-stanzas/definitions.ily"
\include "ustawienia.ily"

\paper {
  top-markup-spacing #'basic-distance = 10
  markup-system-spacing #'basic-distance = 18
  system-system-spacing #'basic-distance = 18
  score-markup-spacing #'basic-distance = 14
  left-margin = 25 \mm
  right-margin = 25 \mm
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
