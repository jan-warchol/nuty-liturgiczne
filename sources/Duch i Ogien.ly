\version "2.19.3"

\header	{
  title = "Duch i Ogień"
  subtitle = "zwrotki - refrenu nie zdążyłem :("
  subsubtitle = " "
  composer = "muz. Paweł Bębenek"
}

%--------------------------------MUZYKA
metrumitp = {
  \key f \major
  \omit Staff.TimeSignature
  \time 3/4
  \tempo 4 = 75
  \set Score.tempoHideNote = ##t
}

melodiaSopranu =
\relative f' {
  \metrumitp
  g\breve g8 a bes a4. \bar "|"
  g\breve f8 e f4 f \bar "|"
  g\breve a8 bes a4 a \bar "|"
  g\breve f8 e f4 f \bar "|"
  \bar "|."
}
melodiaAltu =
\relative f' {
  \metrumitp
  \cadenzaOn
  d\breve d8 d d f4. \bar "|"
  e\breve c8 c c4 c \bar "|"
  d\breve d8 d f4 f \bar "|"
  c\breve c8 c c4 c \bar "|"
  \bar "|."
}
melodiaTenorow =
\relative f {
  \metrumitp
  bes\breve bes8 8 8 c4.
  c\breve g8 a bes4 a
  bes\breve 8 8 d4 d
  c\breve g8 a bes4 a
}
melodiaBasow =
\relative f {
  \metrumitp
  g\breve g8 g g f4.
  c\breve c8 c f4 f
  g\breve g8 g d4 d
  e\breve c8 c f4 f
}

\include "input-shorthands/optional-chord/definitions.ily"

akordy = \chordmode {
}

rec = {
  \once \override LyricText.X-offset = #-1
  \once \override LyricSpace #'minimum-distance = #1.5
  \once \override LyricHyphen #'minimum-distance = #1.5
}

%--------------------------------SŁOWA
tekst = \lyricmode {
  \set stanza = "1."
  \rec "W Twym Chlebie żyje" u -- kry -- ty Duch,
  \rec "który nie może" być spo -- ży -- ty,
  \rec "W Twym Winie" pło -- nie O -- gień,
  \rec "który nie może" być wy -- pi -- ty.
}
drugaZwrotka = \lyricmode {
  \set stanza = "2."
  \rec "Duch w Twoim Chlebie," O -- gień \markup \scale #'(0.9 . 1) "w Twym" Winie
  \rec \markup \scale #'(0.94 . 1) "są wielkimi cudami, jakie przyjmują" na -- sze u -- sta,
  \rec \markup \scale #'(0.95 . 1) "Pan zstąpił na ziemię, czyniąc nas no" -- wym stwo -- rze -- niem,
  \rec \markup \scale #'(0.95 . 1) "niech na wzór aniołów Ogień i Duch" nas wy -- peł -- nią!
}
trzeciaZwrotka = \lyricmode {
  \set stanza = "4."
  \rec \markup \scale #'(0.94 . 1) "Me serce, Panie, jest pełne z nadmia" -- ru Twych do -- \once \override LyricText.X-offset = #-2.6 \markup \scale #'(0.9 . 1) brodziejstw,
  \rec "zatrzymaj przeto" Łask Swych stru -- mień!
  \rec "Zachowaj je" w_Swo -- im skarb -- cu,
  \rec "by mi ich kiedyś zno" -- wu u -- dzie -- lić!
}

%--------------------------------USTAWIENIA
#(set-global-staff-size 16)

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
    \new Staff = women <<
      \clef treble
      \new Voice = soprano {
        \voiceOne
        \melodiaSopranu
      }
      \new Voice = alto {
        \voiceTwo
        \melodiaAltu
      }
    >>
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
      \override VerticalAxisGroup #'nonstaff-relatedstaff-spacing.padding = #1
    }
    \lyricsto alto \tekst
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
      \override VerticalAxisGroup #'nonstaff-relatedstaff-spacing.padding = #1
    }
    \lyricsto alto \drugaZwrotka
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
      \override VerticalAxisGroup #'nonstaff-relatedstaff-spacing.padding = #1
    }
    \lyricsto alto \trzeciaZwrotka

    \new Staff = men <<
      \clef bass
      \new Voice = tenor {
        \voiceOne
        \melodiaTenorow
      }
      \new Voice = bass {
        \voiceTwo
        \melodiaBasow
      }
    >>
  >>
  \layout {
    \override NoteHead #'style = #'altdefault
    indent = 0\cm

    \override LyricText #'stencil =
    #(lambda (grob)
       (ly:stencil-scale (lyric-text::print grob) 0.9 1))
  }
  \midi {}
}
