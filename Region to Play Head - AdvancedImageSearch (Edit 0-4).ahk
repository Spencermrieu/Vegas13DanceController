f1::


; Advanced Image Search
CoordMode, Pixel, Screen
MouseGetPos, CURRENT_MOUSE_X, CURRENT_MOUSE_Y
RANGE := 10

while RANGE < 1920
{
  X1 := CURRENT_MOUSE_X - RANGE
  Y1 := CURRENT_MOUSE_Y - RANGE
  X2 := CURRENT_MOUSE_X + RANGE
  Y2 := CURRENT_MOUSE_Y + RANGE

  ImageSearch, FoundX, FoundY, X1, Y1, X2, Y2, Regions.png
  If Errorlevel = 0
  {
    ;Click, %FoundX%, %FoundY% Right
    MouseMove, %foundX%, %foundY%
    MouseMove, 14, 14, 1, R ; Left Right, Up Down, Speed, "Relative"
    Click, down

    ; Search for Cursor head
    ImageSearch, foundX, foundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, Cursor.png
    If(ErrorLevel == 0){
    MouseMove, %foundX%, %foundY%
    MouseMove, 3, -5, 2, R ; Left Right, Up Down, Speed, "Relative"
    sleep,  20
    Click, up
    }else{
    MsgBox, Cursor Image not found.
    }

    Return
  }

  RANGE += 40
}
