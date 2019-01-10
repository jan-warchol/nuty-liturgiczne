\version "2.19.3"

\header	{
  title = "Łaska Pana"
  subtitle = "(ostinato)"
  subsubtitle = " "
  composer = "Piotr Pałka"
}

%--------------------------------MUZYKA
metrumitp = {
  \key d \major
  \time 4/4
  \tempo 4=80
  \set Score.tempoHideNote = ##t
}

melodiaSopranu =
\relative f' {
  \metrumitp
  \partial 8 e8
  \repeat volta 2 {
    fis4. g8 a4 e
    d8 fis e d e2
    b'4. cis8 a4 d,
  }
  \alternative {
    { g8[( fis)] e d a'4. e8 }
    { g8[( fis)] e8. d16 d4. r8 }
  }
  \bar "|."
}
melodiaAltu =
\relative f' {
  \metrumitp
  \partial 8 cis8
  \repeat volta 2 {
    d4. d8 e4 d8[( cis])
    b d b b b([ cis16 d] cis4)
    e4. e8 e8[( cis)] d4
  }
  \alternative {
    { d4 b8 b cis4. cis8 }
    { d4 d8[( cis16)] cis d4. r8 }
  } 
  \bar "|."
}
melodiaTenorow =
\relative f {
  \metrumitp
  \partial 8 a8
  \repeat volta 2 {
    a4. b8 a4 a8([ g)]
    fis a e g g[( a16 b] cis4)
    cis4. cis8 a4 a
  }
  \alternative {
    { b8([ a)] g g e4. a8 }
    { b8([ a)] b[( a16)] a a4. r8 }
  } 
  \bar "|."
}
melodiaBasow =
\relative f {
  \metrumitp
  \partial 8 a,8
  \repeat volta 2 {
    d4. d8 cis4 b8([ a)]
    b a g b a2
    g'4. g8 fis4 fis
  }
  \alternative {
    { e4 e8 e a,4. a8 }
    { e'8[( fis]) g[( a16)] a d,4. r8 }
  } 
  \bar "|."
}

%{
czy to w ogóle jest harmonizowalne?
A może akordy powinny być takie: 
A D A h7 e7 G A 
cis zmniejszony z septymą małą D e A e (e) D?
%}
akordy = \chordmode {
  a8
  \repeat volta 2 {
    d2 a b4:m7 e:m a2 e:m6 d 
  }
  \alternative {
    { e:m a }
    { e4:m7 g d2 } 
  }
}

%--------------------------------SŁOWA
tekst = \lyricmode {
  Niech nas o -- gar -- nie ła -- ska Pa -- nie Twa,
  Duch Twój Świę -- ty niech do -- tknie nas. Niech
  niech do -- tknie nas.
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
  top-markup-spacing #'basic-distance = 8
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
