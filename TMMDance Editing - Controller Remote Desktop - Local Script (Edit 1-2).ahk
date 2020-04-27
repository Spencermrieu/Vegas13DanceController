; ==============================================================================

; Initial Setup
; =============================

; Joystick D-pad set up
; =====================

; Starts a timer for watching the Joystick D-pad axis
#Persistent  ; Keep this script running until the user explicitly exits it.
SetTimer, WatchAxis, 5
return

; Joypad D-pad  = Controls arrow keys.
; Gives up and down zoom control and play head movement on the timeline

WatchAxis:
JoyX := GetKeyState("JoyX")  ; Get position of X axis.
;MsgBox, Value Is: %JoyX% ; For Debugging

JoyY := GetKeyState("JoyY")  ; Get position of Y axis.
;MsgBox, Value Is: %JoyY% ; For Debugging

KeyToHoldDownPrev := KeyToHoldDown  ; Prev now holds the key that was down before (if any).

; If they controller is null break operation
if (JoyX = "")
  return

; X axis movement listiner
else if (JoyX < 30)
  KeyToHoldDown := "Left"
else if (JoyX > 70)
  KeyToHoldDown := "Right"

; Y axis movement listiner
else if (JoyY < 30)
  KeyToHoldDown := "Up"
else if (JoyY > 70)
  KeyToHoldDown := "Down"

else
  return


;if (KeyToHoldDown = KeyToHoldDownPrev)  ; The correct key is already down (or no key is needed).
    ;return  ; Do nothing.

; Otherwise, release the previous key and press down the new key:
SetKeyDelay -1  ; Sets the speed of held down keys -1 Avoids delays between keystrokes.
if KeyToHoldDownPrev   ; There is a previous key to release.
    Send, {%KeyToHoldDownPrev% up}  ; Release it.
if KeyToHoldDown   ; There is a key to press down.
    Send, {%KeyToHoldDown% down}  ; Press it down.
return



; ============================================================================


; Keyboard Shortcuts
; ==================


; Joypad Button 9 (Select) = Hit Enter
; You can accept error messages
; Play and Pause on the timeline

Joy9::

Send, {Enter}
return


; Joypad Button 5 (Left Bumper)
; Move a region to the Left

Joy5::

Send, ^{Left}
return



; Joypad Button 7 (Right Bumper)
;Move a region to the Right

Joy7::

Send, ^{Right}
return



; Joypad Button 1 (X Button)
; Move forward 10 frames and move the closest region to that new position
Joy1::F21
return

; Joypad Button 4 (Y Button)
; Move forward 30 frames and move the closest region to that new position
Joy4::F24
return

; Joypad Button 2 (A Button)
; Move backward 10 frames and move the closest region to that new position
Joy2::F22
return

; Joypad Button 3 (B Button)
; Move backward 30 frames and move the closest region to that new position
Joy3::F23
return

; Joypad Button 10 (Start) = Moves Closest region to current cursor position
; Advanced Image Search
; More Region to PLay Head
Joy10::F20
return
