; Move a region to the Left
XButton1::

Send, ^{Left}
return



; Move a region to the Right
XButton2::

Send, ^{Right}
return




; F1 Moves the closet region to the current position of the mouse
; Advanced Image Search
f1::

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

  RANGE += 10 ; Increases the range for the next search, bigger number = faster search, smaller number mean more accurate
}

; If we can not find a region on our screen size
; Send error text
while RANGE > 4000
{
MsgBox, Region Image not found.
Return
}
