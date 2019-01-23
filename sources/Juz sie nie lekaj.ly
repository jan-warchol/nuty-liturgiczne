\version "2.19.3"

\header	{
  title = "Już się nie lękaj"
  subtitle = "(ostinato)"
  composer = "muzyka: Taizé"
}

%--------------------------------MUZYKA
metrumitp = {
  \key a \minor
  \time 4/4
  \tempo 4=80
  \set Score.tempoHideNote = ##t
}

melodiaSopranu =
\relative f' {
  \metrumitp
  e8^\p e4 g8 f4 f | d8 d4 f8 e4 e |
  a8^\mf a a4 b b | b8 b4 b8 c4 c |
  % 5
  e,8^\p e4 g8 f4 f | d8 d4 f8 e4 e |
  a^\f a b2 | gis a
  \bar "|."
}
melodiaAltu =
\relative f' {
  \metrumitp
  c8^\p c4 c8 c4 c | b8 b4 b8 b4 b |
  a8^\mf a c4 b b | e8 e4 e8 e4 e |
  % 5
  c8^\p c4 c8 c4 c | b8 b4 b8 b4 b |
  c4^\f c b2 | b c
  \bar "|."
}
melodiaTenorow =
\relative f {
  \metrumitp
  a8^\p a4 a8 a4 a | g8 g4 g8 g4 g |
  f8^\mf f f4 f f | a8 a4 gis8 a4 a |
  % 5
  a8^\p a4 a8 a4 a | g8 g4 g8 g4 g |
  f^\f f f2 | e e
  \bar "|."
}
melodiaBasow =
\relative f {
  \metrumitp
  a,8^\p a4 a8 d4 d | g,8 g4 g8 c4 c |
  f8^\mf f f4 d d | e8 e4 e8 a,4 a |
  % 5
  a8^\p a4 a8 d4 d | g,8 g4 g8 c4 c |
  f^\f f d2 | e a,
  \bar "|."
}

akordy = \chordmode {
  a2:m d:m7 g c:maj7
  f b:dim e:sus4 a:m
  a2:m d:m7 g c:maj7
  f b:dim e a:m
}

%--------------------------------SŁOWA
tekst = \lyricmode {
  \set stanza = "1."
  Już się nie lę -- kaj, po -- rzuć zmar -- twie -- nia,
  Bo -- gu za -- u -- faj, nic ci nie gro -- zi.
  Już się nie lę -- kaj, po -- rzuć zmar -- twie -- nia,
  Bóg mi -- ło -- ścią jest.
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
