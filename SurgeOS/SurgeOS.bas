_FullScreen
Randomize Timer
Dim dhs As String
Dim image As Long
Dim image2 As Long
dhs = Time$
Screen _NewImage(1920, 1080, 32)
start:
image = _LoadImage("Background.png")
Do
    _PutImage (0, 0), image
    _Display
    While _MouseInput
        x = _MouseX
        y = _MouseY
        rm = _MouseButton(1)
        If x >= 112 And x <= 112 + 308 And y >= 149 And y <= 149 + 366 And rm = -1 Then GoTo qb64click
    Wend
Loop Until _KeyDown(13)
qb64click:
Cls
_FreeImage image
image2 = _LoadImage("QB64Clicked.png")
Do
    _PutImage (0, 0), image2
    _Display
    While _MouseInput
        x = _MouseX
        y = _MouseY
        rm = _MouseButton(1)
        If x <> 112 And x <> 112 + 302 And y <> 149 And y <> 149 + 366 Then GoTo start
    Wend
Loop Until _KeyDown(13)

