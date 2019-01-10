\version "2.19.3"

\header	{
  title = "Wielbić Pana chcę"
  subtitle = "(ostinato)"
  subsubtitle = " "
  composer = "muzyka: Jacques Berthier, Taizé"
}

%--------------------------------MUZYKA
metrumitp = {
  \key d \minor
  \time 4/4
  \tempo 4=76
}

melodiaSopranu =
\relative f' {
  \metrumitp
  a4.^\p f8 g4. d8 | d2 r4 a'4 | d^\< d c g | << a1 { s2^\> s\!} >> |
  a4. f8 g4. d8 | d2 r4 d4 | f f e c | d2. r4
  \bar "|."
}
melodiaAltu =
\relative f' {
  \metrumitp
  f4.^\p f8 d4. d8 | d2 r4 f4 | f^\< f e e | f2(^\> e)\! |
  f4. f8 d4. d8 | d2 r4 d4 | d d c c | a2. r4
  \bar "|."
}
melodiaTenorow =
\relative f {
  \metrumitp
  a4.^\p a8 b4. g8 | a2 r4 a4 | bes?^\< a g c | c2(^\> cis)\! |
  d4. a8 b4. g8 | a2 r4 a4 | bes? a g g | f2. r4
  \bar "|."
}
melodiaBasow =
\relative f {
  \metrumitp
  d4.^\p d8 g4. g8 | d2 r4 d4 | bes^\< bes c c | f(^\> g a2)\! |
  d,4. d8 g4. g8 | d2 r4 d4 | bes bes c e | d2. r4
  \bar "|."
}

akordy = \chordmode {
  d2:m g d1:m bes2:maj7 c f a
  d2:m g d1:m bes2:maj7 c d1:m
}

%--------------------------------SŁOWA
tekst = \lyricmode {
  Wiel -- bić Pa -- na | chcę, ra -- | do -- sną śpie -- wać | pieśń! |
  Wiel -- bić Pa -- na | chcę, On | źró -- dłem ży -- cia | jest.
}
englishLyrics =  \lyricmode {
  \tiny {
    Bless the Lord my soul, and bless His ho -- ly Name.
    Bless the Lord my soul, He leads me in -- to life.
  }
}
tlumaczenie = \markup {
  \column {
    \small
    \typewriter {
      \bold
      "Bless     the Lord my   soul,  and bless     His  holy   Name."
      "Błogosław Pana     moja duszo, i   błogosław Jego święte Imię."
      \vspace #1
      \bold
      "Bless     the Lord my   soul,  He leads    me   into life."
      "Błogosław Pana     moja duszo, On prowadzi mnie do   życia."
    }
  }
}

%--------------------------------USTAWIENIA
#(set-global-staff-size 18)

\include "templates/predefined-instruments/instrument-context-definitions.ily"
\include "templates/adjustable-centered-stanzas/definitions.ily"
\include "ustawienia.ily"

\paper {
  top-markup-spacing.basic-distance = 10
  system-system-spacing.basic-distance = 20
  score-markup-spacing.basic-distance = 18
  left-margin = 25 \mm
  right-margin = 25 \mm
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
