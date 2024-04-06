;;   This configuration is guile based.
;;   http://www.gnu.org/software/guile/guile.html
;;   This config script is supposed to live in the homedirectory.
;;   Awesome script created by Zero Angel
;;   This couldnt have been possible without seeing Vee Lee's configuration file
;;   You'll need xdotool and xbindkeys with -guile support compiled for this to work (The Ubuntu xbindkeys will have this support by default).
;;   It assigns keybindings to the scroll wheel  on the fly when mouse modifier keys are pressed. Useful for mice with lots of buttons!
;;   v1.0 -- Shoulder button + scrollwheel bindings
;;   v1.1 -- Fixes some 'stuckness' problems with the modifer keys (ctrl, alt, shift)
;;   v1.2 -- Can trigger events properly if the modifier button is simply pressed and released by itself. Forcefully clears modifier keys when the shoulder buttons are depressed.

(define actionperformed 0)

(define (first-binding)
"First binding"
;; Logitech Rear Shoulder Button
(xbindkey-function '("b:8") b8-second-binding)
)


(define (reset-first-binding)
"reset first binding"
(ungrab-all-keys)
(remove-all-keys)
;; Set Action Performed state back to 0
(set! actionperformed 0)
;; Forcefully release all modifier keys!
(run-command "xdotool keyup ctrl keyup alt keyup shift keyup super&")

(first-binding)
(grab-all-keys))


(define (b9-second-binding)
"Front Shoulder Button Extra Functions"
(ungrab-all-keys)
(remove-all-keys)

;; Scroll Up
(xbindkey-function '("b:1")
                (lambda ()
;; Emulate Ctrl+Alt+Up (Workspace Up)
                (run-command "xdotool set_desktop --relative -- -1")
		(set! actionperformed 1)
))

;; Scroll Down
(xbindkey-function '("b:3")
                (lambda ()
;; Emulate Ctrl+Alt+Down (Workspace Down)
                (run-command "xdotool set_desktop --relative -- +1")
		(set! actionperformed 1)
))

(xbindkey-function '(release "b:8") (lambda ()
;; Perform Action if Button 8 is pressed and released by itself
(if (= actionperformed 0) (run-command "zenity --info --title=hi --text=Button8ReleaseEvent &"))
(reset-first-binding)))
(grab-all-keys))

;; (debug)
(first-binding)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; End of xbindkeys configuration ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
