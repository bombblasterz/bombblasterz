' Made by Ibrahim Khan
'
' Discord : T_T#6886
'
' Feel free to use
'
'Version 1.01 Patch:
'
'FIXED BUGS :
'Previously drawn pixels changing color gradually
'CURRENT BUGS:
'After selecting a brush , and/or a background color/image the program does not rerender your previous drawing
'FEATURES NOT CODED IN YET:
'Selecting a brush has no effect
'Selecting an image has no effect
'Exporting images
'Top Bar
'
'Version 1.02 Patch:
'
'FIXED BUGS:
'None
'CURRENT BUGS:
'When trying to select a brush and/or a background color/image the program does not print selection test
'FEATURES NOT CODED IN YET:
'Selecting an image, or a background color has no effect
'Exporting images
'Top bar
'FEATURES CODED IN:
'Using different brush sizes has an effect now (You can only use sizes 1 to 3 currently)
'
'Version 1.03 Patch:
'
'FIXED BUGS:
'None
'CURRENT BUGS:
'When trying to select a brush and/or background color/image the program does not print selection text
'FEATURES NOT CODED IN YET:
'Selecting an image, or a background color has no effect
'Exporting images
'FEATURES CODED IN:
'Top Bar Partially coded in , no collission detection and no effect for clicking on things
'
'Version 1.04 Patch:
'
'FIXED BUGS:
'None
'CURRENT BUGS:
'When trying to select a brush and/or background color/image the program does not print selection text
'FEATURES NOT CODED IN YET:
'Selecting an image,or a background color has not effect
'Exporting images
'FEATURES CODED IN:
'Added a 4th brush
'Can now use the + and - keys to raise and lower the brush size , respectively
'
'Version 1.05 Patch:
'
'FIXED BUGS:
'None
'CURRENT BUGS:
'When trying to select a brush and/or a background color/image the program does not print selection text
'When redrawing the previous image after picking a new color the program will occasionally popup the color picker ui
'FEATURES NOT CODED IN YET
'Selecting an image, or a background color has no effect
'Exporting images
'FEATURES CODED IN:
'Added a color picker UI (Cannot Pick Colors Currently)
'Programmers note:
'Unfortunately , I find it extremely difficult to continue development without the use of external resources i.e (Images,fonts,sounds,etc...)
'
'Version 1.06 Patch:
'
'FIXED BUGS:
'None
'CURRENT BUGS:
'When trying to select a brush and/or a background color/image the program does not print selection text
'FEATURES NOT CODED IN YET:
'Color Picker UI Removed (Too Buggy)
'Selecting an image, or a background color has no effect
'Exporting images
'FEATURES CODED IN:
'None
'
'Version 1.07 Patch
'FIXED BUGS:
'None
'CURRENT BUGS:
'None
'FEATURES NOT CODED IN YET:
'Selecting an image , or a background color
'Exporting images
'FEATURES CODED IN:
'Added Color Picker in top bar
'Made RAM Usage Improvements by making a sub for brush sizes
'
Option _ExplicitArray
Screen _NewImage(1000, 500, 32)
_FullScreen
Type pixels
    x As Single
    y As Single
End Type
arraysize = _Width * _Height
Dim p(arraysize) As pixels
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
        If mx >= 5 And mx <= 5 + 23 And my >= 5 And my <= 5 + 14 And rm = -1 Then pcolor~& = _RGB32(0, 0, 255)
        If mx >= 40 And mx <= 40 + 23 And my >= 5 And my <= 5 + 14 And rm = -1 Then pcolor~& = _RGB32(255, 0, 0)
        If mx >= 75 And mx <= 75 + 23 And my >= 5 And my <= 5 + 14 And rm = -1 Then pcolor~& = _RGB32(0, 255, 0)
        If mx >= 110 And mx <= 110 + 23 And my >= 5 And my <= 5 + 14 And rm = -1 Then pcolor~& = _RGB32(255, 255, 0)
        If mx >= 145 And mx <= 145 + 23 And my >= 5 And my <= 5 + 14 And rm = -1 Then pcolor~& = _RGB32(255, 125, 0)
        If mx >= 180 And mx <= 180 + 23 And my >= 5 And my <= 5 + 14 And rm = -1 Then pcolor~& = _RGB32(100, 50, 0)
        If mx >= 215 And mx <= 215 + 23 And my >= 5 And my <= 5 + 14 And rm = -1 Then pcolor~& = _RGB32(0, 0, 0)
        If mx >= 5 And mx <= 5 + 23 And my >= 30 And my <= 30 + 14 And rm = -1 Then pcolor~& = _RGB32(255, 255, 255)
        If mx >= 40 And mx <= 40 + 23 And my >= 30 And my <= 30 + 14 And rm = -1 Then pcolor~& = _RGB32(255, 0, 255)
        If mx >= 75 And mx <= 75 + 23 And my >= 30 And my <= 30 + 14 And rm = -1 Then pcolor~& = _RGB32(144, 0, 255)
        If mx >= 110 And mx <= 110 + 23 And my >= 30 And my <= 30 + 14 And rm = -1 Then pcolor~& = _RGB32(0, 255, 255)
        If mx >= 145 And mx <= 145 + 23 And my >= 30 And my <= 30 + 14 And rm = -1 Then pcolor~& = _RGB32(136, 0, 21)
        If mx >= 180 And mx <= 180 + 23 And my >= 30 And my <= 30 + 14 And rm = -1 Then pcolor~& = _RGB32(200, 191, 231)
        If mx >= 215 And mx <= 215 + 23 And my >= 30 And my <= 30 + 13 And rm = -1 Then pcolor~& = _RGB32(112, 146, 190)
        'Color Detection End
        'Topbar Barrier Start
        If p(i).x >= 0 And p(i).x <= _Width And p(i).y >= 0 And p(i).y <= 75 And rm = -1 Then
            p(i).x = 0
            p(i).y = 0
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
