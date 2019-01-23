\version "2.19.3"

\header	{
  title = "Pan jest mocą"
  subtitle = "(ostinato)"
  subsubtitle = " "
  composer = "muzyka: Jacques Berthier, Taizé"
}

%--------------------------------MUZYKA
metrumitp = {
  \key f \major
  \time 3/4
  \partial 4
  \tempo 4=69
}

melodiaSopranu =
\relative f' {
  \metrumitp
  f8 g |
  a4 a8 a g f |
  d4 c f8 g |
  a4. a8 f4 |
  g2 c,8 c |
  d4. d8 \times 2/3 { e d e } |
  % 6
  f4. f8 g g |
  a4 a8 a d bes |
  g4. g8 c a |
  f4 f8 d f e |
  f2 r4
  \bar "|."
}
melodiaAltu =
\relative f' {
  \metrumitp
  d8 e |
  f4 f8 f c c |
  d4 c d8 e |
  f4. f8 d4 |
  e2 c8 c |
  d4. d8 \times 2/3 { cis b cis } |
  % 6
  d4. d8 e e |
  f4 f8 f g g |
  e4. e8 e e |
  d4 d8 d d c |
  c2 r4
  \bar "|."
}
melodiaTenorow =
\relative f {
  \metrumitp
  a8 c |
  c4 c8 c f, f |
  f4 e a8 c |
  c4. c8 c4 |
  c2 c8 c |
  f,4. f8 \times 2/3 { a a a } |
  % 6
  a4. a8 c c |
  c4 c8 c d d |
  c4. c8 c c |
  a4 a8 f a g |
  a2 r4
  \bar "|."
}
melodiaBasow =
\relative f {
  \metrumitp
  d8 c |
  f4 f8 f a, a |
  bes4 c d8 c |
  <f f,>4. <f f,>8 a,4 |
  c2 c8 c |
  bes4. bes8 \times 2/3 { a a a } |
  % 6
  d4. d8 c c |
  f4 f8 f bes, bes |
  c4. c8 a a |
  d4 d8 d bes c |
  f,2 r4
  \bar "|."
}

akordy = \chordmode {
  d8:m c f2. bes4 c2 f2. c bes2 a4
  d2:m c4 f2 g4:m c2 a4:m d2:m bes8:maj7 c f2
}

%--------------------------------SŁOWA
tekst = \lyricmode {
  Pan jest |
  mo -- cą swo -- je -- go |
  lu -- du, pie -- śnią |
  mo -- ją jest |
  Pan. Mo -- ja |
  tar -- cza i mo -- ja |
  moc, On jest mym |
  Bo -- giem, nie jes -- tem |
  sam, w_Nim mo -- ja |
  si -- ła, nie jes -- tem |
  sam.
}
englishLyrics =  \lyricmode {
  \tiny {
    In the Lord I'll be ev -- er thank -- ful,
    in the Lord I will_re -- joice!
    Look to Him, do not be a -- fraid;
    in Him re -- joi -- cing: the Lord is near,
    in Him re -- joi -- cing: the Lord is near.
  }
}
tlumaczenie = \markup {
  \column {
    \small
    \typewriter {
      \bold
      "In the Lord I'll be ever             thankful,       in the Lord I will   rejoice!"
      "W      Panu będę    zawsze [składał] dziękczynienie, w      Panu będę się radował!"
      \vspace #1
      \bold
      "Look   to Him,   do not be afraid;  in Him rejoicing:    the Lord is   near."
      "Spójrz na Niego, nie       bój się; w  Nim się rozraduj: Pan      jest blisko."
    }
  }
}

%--------------------------------USTAWIENIA
#(set-global-staff-size 17)

\include "templates/predefined-instruments/instrument-context-definitions.ily"
\include "templates/adjustable-centered-stanzas/definitions.ily"
\include "ustawienia.ily"

\paper {
  top-markup-spacing.basic-distance = 10
  system-system-spacing.basic-distance = 20
  score-markup-spacing.basic-distance = 18
}

%--------------------------------STRUKTURA
\score {
  \new ChoirStaff <<
    \new ChordNames \akordy

    \new SopranoVoice = sopran \melodiaSopranu
    \new Lyrics \lyricsto sopran \tekst
    \new Lyrics \lyricsto sopran \englishLyrics

    \new AltoVoice = alt \melodiaAltu
    \new Lyrics \lyricsto alt \tekst
    \new Lyrics \lyricsto alt \englishLyrics

    \new TenorVoice = tenor \melodiaTenorow
    \new Lyrics \lyricsto tenor \tekst
    \new Lyrics \lyricsto tenor \englishLyrics

    \new BassVoice = bas \melodiaBasow
    \new Lyrics \lyricsto bas \tekst
    \new Lyrics \lyricsto bas \englishLyrics
  >>
  \layout {}
  \midi {}
}

\tlumaczenie
