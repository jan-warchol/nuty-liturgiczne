\version "2.10.33"
\paper
{
  system-count = #3
}
#(set-global-staff-size 17)		% default staff size is 20
\header
{
  title = "Do szopy, hej, pasterze"
  arranger = "aranżacja: Anna Szymanek"
}
staffprops =
{
  \autoBeamOff
  \set Staff.midiInstrument = "clarinet"
  \key f \major
  \time 3/4
  \override Score.MetronomeMark #'extra-offset = #'( -7.0 . 2.4 )
  \override Score.MetronomeMark #'transparent = ##t
  \tempo 4=120
}
%--------------------------------MELODY--------------------------------
firstsopranomelody =
\relative c'' {
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
secondsopranomelody =
\relative c'' {
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
altomelody =
\relative c' {
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
tenormelody =
\relative c' {
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
bassmelody =
\relative c {
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
%--------------------------------LYRICS--------------------------------
firstsopranolyrics =  \lyricmode
{
  \set stanza = "1. "
  Do szo -- py, pa -- ste -- rze, by zba -- wić lu -- dzki ród!
  Śpie -- waj -- cie, pa -- ste -- rze graj -- cie Mu, nie zbudź -- cie Go ze snu!
}
otherslyrics =  \lyricmode
{
  \set stanza = "1. "
  Do szo -- py, hej, pa -- ste -- rze, do szo -- py, bo tam cud!
  Syn Bo -- ży w_żło -- bie le -- ży, by zba -- wić lu -- dzki ród!
  Śpie -- waj -- cie a -- nio -- ło -- wie, pa -- ste -- rze graj -- cie Mu,
  kła -- niaj -- cie się kró -- lo -- wie, nie zbudź -- cie Go ze snu!
}
%--------------------------------ALL-FILE VARIABLE--------------------------------

everything =
{
  \new ChoirStaff
  <<
    \new Staff = firstsoprano
    {
      \clef treble
      \set Staff.instrumentName = "S "
      \set Staff.shortInstrumentName = "S "
      \new Voice = firstsoprano
      {
        \staffprops
        \firstsopranomelody
      }
    }
    \new Lyrics = firstsoprano \lyricsto firstsoprano \firstsopranolyrics
    \new Staff = secondsoprano
    {
      \clef treble
      \set Staff.instrumentName = "S "
      \set Staff.shortInstrumentName = "S "
      \new Voice = secondsoprano
      {
        \staffprops
        \secondsopranomelody
      }
    }
    \new Lyrics = secondsoprano \lyricsto secondsoprano \otherslyrics
    \new Staff = alto
    {
      \clef treble
      \set Staff.instrumentName = "A "
      \set Staff.shortInstrumentName = "A "
      \new Voice = alto
      {
        \staffprops
        \altomelody
      }
    }
    \new Lyrics = secondsoprano \lyricsto secondsoprano \otherslyrics
    \new Staff = tenor
    {
      \clef "treble_8"
      \set Staff.instrumentName = "T "
      \set Staff.shortInstrumentName = "T "
      \new Voice = tenor
      {
        \staffprops
        \tenormelody
      }
    }
    \new Lyrics = tenor \lyricsto tenor \otherslyrics
    \new Staff = bass
    {
      \clef bass
      \set Staff.instrumentName = "B "
      \set Staff.shortInstrumentName = "B "
      \new Voice = bass
      {
        \staffprops
        \bassmelody
      }
    }
    \new Lyrics = secondsoprano \lyricsto secondsoprano \otherslyrics
  >>
}
%--------------------------------SCORE-LAYOUT--------------------------------
\score
{
  \everything
  \layout
  {
    \context
    {
      \Lyrics
      \override LyricSpace #'minimum-distance = #0.8
    }
    indent = 0\cm
  }
}
%--------------------------------SCORE-MIDI--------------------------------
\score
{
  \unfoldRepeats
  {
    \everything
  }
  \midi
  {
    \context
    {
      \Score
    }
  }
}
