\version "2.19.82"

newInstrument =
#(define-scheme-function
  (parser location name staff-settings voice-settings parent-name)
  (string?
   (ly:context-mod? #{ \with {} #})
   (ly:context-mod? #{ \with {} #})
   string?)
  (let* ((staff-name (string-append name "Staff"))
         (voice-name (string-append name "Voice"))
         (parent-name (if (string=? parent-name "default") "" parent-name))
         (parent-staff-name (string-append parent-name "Staff"))
         (parent-voice-name (string-append parent-name "Voice")))
    (ly:parser-define! '$defaultlayout
      #{
        \layout {
          \context {
            % I don't know why, but this code makes ChoirStaffs accept new
            % instrument as well.  See this question asked on the mailing list:
            % http://lists.gnu.org/archive/html/bug-lilypond/2014-07/msg00129.html
            \StaffGroup
            \accepts #staff-name
          }
          \context {
            \ChoirStaff
            \accepts #staff-name
          }
          \context {
            $(module-ref (current-module) (string->symbol parent-staff-name))
            \name #staff-name
            \alias #parent-staff-name
            % is it possible to make it accept Voices of derived instruments?
            \accepts #voice-name
            \defaultchild #voice-name
            #staff-settings
          }
          \context {
            $(module-ref (current-module) (string->symbol parent-voice-name))
            \name #voice-name
            \alias #parent-voice-name
            #voice-settings
          }
        }
      #})
    ;; UGH! code duplication!
    (ly:parser-define! '$defaultmidi
      #{
        \midi {
          \context {
            \StaffGroup
            \accepts #staff-name
          }
          \context {
            \ChoirStaff
            \accepts #staff-name
          }
          \context {
            $(module-ref (current-module) (string->symbol parent-staff-name))
            \name #staff-name
            \alias #parent-staff-name
            % is it possible to make it accept Voices of derived instruments?
            \accepts #voice-name
            \defaultchild #voice-name
            #staff-settings
          }
          \context {
            $(module-ref (current-module) (string->symbol parent-voice-name))
            \name #voice-name
            \alias #parent-voice-name
            #voice-settings
          }
        }
      #})))