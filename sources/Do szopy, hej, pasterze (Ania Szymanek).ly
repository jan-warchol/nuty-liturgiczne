\version "2.19.3"

\header	{
  title = "Do szopy, hej, pasterze"
  subtitle = " "
  arranger = "opracowanie: Anna Szymanek"
}

%--------------------------------MUZYKA
metrumitp = {
  \key f \major
  \time 3/4
  \tempo 4=120
  \set Score.tempoHideNote = ##t
}

\paper
{
  system-count = #3
}

melodiaSolo =
\relative c'' {
  \metrumitp
  \partial 4 c4 f2.
  e2 e4
  d2.
  c2 a4
  %-=5=-
  d2.
  e2.
  g2 e4
  f2 e4
  e2.
  %-=10=-
  d2 g,4
  bes d c8 b
  c2 c4
  d2.
  e2.
  %-=15=-
  g2 e4
  f2 r4
  \bar "|."
}
melodiaSopranu =
\relative c'' {
  \metrumitp
  \partial 4 c4 c bes bes8 a
  bes4 a c
  d c c8 c
  a2 c4
  %-=5=-
  bes a g8 f
  c'4 c a
  c c a8 bes
  c2 c4
  a a d8 c
  %-=10=-
  c4 bes g
  bes d c8 b
  c2 a4
  f a d8 c
  bes4 bes c
  %-=15=-
  c bes a8 g
  a2 r4
  \bar "|."
}
melodiaAltu =
\relative c' {
  \metrumitp
  \partial 4 c4 f f g8 f
  e4 e c
  g' g a8 g
  f2 c4
  %-=5=-
  f f g8 f
  e4 e c
  g' g a8 g
  f2 e4
  e c e8 f
  %-=10=-
  g4 d e
  d d c8 b
  c2 c4
  a' a bes8 a
  g4 g c,
  %-=15=-
  g' g a8 g
  f2 r4
  \bar "|."
}
melodiaTenorow =
\relative c' {
  \metrumitp
  \partial 4 c4 a bes d8 c
  g4 a f
  g c a8 c
  c2 c4
  %-=5=-
  bes a d8 c
  a4 g c
  g c c8 bes
  a2 c,4
  a' a bes8 a
  %-=10=-
  g4 g g
  bes d c8 b
  c2 f,4
  f f g8 c
  g4 bes a
  %-=15=-
  g bes a8 bes
  c2 r4
  \bar "|."
}
melodiaBasow =
\relative c {
  \metrumitp
  \partial 4 c4 f d d8 f
  e4 c a
  bes e e8 c
  f2 c4
  %-=5=-
  f, c' d8 f
  e4 c f
  c c d8 c
  f2 e4
  c e d8 e
  %-=10=-
  d4 g e
  f d c8 b
  c2 f4
  c f d8 e
  e4 g e
  %-=15=-
  c bes c8 bes
  f2 r4
  \bar "|."
}

akordy = \chordmode {
}

%--------------------------------SŁOWA
soloTekst = \lyricmode {
  \set stanza = "1."
  Do szo -- py, pa -- ste -- rze, by zba -- wić lu -- dzki ród!
  Śpie -- waj -- cie, pa -- ste -- rze graj -- cie Mu, nie zbudź -- cie Go ze snu!
}
chorTekst = \lyricmode {
  \set stanza = "1."
  Do szo -- py, hej, pa -- ste -- rze, do szo -- py, bo tam cud!
  Syn Bo -- ży w_żło -- bie le -- ży, by zba -- wić lu -- dzki ród!
  Śpie -- waj -- cie a -- nio -- ło -- wie, pa -- ste -- rze graj -- cie Mu,
  kła -- niaj -- cie się kró -- lo -- wie, nie zbudź -- cie Go ze snu!
}

tekstSopranu = \chorTekst
tekstAltu = \chorTekst
tekstTenorow = \chorTekst
tekstBasow = \chorTekst

%--------------------------------USTAWIENIA
#(set-global-staff-size 16.5)

\include "templates/predefined-instruments/instrument-context-definitions.ily"
\include "templates/adjustable-centered-stanzas/definitions.ily"
\include "ustawienia.ily"

\paper {
  top-markup-spacing #'basic-distance = 7
  markup-system-spacing #'basic-distance = 18
  system-system-spacing #'basic-distance = 18
  last-bottom-spacing #'basic-distance = 18
}

%--------------------------------STRUKTURA

\score {
  \new ChoirStaff <<
    \new ChordNames \akordy

    \new SopranoVoice = solo \melodiaSolo
    \new Lyrics \lyricsto solo \soloTekst

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
