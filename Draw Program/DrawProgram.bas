debug = 0
If debug = 1 Then
    Print "Enter screen width"
    Input sx
    Print "Enter the screen height"
    Input sy
ElseIf debug = 0 Then Screen _NewImage(1000, 500, 32)
End If
_FullScreen
Type pixels
    x As Single
    y As Single
End Type
Dim p(arraysize) As pixels
arraysize = _Width * _Height
fps = 60
mb = 3
liney = _Height / 10
linecolor1 = 39
linecolor2 = 39
linecolor3 = 39
linecolor4 = 39
blue& = _LoadImage("Graphics/Toolbar/Blue.png")
bluesel& = _LoadImage("Graphics/Toolbar/BlueSelect.png")
red& = _LoadImage("Graphics/Toolbar/Red.png")
redsel& = _LoadImage("Graphics/Toolbar/RedSelect.png")
green& = _LoadImage("Graphics/Toolbar/Green.png")
greensel& = _LoadImage("Graphics/Toolbar/GreenSel.png")
yellow& = _LoadImage("Graphics/Toolbar/Yellow.png")
yellowsel& = _LoadImage("Graphics/Toolbar/YellowSelect.png")
brown& = _LoadImage("Graphics/Toolbar/Brown.png")
brownsel& = _LoadImage("Graphics/Toolbar/BrownSelect.png")
black& = _LoadImage("Graphics/Toolbar/Black.png")
blacksel& = _LoadImage("Graphics/Toolbar/BlackSelect.png")
orange& = _LoadImage("Graphics/Toolbar/Orange.png")
orangesel& = _LoadImage("Graphics/Toolbar/OrangeSelect.png")
pink& = _LoadImage("Graphics/Toolbar/Pink.png")
pinksel& = _LoadImage("Graphics/Toolbar/PinkSelect.png")
purple& = _LoadImage("Graphics/Toolbar/Purple.png")
purplesel& = _LoadImage("Graphics/Toolbar/PurpleSelect.png")
teal& = _LoadImage("Graphics/Toolbar/Teal.png")
tealsel& = _LoadImage("Graphics/Toolbar/TealSelect.png")
white& = _LoadImage("Graphics/Toolbar/White.png")
whitesel& = _LoadImage("Graphics/Toolbar/WhiteSelect.png")
lavender& = _LoadImage("Graphics/Toolbar/Lavender.png")
lavendersel& = _LoadImage("Graphics/Toolbar/LavenderSelect.png")
maroon& = _LoadImage("Graphics/Toolbar/Maroon.png")
maroonsel& = _LoadImage("Graphics/Toolbar/MaroonSelect.png")
bluegray& = _LoadImage("Graphics/Toolbar/BlueGray.png")
bluegraysel& = _LoadImage("Graphics/Toolbar/BlueGraySelect.png")
drawing:
Do
    Line (0, 0)-(_Width / 4, liney), _RGB32(linecolor1, linecolor1, linecolor1), BF
    Line (_Width / 4 + 5, 0)-(_Width / 2, liney), _RGB32(linecolor2, linecolor2, linecolor2), BF
    Line (_Width / 2 + 5, 0)-(_Width / 1.33, liney), _RGB32(linecolor3, linecolor3, linecolor3), BF
    Line (_Width / 1.33 + 5, 0)-(_Width, liney), _RGB32(linecolor4, linecolor4, linecolor4), BF
    _PutImage (5, 5), blue&
    _PutImage (40, 5), red&
    _PutImage (75, 5), green&
    _PutImage (110, 5), yellow&
    _PutImage (145, 5), orange&
    _PutImage (180, 5), brown&
    _PutImage (215, 5), black&
    _PutImage (5, 30), white&
    _PutImage (40, 30), pink&
    _PutImage (75, 30), purple&
    _PutImage (110, 30), teal&
    _PutImage (145, 30), maroon&
    _PutImage (180, 30), lavender&
    _PutImage (215, 30), bluegray&
    Color pcolor~&, _RGB32(0, 0, 0)
    _Dest 0
    For i = 1 To UBound(p)
        temp$ = InKey$
        temp$ = UCase$(temp$)
        If temp$ = Chr$(13) Then End
        If temp$ = Chr$(61) Then
            mb = mb + 1
            If mb = 6 Then mb = 1
        End If
        If temp$ = Chr$(45) Then
            mb = mb - 1
            If mb = 0 Then mb = 5
        End If
        If temp$ = Chr$(67) Then
            Cls
            Line (0, 0)-(_Width / 4, liney), _RGB32(linecolor1, linecolor1, linecolor1), BF
            Line (_Width / 4 + 5, 0)-(_Width / 2, liney), _RGB32(linecolor2, linecolor2, linecolor2), BF
            Line (_Width / 2 + 5, 0)-(_Width / 1.33, liney), _RGB32(linecolor3, linecolor3, linecolor3), BF
            Line (_Width / 1.33 + 5, 0)-(_Width, liney), _RGB32(linecolor4, linecolor4, linecolor4), BF
            _PutImage (5, 5), blue&
            _PutImage (40, 5), red&
            _PutImage (75, 5), green&
            _PutImage (110, 5), yellow&
            _PutImage (145, 5), orange&
            _PutImage (180, 5), brown&
            _PutImage (215, 5), black&
            _PutImage (5, 30), white&
            _PutImage (40, 30), pink&
            _PutImage (75, 30), purple&
            _PutImage (110, 30), teal&
            _PutImage (145, 30), maroon&
            _PutImage (180, 30), lavender&
            _PutImage (215, 30), bluegray&
            PCopy 5, 0
            PCopy 0, 5
        End If
        If temp$ = Chr$(78) Then _MouseShow
        If temp$ = Chr$(77) Then _MouseHide
        While _MouseInput
            mx = _MouseX: my = _MouseY: rm = _MouseButton(1): lm = _MouseButton(2)
            If rm = -1 Then
                p(i).x = mx
                p(i).y = my
            End If
        Wend
        'Color Detection Start
        Call detect(mx, my, 5, 5, 23, 14, rm, pcolor~&, _RGB32(0, 0, 255))
        Call detect(mx, my, 40, 5, 23, 14, rm, pcolor~&, _RGB32(255, 0, 0))
        Call detect(mx, my, 75, 5, 23, 14, rm, pcolor~&, _RGB32(0, 255, 0))
        Call detect(mx, my, 110, 5, 23, 14, rm, pcolor~&, _RGB32(255, 255, 0))
        Call detect(mx, my, 145, 5, 23, 14, rm, pcolor~&, _RGB32(255, 125, 0))
        Call detect(mx, my, 180, 5, 23, 14, rm, pcolor~&, _RGB32(100, 50, 0))
        Call detect(mx, my, 215, 5, 23, 14, rm, pcolor~&, _RGB32(0, 0, 0))
        Call detect(mx, my, 5, 30, 23, 14, rm, pcolor~&, _RGB32(255, 255, 255))
        Call detect(mx, my, 40, 30, 23, 14, rm, pcolor~&, _RGB32(255, 0, 255))
        Call detect(mx, my, 75, 30, 23, 14, rm, pcolor~&, _RGB32(144, 0, 255))
        Call detect(mx, my, 110, 30, 23, 14, rm, pcolor~&, _RGB32(0, 255, 255))
        Call detect(mx, my, 145, 30, 23, 14, rm, pcolor~&, _RGB32(136, 0, 21))
        Call detect(mx, my, 180, 30, 23, 14, rm, pcolor~&, _RGB32(200, 191, 231))
        Call detect(mx, my, 215, 30, 23, 14, rm, pcolor~&, _RGB32(112, 146, 190))
        'Color Detection End
        'Topbar Barrier Start
        If p(i).x >= 0 And p(i).x <= _Width And p(i).y >= 0 And p(i).y <= 75 And rm = -1 Then
            p(i).x = -1
            p(i).y = -1
            PSet (p(i).x, p(i).y)
        End If
        'Topbar Barrier End
        'Brush Detection Start
        If mb = 1 Then PSet (p(i).x, p(i).y), pcolor~&
        If mb = 2 Then
            Call brush1(p(i).x, p(i).y, pcolor~&)
            Call brush2(p(i).x, p(i).y, pcolor~&)
        End If
        If mb = 3 Then
            Call brush1(p(i).x, p(i).y, pcolor~&)
            Call brush2(p(i).x, p(i).y, pcolor~&)
            Call brush3(p(i).x, p(i).y, pcolor~&)
        End If
        If mb = 4 Then
            Call brush1(p(i).x, p(i).y, pcolor~&)
            Call brush2(p(i).x, p(i).y, pcolor~&)
            Call brush3(p(i).x, p(i).y, pcolor~&)
            Call brush4(p(i).x, p(i).y, pcolor~&)
        End If
        If mb = 5 Then
            Call brush1(p(i).x, p(i).y, pcolor~&)
            Call brush2(p(i).x, p(i).y, pcolor~&)
            Call brush3(p(i).x, p(i).y, pcolor~&)
            Call brush4(p(i).x, p(i).y, pcolor~&)
            Call brush5(p(i).x, p(i).y, pcolor~&)
        End If
        _Display
        'Brush Detection End'
    Next i
    _Limit fps
