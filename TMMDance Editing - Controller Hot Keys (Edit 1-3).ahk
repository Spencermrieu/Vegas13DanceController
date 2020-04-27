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



; ==============================================================================

; If Vegas 13 is active do the following
;#IfWinActive ahk_exe VEGAS130.exe

; Vegas Only Keyboard Shortcuts
; ==================



; Joypad Button 1 (X Button)
; Move forward 30 frames and move the closest region to that new position

Joy1::

Loop, 30
{
  Send, !{Left}
}


; Advanced Image Search
; More Region to PLay Head

; Search for Cursor head
ImageSearch, foundX, foundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, Cursor.png
If(ErrorLevel == 0){

; Move to the found cursor head
MouseMove, %foundX%, %foundY%
MouseMove, 3, -5, 2, R ; Left Right, Up Down, Speed, "Relative"

}else{
MsgBox, Cursor Image not found.
}


; Region to Mouse Pointer - Advanced Image Search
; Search for the closest region to our mouse pointer
; Initilizing our interface settings
CoordMode, Pixel, Screen
MouseGetPos, CURRENT_MOUSE_X, CURRENT_MOUSE_Y ; Stores current mouse position
RANGE := 2 ; How big is our search box starting

while RANGE < 4000
{
  ; The 4 coordinates that make up our search box
  X1 := CURRENT_MOUSE_X - RANGE
  Y1 := CURRENT_MOUSE_Y - RANGE
  X2 := CURRENT_MOUSE_X + RANGE
  Y2 := CURRENT_MOUSE_Y + RANGE

  ; Searches within the rage we just specified above for our regions image
  ImageSearch, FoundX, FoundY, X1, Y1, X2, Y2, Regions.png

  ; If we see what we are looking for
  If Errorlevel = 0
  {
    ; Moves the mouse to the found region position
    MouseMove, %foundX%, %foundY%

    ; Moves the mouse cursor right and down to click better on our region
    MouseMove, 8, 14, 2, R ; Left Right, Up Down, Speed, "Relative"

    Click, down ; Right click down

    ;Move back to the first mouse pointer position
    MouseMove, %CURRENT_MOUSE_X%, %CURRENT_MOUSE_Y%

	  Sleep, 50 ; Sleep for 50 ms so our pointer catches up
    Click, up ; Let go of right click

    Return
  }

  RANGE += 10 ; Increases the range for the next search
}

; If we can not find a region on our screen size
; Send error text
while RANGE > 4000
{
MsgBox, Region Image not found.
Return
}



; Joypad Button 4 (Y Button)
; Move forward 60 frames and move the closest region to that new position

Joy4::

Loop, 60
{
  Send, !{Left}
}

; Advanced Image Search
; More Region to PLay Head

; Search for Cursor head
ImageSearch, foundX, foundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, Cursor.png
If(ErrorLevel == 0){

; Move to the found cursor head
MouseMove, %foundX%, %foundY%
MouseMove, 3, -5, 2, R ; Left Right, Up Down, Speed, "Relative"

}else{
MsgBox, Cursor Image not found.
}


; Region to Mouse Pointer - Advanced Image Search
; Search for the closest region to our mouse pointer
; Initilizing our interface settings
CoordMode, Pixel, Screen
MouseGetPos, CURRENT_MOUSE_X, CURRENT_MOUSE_Y ; Stores current mouse position
RANGE := 2 ; How big is our search box starting

while RANGE < 4000
{
  ; The 4 coordinates that make up our search box
  X1 := CURRENT_MOUSE_X - RANGE
  Y1 := CURRENT_MOUSE_Y - RANGE
  X2 := CURRENT_MOUSE_X + RANGE
  Y2 := CURRENT_MOUSE_Y + RANGE

  ; Searches within the rage we just specified above for our regions image
  ImageSearch, FoundX, FoundY, X1, Y1, X2, Y2, Regions.png

  ; If we see what we are looking for
  If Errorlevel = 0
  {
    ; Moves the mouse to the found region position
    MouseMove, %foundX%, %foundY%

    ; Moves the mouse cursor right and down to click better on our region
    MouseMove, 8, 14, 2, R ; Left Right, Up Down, Speed, "Relative"

    Click, down ; Right click down

    ;Move back to the first mouse pointer position
    MouseMove, %CURRENT_MOUSE_X%, %CURRENT_MOUSE_Y%

	  Sleep, 50 ; Sleep for 50 ms so our pointer catches up
    Click, up ; Let go of right click

    Return
  }

  RANGE += 10 ; Increases the range for the next search
}

; If we can not find a region on our screen size
; Send error text
while RANGE > 4000
{
MsgBox, Region Image not found.
Return
}



; Joypad Button 2 (A Button)
; Move backward 30 frames and move the closest region to that new position

Joy2::

; More Right 10 frames
Loop, 30
{
  Send, !{Right}
}

; Advanced Image Search
; More Region to PLay Head

; Search for Cursor head
ImageSearch, foundX, foundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, Cursor.png
If(ErrorLevel == 0){

; Move to the found cursor head
MouseMove, %foundX%, %foundY%
MouseMove, 3, -5, 2, R ; Left Right, Up Down, Speed, "Relative"

}else{
MsgBox, Cursor Image not found.
}


; Region to Mouse Pointer - Advanced Image Search
; Search for the closest region to our mouse pointer
; Initilizing our interface settings
CoordMode, Pixel, Screen
MouseGetPos, CURRENT_MOUSE_X, CURRENT_MOUSE_Y ; Stores current mouse position
RANGE := 2 ; How big is our search box starting

