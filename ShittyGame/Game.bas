_FullScreen
Randomize Timer
Screen _NewImage(300, 300, 32)
points$ = "0"
x = 150
y = 250
bx = CInt(Rnd * (290 - 15)) + 15
by = CInt(Rnd * (200 - 15)) + 15
Print "Loading Files..."
redship& = _LoadImage("TinyRedShip.png")
blueship& = _LoadImage("TinyBlueShip.png")
bproj& = _LoadImage("TinyBlueProj.png")
music& = _SndOpen("HoneyGroove.mp3")
shoot& = _SndOpen("ShootSound.wav")
Cls
_MouseHide
If music& > 0 Then
    _SndPlay music&
    _SndLoop music&
End If
Print "Song Playing : Honey Groove"
Print "Music Made By : Spectrumist"
Print "Sprites Made By : Gustavo Vituri"
Print "Press any key or wait 10 seconds to continue"
Sleep (10)
Cls
_PutImage (x, y), redship&
_PutImage (bx, by), blueship&
Do
    _PrintString (0, 0), points$
    If x >= 290 Then x = x - 2.5
    If x <= 5 Then x = x + 2.5
    If y >= 290 Then y = y - 2.5
    If y <= 5 Then y = y + 2.5
    movement$ = InKey$
    movement$ = UCase$(movement$)
    Select Case movement$
        Case Chr$(65)
            Cls
            x = x - 2.5
            _PutImage (x, y), redship&
            _PutImage (bx, by), blueship&
            _PrintString (0, 0), points$
            _Display
        Case Chr$(68)
            Cls
            x = x + 2.5
            _PutImage (x, y), redship&
            _PutImage (bx, by), blueship&
            _PrintString (0, 0), points$
            _Display
        Case Chr$(69)
            _SndPlay shoot&
            px = x
            py = y - 25
            sec = 0
            Do
                Cls
                sec = sec + 1
                _PutImage (x, y), redship&
                _PutImage (bx, by), blueship&
                _PutImage (px, py), bproj&
                _PrintString (0, 0), points$
                _Display
                If px + 4 >= bx And px <= bx + 10 And py >= by And py <= by + 4 Then
                    Cls
                    bx = CInt(Rnd * (290 - 15)) + 15
                    by = CInt(Rnd * (200 - 15)) + 15
                    _PutImage (x, y), redship&
                    points = points + 1
                    points$ = Str$(points)
                    points$ = LTrim$(points$)
                    Exit Do
                End If
                dumb: Sleep (0.428571428571)
                If InKey$ = "" Then GoTo dumb
                py = py - 5
                _Limit 30
            Loop Until py <= height
    End Select
    _Limit 30
Loop Until _KeyDown(13)

