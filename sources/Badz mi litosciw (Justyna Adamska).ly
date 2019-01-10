\version "2.19.3"

\header	{
  title = "Bądź mi litościw"
  subtitle = \markup \column { " " " " " " }
  arranger = "opracowanie: Justyna Adamska"
}

%--------------------------------MUZYKA
metrumitp = {
  \key e \minor
  \time 4/4
}

melodiaSopranu =
\relative f' {
  \metrumitp
  e4 e8 e g[( fis]) e4 |
  fis8 fis e dis e4 e |
  e4 e8 e g[( fis]) e4 |
  fis8 fis e dis e4 e |
  \repeat volta 2 {
    g4 g8 g b[( a]) g4 |
    fis8 fis fis a g[( fis]) e[( dis]) |
    e4 e8 e g[( fis]) e4 |
    fis8 fis e dis e4 e |
  }
}
melodiaAltu =
\relative f' {
  \metrumitp
  e4 e8 e e4 c |
  e8 c a a b4 b |
  e4 e8 b e4 c |
  e8 c a a b4 b |
  \repeat volta 2 {
    b4 c8 c fis4 e |
    d8 d d d e[( d]) c[( b]) |
    b4 e8 e e4 c8[( b]) |
    e8 c a a b4 b |
  }
}
melodiaTenorow =
\relative f {
  \metrumitp
  e4 b'8 b g4 g |
  c8 a fis fis g4 g |
  g8[( a]) b g g[( a]) a4 |
  c8 a fis fis g4 g |
  \repeat volta 2 {
    g4 g8 a a4 b |
    b4 a8 fis g[( a]) a4 |
    b4 g8 a b4 c8[( b]) |
    c8 a fis fis g4 g |
  }
}
melodiaBasow =
\relative f {
  \metrumitp
  e4 d8 d c4 b |
  a8 a b b e4 e |
  e8[( fis]) g e c4 c |
  a8 a b b e4 e8[( d])
  \repeat volta 2 {
    d8[( fis]) e e d4 b |
    b4 b8 b e4 fis |
    g4 b,8 b c4 g4 |
    a8 a b b e4 e
  }
}

akordy = \chordmode {
  e2:m7 c4 c4:maj7
  a,4:m6 b,:7 e2:m
  e2:m c4 a,:m
  a,4:m6 b,:7 e2:m
  g4:maj7 c d e:m
  b,2:m e4:m b,:7
  e2:m c:maj7
  a,4:m6 b,:7 e2:m
}

%--------------------------------SŁOWA
tekstSopranu =  \lyricmode {
  \set stanza = "1."
  Bądź mi li -- to -- ściw, Bo -- że nie -- skoń -- czo -- ny,
  we -- dług wiel -- kie -- go mi -- ło -- sier -- dzia Twe -- go.
  We -- dług li -- to -- ści Twej nie -- po -- li -- czo -- nej,
  chciej zma -- zać mnó -- stwo prze -- wi -- nie -- nia me -- go.
}
tekstAltu = \tekstSopranu

tekstTenorow =  \lyricmode {
  \set stanza = "1."
  Bądź mi li -- to -- ściw, Bo -- że nie -- skoń -- czo -- ny,
  we -- dług wiel -- kie -- go mi -- ło -- sier -- dzia Twe -- go.
  We -- dług li -- to -- ści nie -- po -- li -- czo -- nej,
  chciej zma -- zać mnó -- stwo prze -- wi -- nie -- nia me -- go.
}
tekstBasow = \tekstTenorow

zwrotkaII = \markup \column {
  "Obmyj mię z złości, obmyj tej godziny,"
  "Oczyść mię z brudu, w którym grzech mię trzyma;"
  "Bo ja poznaję wielkość mojej winy"
  "I grzech mój zawsze przed mymi oczyma."
}
zwrotkaIII = \markup \column {
  "Odpuść! przed Tobą grzech mój popełniony,"
  "Boś przyrzekł, że ta kary ujdzie głowa,"
  "Którąć przyniesie grzesznik uniżony, "
  "By nie mówiono, że nie trzymasz słowa."
}
zwrotkaIV = \markup \column {
  "Odwróć twarz Twoją od przestępstwa mego"
  "I wszystkie moje pomaż nieprawości;"
  "Stwórz serce czyste, warte Boga swego,"
  "A ducha prawdy w moje wlej wnętrzności."
}
zwrotkaV = \markup \column {
  "Nie oddalaj mię od ojcowskiej twarzy, "
  "Nie chciej mi bronić Twojego natchnienia;"
  "Wróć radość, którą niewinność nas darzy "
  "I racz mię w duchu utwierdzić rządzenia."
}

%--------------------------------USTAWIENIA
#(set-global-staff-size 16.5)

\include "templates/predefined-instruments/instrument-context-definitions.ily"
\include "templates/adjustable-centered-stanzas/definitions.ily"
\include "ustawienia.ily"

\paper {
  top-markup-spacing.basic-distance = 14
  markup-system-spacing.basic-distance = 20
  system-system-spacing.basic-distance = 20
  score-markup-spacing.basic-distance = 20
}

\layout {
  \override LyricText #'stencil =
  #(lambda (grob)
     (ly:stencil-scale (lyric-text::print grob) 0.92 1))
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

\zwrotki \markuplist { \zwrotkaII \zwrotkaIII \zwrotkaIV \zwrotkaV }