Loop Until _KeyDown(13)
Sub brush1 (a, b, pcolor~&)
    PSet (a, b), pcolor~&
End Sub
Sub brush2 (a, b, pcolor~&)
    PSet (a + 1, b), pcolor~&
    PSet (a - 1, b), pcolor~&
    PSet (a, b + 1), pcolor~&
    PSet (a, b - 1), pcolor~&
    PSet (a + 1, b + 1), pcolor~&
    PSet (a - 1, b - 1), pcolor~&
    PSet (a - 1, b + 1), pcolor~&
    PSet (a + 1, b - 1), pcolor~&
End Sub
Sub brush3 (a, b, pcolor~&)
    PSet (a + 2, b), pcolor~&
    PSet (a - 2, b), pcolor~&
    PSet (a, b + 2), pcolor~&
    PSet (a, b - 2), pcolor~&
    PSet (a - 2, b + 1), pcolor~&
    PSet (a + 2, b + 1), pcolor~&
    PSet (a - 2, b - 1), pcolor~&
    PSet (a + 2, b - 1), pcolor~&
    PSet (a + 1, b - 2), pcolor~&
    PSet (a - 1, b + 2), pcolor~&
    PSet (a + 1, b + 2), pcolor~&
    PSet (a - 1, b - 2), pcolor~&
    PSet (a - 2, b - 2), pcolor~&
    PSet (a + 2, b + 2), pcolor~&
    PSet (a - 2, b + 2), pcolor~&
    PSet (a + 2, b - 2), pcolor~&