while RANGE < 4000
{
  ; The 4 coordinates that make up our search box
  X1 := CURRENT_MOUSE_X - RANGE
  Y1 := CURRENT_MOUSE_Y - RANGE
  X2 := CURRENT_MOUSE_X + RANGE
  Y2 := CURRENT_MOUSE_Y + RANGE

  ; Searches within the rage we just specified above for our regions image
  ImageSearch, FoundX, FoundY, X1, Y1, X2, Y2, Regions.png

  ; If we see what we are looking for
  If Errorlevel = 0
  {
    ; Moves the mouse to the found region position
    MouseMove, %foundX%, %foundY%

    ; Moves the mouse cursor right and down to click better on our region
    MouseMove, 8, 14, 2, R ; Left Right, Up Down, Speed, "Relative"

    Click, down ; Right click down

    ;Move back to the first mouse pointer position
    MouseMove, %CURRENT_MOUSE_X%, %CURRENT_MOUSE_Y%

	  Sleep, 50 ; Sleep for 50 ms so our pointer catches up
    Click, up ; Let go of right click

    Return
  }

  RANGE += 10 ; Increases the range for the next search
}

; If we can not find a region on our screen size
; Send error text
while RANGE > 4000
{
MsgBox, Region Image not found.
Return
}



; Joypad Button 3 (B Button)
; Move backward 60 frames and move the closest region to that new position

Joy3::

; More Right 30 frames
Loop, 60
{
  Send, !{Right}
}


; Advanced Image Search
; More Region to PLay Head

; Search for Cursor head
ImageSearch, foundX, foundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, Cursor.png
If(ErrorLevel == 0){

; Move to the found cursor head
MouseMove, %foundX%, %foundY%
MouseMove, 3, -5, 2, R ; Left Right, Up Down, Speed, "Relative"

}else{
MsgBox, Cursor Image not found.
}


; Region to Mouse Pointer - Advanced Image Search
; Search for the closest region to our mouse pointer
; Initilizing our interface settings
CoordMode, Pixel, Screen
MouseGetPos, CURRENT_MOUSE_X, CURRENT_MOUSE_Y ; Stores current mouse position
RANGE := 2 ; How big is our search box starting

while RANGE < 4000
{
  ; The 4 coordinates that make up our search box
  X1 := CURRENT_MOUSE_X - RANGE
  Y1 := CURRENT_MOUSE_Y - RANGE
  X2 := CURRENT_MOUSE_X + RANGE
  Y2 := CURRENT_MOUSE_Y + RANGE

  ; Searches within the rage we just specified above for our regions image
  ImageSearch, FoundX, FoundY, X1, Y1, X2, Y2, Regions.png

  ; If we see what we are looking for
  If Errorlevel = 0
  {
    ; Moves the mouse to the found region position
    MouseMove, %foundX%, %foundY%

    ; Moves the mouse cursor right and down to click better on our region
    MouseMove, 8, 14, 2, R ; Left Right, Up Down, Speed, "Relative"

    Click, down ; Right click down

    ;Move back to the first mouse pointer position
    MouseMove, %CURRENT_MOUSE_X%, %CURRENT_MOUSE_Y%

	  Sleep, 50 ; Sleep for 50 ms so our pointer catches up
    Click, up ; Let go of right click

    Return
  }

  RANGE += 10 ; Increases the range for the next search
}

; If we can not find a region on our screen size
; Send error text
while RANGE > 4000
{
MsgBox, Region Image not found.
Return
}



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



; Joypad Button 10 (Start) = Moves Closest region to current cursor position
; Advanced Image Search
; More Region to PLay Head

Joy10::

; Advanced Image Search
; More Region to PLay Head

; Search for Cursor head
ImageSearch, foundX, foundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, Cursor.png
If(ErrorLevel == 0){

; Move to the found cursor head
MouseMove, %foundX%, %foundY%
MouseMove, 3, -5, 2, R ; Left Right, Up Down, Speed, "Relative"

}else{
MsgBox, Cursor Image not found.
}


; Region to Mouse Pointer - Advanced Image Search
; Search for the closest region to our mouse pointer
; Initilizing our interface settings
CoordMode, Pixel, Screen
MouseGetPos, CURRENT_MOUSE_X, CURRENT_MOUSE_Y ; Stores current mouse position
RANGE := 2 ; How big is our search box starting

while RANGE < 4000
{
  ; The 4 coordinates that make up our search box
  X1 := CURRENT_MOUSE_X - RANGE
  Y1 := CURRENT_MOUSE_Y - RANGE
  X2 := CURRENT_MOUSE_X + RANGE
  Y2 := CURRENT_MOUSE_Y + RANGE

  ; Searches within the rage we just specified above for our regions image
  ImageSearch, FoundX, FoundY, X1, Y1, X2, Y2, Regions.png

  ; If we see what we are looking for
  If Errorlevel = 0
  {
    ; Moves the mouse to the found region position
    MouseMove, %foundX%, %foundY%

    ; Moves the mouse cursor right and down to click better on our region
    MouseMove, 8, 14, 2, R ; Left Right, Up Down, Speed, "Relative"

    Click, down ; Right click down

    ;Move back to the first mouse pointer position
    MouseMove, %CURRENT_MOUSE_X%, %CURRENT_MOUSE_Y%

	  Sleep, 50 ; Sleep for 50 ms so our pointer catches up
    Click, up ; Let go of right click

    Return
  }

  RANGE += 10 ; Increases the range for the next search
}

; If we can not find a region on our screen size
; Send error text
while RANGE > 4000
{
MsgBox, Region Image not found.
Return
}
