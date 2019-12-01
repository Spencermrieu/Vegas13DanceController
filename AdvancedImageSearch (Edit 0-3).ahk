f1::

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
    Click, %FoundX%, %FoundY% Right
    Return
  }

  RANGE += 40
}