End Sub
Sub brush4 (a, b, pcolor~&)
    PSet (a + 3, b), pcolor~&
    PSet (a - 3, b), pcolor~&
    PSet (a, b + 3), pcolor~&
    PSet (a, b - 3), pcolor~&
    PSet (a + 3, b + 1), pcolor~&
    PSet (a + 3, b + 2), pcolor~&
    PSet (a + 3, b - 1), pcolor~&
    PSet (a + 3, b - 2), pcolor~&
    PSet (a - 3, b - 1), pcolor~&
    PSet (a - 3, b - 2), pcolor~&
    PSet (a - 3, b + 1), pcolor~&
    PSet (a - 3, b + 2), pcolor~&
    PSet (a - 1, b + 3), pcolor~&
    PSet (a - 2, b + 3), pcolor~&
    PSet (a + 1, b + 3), pcolor~&
    PSet (a + 2, b + 3), pcolor~&
    PSet (a - 1, b - 3), pcolor~&
    PSet (a - 2, b - 3), pcolor~&
    PSet (a + 1, b - 3), pcolor~&
    PSet (a + 2, b - 3), pcolor~&
    PSet (a + 3, b + 3), pcolor~&
    PSet (a - 3, b - 3), pcolor~&
    PSet (a + 3, b - 3), pcolor~&
    PSet (a - 3, b + 3), pcolor~&
End Sub
Sub brush5 (a, b, pcolor~&)
    PSet (a + 4, b), pcolor~&
    PSet (a - 4, b), pcolor~&
    PSet (a, b - 4), pcolor~&
    PSet (a, b + 4), pcolor~&
    PSet (a + 1, b + 4), pcolor~&
    PSet (a + 2, b + 4), pcolor~&
    PSet (a + 3, b + 4), pcolor~&
    PSet (a - 1, b + 4), pcolor~&
    PSet (a - 2, b + 4), pcolor~&
    PSet (a - 3, b + 4), pcolor~&
    PSet (a + 1, b - 4), pcolor~&
    PSet (a + 2, b - 4), pcolor~&
    PSet (a + 3, b - 4), pcolor~&
    PSet (a - 1, b - 4), pcolor~&
    PSet (a - 2, b - 4), pcolor~&
    PSet (a - 3, b - 4), pcolor~&
    PSet (a + 4, b + 1), pcolor~&
    PSet (a + 4, b + 2), pcolor~&
    PSet (a + 4, b + 3), pcolor~&
    PSet (a + 4, b - 1), pcolor~&
    PSet (a + 4, b - 2), pcolor~&
    PSet (a + 4, b - 3), pcolor~&
    PSet (a - 4, b + 1), pcolor~&
    PSet (a - 4, b + 2), pcolor~&
    PSet (a - 4, b + 3), pcolor~&
    PSet (a - 4, b - 1), pcolor~&
    PSet (a - 4, b - 2), pcolor~&
    PSet (a - 4, b - 3), pcolor~&
    PSet (a + 4, b + 4), pcolor~&
    PSet (a - 4, b - 4), pcolor~&
    PSet (a + 4, b - 4), pcolor~&
    PSet (a - 4, b + 4), pcolor~&
End Sub
Sub detect (cx, cy, x, y, w, h, rm, pcolor~&, pcolorchangeval~&)
    If cx >= x And cx <= x + w And cy >= y And cy <= y + h And rm = -1 Then
        pcolor~& = pcolorchangeval~&
    End If
End Sub
