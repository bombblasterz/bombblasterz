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
                If px >= bx And px <= bx + 10 And py >= by And py <= by + 4 Then
                    Cls
                    bx = CInt(Rnd * (290 - 15)) + 15
                    by = CInt(Rnd * (200 - 15)) + 15
                    _PutImage (x, y), redship&
                    points = points + 1
                    points$ = Str$(points)
                    points$ = LTrim$(points$)
                    Exit Do
 
                End If
                                'This next bit of code will be terrible , but bear with it I thought of this during a class and decided to add it in
                                'I didn't know of any better ways to achieve this at the time , maybe sleep(sec) might've worked? , not sure
                If sec = 3 Then py = py - 5
                If sec = 6 Then py = py - 5
                If sec = 9 Then py = py - 5
                If sec = 12 Then py = py - 5
                If sec = 15 Then py = py - 5
                If sec = 18 Then py = py - 5
                If sec = 21 Then py = py - 5
                If sec = 24 Then py = py - 5
                If sec = 27 Then py = py - 5
                If sec = 30 Then py = py - 5
                If sec = 33 Then py = py - 5
                If sec = 36 Then py = py - 5
                If sec = 39 Then py = py - 5
                If sec = 42 Then py = py - 5
                If sec = 45 Then py = py - 5
                If sec = 48 Then py = py - 5
                If sec = 51 Then py = py - 5
                If sec = 54 Then py = py - 5
                If sec = 57 Then py = py - 5
                If sec = 60 Then py = py - 5
                If sec = 63 Then py = py - 5
                If sec = 66 Then py = py - 5
                If sec = 69 Then py = py - 5
                If sec = 72 Then py = py - 5
                If sec = 75 Then py = py - 5
                If sec = 78 Then py = py - 5
                If sec = 81 Then py = py - 5
                If sec = 84 Then py = py - 5
                If sec = 87 Then py = py - 5
                If sec = 90 Then py = py - 5
                If sec = 93 Then py = py - 5
                If sec = 96 Then py = py - 5
                If sec = 99 Then py = py - 5
                If sec = 102 Then py = py - 5
                If sec = 105 Then py = py - 5
                If sec = 108 Then py = py - 5
                If sec = 111 Then py = py - 5
                If sec = 114 Then py = py - 5
                If sec = 117 Then py = py - 5
                If sec = 120 Then py = py - 5
                If sec = 123 Then py = py - 5
                If sec = 126 Then py = py - 5
                If sec = 129 Then py = py - 5
                If sec = 132 Then py = py - 5
                If sec = 135 Then py = py - 5
                If sec = 138 Then py = py - 5
                If sec = 141 Then py = py - 5
                _Limit 30
            Loop Until sec = 141
    End Select
    _Limit 30
Loop Until _KeyDown(13)

