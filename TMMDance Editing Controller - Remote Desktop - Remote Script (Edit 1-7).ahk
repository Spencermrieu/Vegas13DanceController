; ==============================================================================

; If Vegas 13 is active do the following
;#IfWinActive ahk_exe VEGAS130.exe

; Vegas Only Keyboard Shortcuts
; ==================

AdvancedImageSearch(x, y)
{
  ; Advanced Image Search
  ; Move Region to Play Head

  ; Search for playback head
  ImageSearch, foundX, foundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, Cursor.png
  If(ErrorLevel == 0){

  ; Move to the found cursor head
  MouseMove, %foundX%, %foundY%
  MouseMove, 3, -5, 2, R ; Left Right, Up Down, Speed, "Relative"
  PlaybackHeadX = %foundX%
  PlaybackHeadY = %foundY%

  }else{
  MsgBox, Cursor Image not found.
  return
  }


  ; Region to Mouse Pointer - Advanced Image Search
  ; Search for the closest region to our mouse pointer
  ; Initilizing our interface settings
  CoordMode, Pixel, Screen
  MouseGetPos, CURRENT_MOUSE_X, CURRENT_MOUSE_Y ; Stores current mouse position

  RANGE := 2 ; How big is our search box starting

  while RANGE < 1920
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
      ;MouseMove, %CURRENT_MOUSE_X%, %CURRENT_MOUSE_Y%

      ;Move back to the first playback head position
      MouseMove, PlaybackHeadX, PlaybackHeadY

  	  Sleep, 50 ; Sleep for 50 ms so our pointer catches up
      Click, up ; Let go of right click

      Return
    }

    RANGE += 2 ; Increases the range for the next search

    ; If we can not find a region on our screen size
    ; Send error text
    if (RANGE > 1920)
    {
    MsgBox, Region Image not found.
    Return
    }

  }
}



; Joypad Button 1 (X Button)
; Move forward 30 frames and move the closest region to that new position

F21::

Loop, 30
{
  Send, !{Left}
}

AdvancedImageSearch(x, y)

return




; Joypad Button 4 (Y Button)
; Move forward 60 frames and move the closest region to that new position

F24::

Loop, 60
{
  Send, !{Left}
}

AdvancedImageSearch(x, y)

return



; Joypad Button 2 (A Button)
; Move backward 30 frames and move the closest region to that new position

F22::

; More Right 10 frames
Loop, 30
{
  Send, !{Right}
}

AdvancedImageSearch(x, y)

return



; Joypad Button 3 (B Button)
; Move backward 60 frames and move the closest region to that new position

F23::

; More Right 30 frames
Loop, 60
{
  Send, !{Right}
}

AdvancedImageSearch(x, y)

return




; Joypad Button 10 (Start) = Moves Closest region to current cursor position
; Advanced Image Search
; More Region to PLay Head

F20::

AdvancedImageSearch(x, y)

return
