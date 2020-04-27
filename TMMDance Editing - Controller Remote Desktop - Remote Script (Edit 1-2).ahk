; ==============================================================================

; If Vegas 13 is active do the following
;#IfWinActive ahk_exe VEGAS130.exe

; Vegas Only Keyboard Shortcuts
; ==================



; Joypad Button 1 (X Button)
; Move forward 10 frames and move the closest region to that new position

^+1::

Loop, 10
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
; Move forward 30 frames and move the closest region to that new position

^+4::

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



; Joypad Button 2 (A Button)
; Move backward 10 frames and move the closest region to that new position

^+2::

; More Right 10 frames
Loop, 10
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
; Move backward 30 frames and move the closest region to that new position

^+3::

; More Right 30 frames
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




; Joypad Button 10 (Start) = Moves Closest region to current cursor position
; Advanced Image Search
; More Region to PLay Head

^+0::

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
