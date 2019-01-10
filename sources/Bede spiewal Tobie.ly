\version "2.19.3"

%{
Ty Boże czy Ty Panie?
z akordami podobnie: czy nie przekombinowane albo niedokombinowane? szczególnie jesteś mą nadzieją i tobie ufam


na początku E
jesteśmąna zostawić Fis7
takt 5: E7-8 (opóźnienie oktawy przez septymę) potem cis i H (tak, co ósemkę)
%}

\header	{
  title = "Będę śpiewał Tobie"
  subtitle = "(ostinato)"
  subsubtitle = " "
  composer = "Jacek Sykulski"
}

%--------------------------------MUZYKA
metrumitp = {
  \key e \major
  \time 3/4
  \tempo 4 = 75
  \set Score.tempoHideNote = ##t
  \partial 4
}

melodiaSopranu =
\relative f' {
  \metrumitp
  e8 fis | gis4. gis8 a([ gis]) |
  fis2 fis8 gis |
  \time 4/4 e2 e4. e8 |
  % 4
  cis'4. cis8 cis b a cis |
  b4 b2 e,8 fis |
  gis4 gis8 gis fis([ e)] e dis |
  e4 e2 r4
  \bar "|."
}
melodiaAltu =
\relative f' {
  \metrumitp
  b,8 b | b4. e8 e4 |
  dis2 dis8 dis |
  \time 4/4 cis2 cis4. e8 |
  % 4
  e4. e8 e e dis dis |
  dis4 e2 cis8 dis |
  e4 e8 dis cis4 b8 b |
  b4 b2 r4
  \bar "|."
}
melodiaTenorow =
\relative f {
  \metrumitp
  gis8 a | b4. b8 cis([ b]) |
  b2 b8 fis |
  \time 4/4 a2 gis4. e8 |
  % 4
  cis'4. cis8 a a b a |
  b4 b2 gis8 b |
  b4 b8 b a4 fis8 a |
  gis4 gis2 r4
  \bar "|."
}
melodiaBasow =
\relative f {
  \metrumitp
  e8 e | e4. e8 e4 |
  b2 b8 b |
  \time 4/4 a4( b) cis4. e8 |
  % 4
  a4. gis8 fis fis fis fis |
  gis4 gis2 cis,8 b |
  e4 e8 e cis([ a)] b b |
  e4 e2 r4
  \bar "|."
}

\include "input-shorthands/optional-chord/definitions.ily"

akordy = \chordmode {
  s4 e2 a4 b2. a2 cis2:m
  a2 fis2:m7 \optionalChord gis4:m e2 cis4:m7 e2 fis4:m b4:7 e2.
}

%--------------------------------SŁOWA
tekst = \lyricmode {
  Bę -- dę | śpie -- wał To -- |
  bie, Mo -- cy  | mo -- ja, Ty  |
  Pa -- nie je -- steś mą na --  |
  dzie -- ją, To -- bie |
  u -- fam i bać się nie | bę -- dę.
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
  top-markup-spacing #'basic-distance = 10
  markup-system-spacing #'basic-distance = 18
  system-system-spacing #'basic-distance = 20
  score-markup-spacing #'basic-distance = 14
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
