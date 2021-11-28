_FullScreen
Randomize Timer
Dim Shared retrying As Integer
debug = 0
'Initial Dimming
'Setup for simulations

If debug = 0 Then
    Print "Enter the screens width"
    Input sx
    Print "Enter the screens length"
    Input sy
    Print "Enter the screens rgb red value"
    Input red
    Print "Enter the screens rgb green value"
    Input green
    Print "Enter the screens rgb blue value"
    Input blue
ElseIf debug = 1 Then sx = 1000: sy = 500: red = 0: green = 0: blue = 0
End If
'Initial Screen Setup

_Display
Screen _NewImage(sx, sy, 32)
start: Cls , _RGB(red, green, blue)
If red = 0 And green = 0 And blue = 0 Then
    fr = 255: fg = 255: fb = 255
Else fr = 0: fg = 0: fb = 0
End If
Color _RGB(fr, fg, fb), _RGB(red, green, blue)
'Simulation Setup
'

Do
    Cls
    Print "What shape would you like to simulate?"
    Print "Press 1 for Circle , 2 for Triangle , 3 for Rectangle , 4 for Square"
    _Display
    shape$ = InKey$
    If shape$ = Chr$(49) Then GoTo shapecircle
    If shape$ = Chr$(50) Then GoTo shapetriangle
    If shape$ = Chr$(51) Then GoTo shaperectangle
    If shape$ = Chr$(52) Then GoTo shapesquare
    _Limit 30
Loop
'Circle Simulation Setup

shapecircle: Print "Enter frames per second"
Input fps
Print "Enter circles radius"
Input r
Print "Enter circles x speed"
Input cxv
_Display
Do
    Cls
    Print "Enter circles x speed's direction (1 for right , 2 for left)"
    _Display
    Input cxvd
    _Limit 30
Loop Until cxvd = 1 Or cxvd = 2
Print "Enter circles y speed"
Input cyv
_Display
Do
    Cls
    Print "Enter circles y speed's direction (1 for up , 2 for down)"
    _Display
    Input cyvd
    _Limit 30
Loop Until cyvd = 1 Or cyvd = 2
Do
    Cls
    Print "Add barrier bounce? (1 for yes , 0 for no)"
    _Display
    Input bb
    _Limit 30
Loop Until bb = 1 Or bb = 0
Do
    Cls
    Print "Add barrier bounce acceleration? (1 for yes , 0 for no)"
    _Display
    Input bba
    _Limit 30
Loop Until bba = 1 Or bba = 0
If bba = 1 Then
    Print "Enter the amount of X barrier bounce acceleration"
    Input bbx
    Print "Enter the amount of Y barrier bounce acceleration"
    Input bby
    _Display
End If
Do
    Cls
    Print "Add barrier bounce random offset? (1 for yes , 0 for no)"
    Print "Note : barrier bounce acceleration will not work with this enabled"
    _Display
    Input bbo
    _Limit 30
Loop Until bbo = 1 Or bbo = 0
If bbo = 1 Then
    Cls
    Print "Enter minimum bounce offset value"
    Input bbomin
    Print "Enter maximum bounce offset value"
    Input bbomax
    _Display
End If
If bba = 1 And bbo = 1 Then bba = 0
Cls
x = _Width / 2
y = _Height / 2
'Circle Preview Setup

Call circlepreview(x, y, r, cxv, cyv, cxvd, cyvd, bb, bbo, bbomax, bbomin, bba, bbx, bby, fps)
If retrying = 1 Then Cls: GoTo shapecircle:
' Barrier Bounce Detection and Barrier Bounce Acceleration

Do
    If bb = 1 And bba = 1 Then
        If x >= _Width - r Then
            cxvd = 2
            cxv = cxv + bbx
        End If
        If x <= 0 + r Then
            cxvd = 1
            cxv = cxv - bbx
        End If
        If y >= _Height - r Then
            cyvd = 1
            cyv = cyv + bby
        End If
        If y <= 0 + r Then
            cyvd = 2
            cyv = cyv - bby
        End If
    End If
    ' Barrier Bounce Detection and Barrier Bounce Random Offset

    If bb = 1 And bbo = 1 Then
        If x >= _Width - r Then
            cxvd = 2
            chance = CInt(Rnd * (2 - 1 + 1))
            If chance = 1 Then cxv = cxv - CInt(Rnd * (bbomax - bbomin)) + bbomin
            If chance = 2 Then cxv = cxv + CInt(Rnd * (bbomax - bbomin)) + bbomin
        End If
        If x <= 0 + r Then
            cxvd = 1
            chance = CInt(Rnd * (2 - 1 + 1))
            If chance = 1 Then cxv = cxv - CInt(Rnd * (bbomax - bbomin)) + bbomin
            If chance = 2 Then cxv = cxv + CInt(Rnd * (bbomax - bbomin)) + bbomin
        End If
        If y >= _Height - r Then
            cyvd = 1
            chance = CInt(Rnd * (2 - 1 + 1))
            If chance = 1 Then cyv = cyv - CInt(Rnd * (bbomax - bbomin)) + bbomin
            If chance = 2 Then cyv = cyv + CInt(Rnd * (bbomax - bbomin)) + bbomin
        End If
        If y <= 0 + r Then
            cyvd = 2
            chance = CInt(Rnd * (2 - 1 + 1))
            If chance = 1 Then cyv = cyv - CInt(Rnd * (bbomax - bbomin)) + bbomin
            If chance = 2 Then cyv = cyv + CInt(Rnd * (bbomax - bbomin)) + bbomin
        End If
    End If
    ' Barrier Bounce Detection

    If bb = 1 And bba = 0 And bbo = 0 Then
        If x >= _Width - r Then cxvd = 2
        If x <= 0 + r Then cxvd = 1
        If y >= _Height - r Then cyvd = 1
        If y <= 0 + r Then cyvd = 2
    End If
    Cls
    ' Circle Drawing

    Print "Press 7 to end simulation"
    Circle (x, y), r
    Print chance
    _Display
    ' Circle Pixel Movement

    If cxvd = 1 Then x = x + cxv
    If cxvd = 2 Then x = x - cxv
    If cyvd = 1 Then y = y - cyv
    If cyvd = 2 Then y = y + cyv
    _Limit fps
Loop Until _KeyDown(55)
' Continue sub placed for continuation or ending

continue
GoTo start:
' Square Simulation Setup

shapesquare:
Print "Enter the frames per second"
Input fps
Print "Enter the squares length"
Input sl
Print "Enter the squares x speed"
Input svx
_Display
Do
    Cls
    Print "Enter the squares x speed direction (1 for left , 2 for right)"
    _Display
    Input sxd
    _Limit 30
Loop Until sxd = 1 Or sxd = 2
Print "Enter the squares y speed"
_Display
Input svy
Do
    Cls
    Print "Enter the squares y speed direction(1 for up, 2 for down)"
    _Display
    Input syd
    _Limit 30
Loop Until syd = 1 Or syd = 2
Do
    Cls
    Print "Enter barrier bounce? (1 for yes , 0 for no)"
    _Display
    Input bb
    _Limit 30
Loop Until bb = 1 Or bb = 0
sx = _Width / 2
sy = _Height / 2
Do
    'Barrier Bounce Detection

    If bb = 1 Then
        If sx >= _Width - sl Then sxd = 1
        If sx <= 0 Then sxd = 2
        If sy >= _Height - sl Then syd = 1
        If sy <= 0 Then syd = 2
    End If
    ' Inital Square Drawing

    Cls , _RGB(red, green, blue)
    Print "Press 7 to exit the simulation"
    PSet (sx, sy)
    square$ = "U" + Str$(sl) + "R" + Str$(sl) + "D" + Str$(sl) + "L" + Str$(sl)
    Draw square$
    _Display
    ' Square Pixel Movement

    If sxd = 1 Then sx = sx - svx
    If sxd = 2 Then sx = sx + svx
    If syd = 1 Then sy = sy - syd
    If syd = 2 Then sy = sy + syd
    _Limit fps
Loop Until _KeyDown(55)
' Continue sub placed for retrying or ending

continue
' Triangle Simulation Setup

GoTo start:
shapetriangle:
Print "Enter the frames per second"
Input fps
Print "Enter the triangles left most length"
Input tria
Print "Enter the triangles right most length"
Input trib
' Tric = base , the base of a triangle must be the sum of tria and trib

tric = tria + trib
_Display
Print "Enter the triangles x speed"
Input trixv
_Display
Do
    Cls
    Print "Enter the triangles x speed direction (1 for left , 2 for right)"
    _Display
    Input trixvd
    _Limit 30
Loop Until trixvd = 1 Or trixvd = 2
Print "Enter the triangles y speed"
Input triyv
_Display
Do
    Cls
    Print "Enter the triangles y speed direction (1 for up , 2 for down)"
    _Display
    Input triyvd
    _Limit 30
Loop Until triyvd = 1 Or triyvd = 2
Do
    Cls
    Print "Enter barrier bounce? (1 for yes , 0 for no)"
    _Display
    Input bb
    _Limit 30
Loop Until bb = 1 Or bb = 0
trix = _Width / 2
triy = _Height / 2
Do
    'Barrier Bounce Detection

    If bb = 1 Then
        If trix >= _Width - tric Then trixvd = 1
        If trix <= 0 Then trixvd = 2
        If triy >= _Height Then triyvd = 1
        If triy <= 0 + tria Then triyvd = 2
    End If
    'Inital Triangle Drawing

    Cls , _RGB(red, green, blue)
    Print "Press 7 to exit the simulation"
    PSet (trix, triy)
    triangle$ = "E" + Str$(tria) + "F" + Str$(trib) + "L" + Str$(tric)
    Draw triangle$
    _Display
    'Triangle Pixel Movement

    If trixvd = 1 Then trix = trix - trixv
    If trixvd = 2 Then trix = trix + trixv
    If triyvd = 1 Then triy = triy - triyv
    If triyvd = 2 Then triy = triy + triyv
    _Limit fps
Loop Until _KeyDown(55)
'Sub continue placed for retrying or ending

continue
GoTo start:
shaperectangle:
'Sub continue code

Sub continue
    Do
        Cls
        Print "Press E to end or Press R to retry"
        _Display
        retry$ = InKey$
        retry$ = UCase$(retry$)
        If retry$ = "R" Then Exit Sub
        If retry$ = "E" Then End
        _Limit 30
    Loop
End Sub
'Circle Preview Sub Code

Sub circlepreview (circlex, circley, radius, xspeed, yspeed, xdirection, ydirection, barrierbounce, barrierbounceoffset, barrierbouncemax, barrierbouncemin, barrierbounceacceleration, barrierbouncex, barrierbouncey, fps)
    cx = circlex
    cy = circley
    cr = radius
    xs = xspeed
    ys = yspeed
    xd = xdirection
    yd = ydirection
    bb = barrierbounce
    bbo = barrierbounceoffset
    bba = barrierbounceacceleration
    bbx = barrierbouncex
    bby = barrierbouncey
    bbomax = barrierbouncemax
    bbomin = barrierbouncemin
    If xd = 2 Then xdirection$ = "left"
    If xd = 1 Then xdirection$ = "right"
    If yd = 1 Then ydirection$ = "up"
    If yd = 2 Then ydirection$ = "down"
    If bb = 1 Then bouncestatus$ = "on" Else bouncestatus$ = "off"
    If bba = 1 And bbo = 1 Then bba = 0
    If bba = 1 Then bounceacceleration$ = "on" Else bounceacceleration$ = "off"
    If bbo = 1 Then bounceoffset$ = "on" Else bounceoffset$ = "off"
    Do
        If bb = 1 And bba = 1 Then
            If cx >= _Width - cr Then
                xd = 2
                xs = xs + bbx
            End If
            If cx <= 0 + cr Then
                xd = 1
                xs = xs + bbx
            End If
            If cy >= _Height - cr Then
                yd = 1
                ys = ys + bby
            End If
            If cy <= 0 + cr Then
                yd = 2
                ys = ys + bby
            End If
        End If
        If bb = 1 And bbo = 1 Then
            If cx >= _Width - cr Then
                xd = 2
                chance = CInt(Rnd * (2 - 1 + 1))
                If chance = 1 Then xs = xs - CInt(Rnd * (bbomax - bbomin)) + bbomin
                If chance = 2 Then xs = xs + CInt(Rnd * (bbomax - bbomin)) + bbomin
            End If
            If cx <= 0 + cr Then
                xd = 1
                chance = CInt(Rnd * (2 - 1 + 1))
                If chance = 1 Then xs = xs - CInt(Rnd * (bbomax - bbomin)) + bbomin
                If chance = 2 Then xs = xs + CInt(Rnd * (bbomax - bbomin)) + bbomin
            End If
            If cy >= _Height - cr Then
                yd = 1
                chance = CInt(Rnd * (2 - 1 + 1))
                If chance = 1 Then ys = ys - CInt(Rnd * (bbomax - bbomin)) + bbomin
                If chance = 2 Then ys = ys + CInt(Rnd * (bbomax - bbomin)) + bbomin
            End If
            If cy <= 0 + cr Then
                yd = 2
                chance = CInt(Rnd * (2 - 1 + 1))
                If chance = 1 Then ys = ys - CInt(Rnd * (bbomax - bbomin)) + bbomin
                If chance = 2 Then ys = ys + CInt(Rnd * (bbomax - bbomin)) + bbomin
            End If
        End If
        If bb = 1 And bba = 0 And bbo = 0 Then
            If cx >= _Width - cr Then xd = 2
            If cx <= 0 + cr Then xd = 1
            If cy >= _Height - cr Then yd = 1
            If cy <= 0 + cr Then yd = 2
        End If
        Cls
        Print "SETTINGS"
        Print "Frames Per Second(fps):", fps
        Print "Circle Radius:", cr
        Print "Circle X Speed:", xs
        Print "Circle Y Speed:", ys
        Print "Circle X Speed Direction:", xdirection$
        Print "Circle Y Speed Direction:", ydirection$
        Print "Barrier Bounce Status:", bouncestatus$
        Print "Barrier Bounce Offset Status:", bounceoffset$
        Print "Barrier Bounce Offset Minimum:", bbomin
        Print "Barrier Bounce Offset Maximum:", bbomax
        Print "Barrier Bounce Acceleration Status:", bounceacceleration$
        Print "Barrier Bounce X Acceleration:", bbx
        Print "Barrier Bounce Y Acceleration:", bby
        Print "Preview of Simulation:"
        Print "Press 9 to end preview"
        Print "Press R to reenter settings"
        retry$ = InKey$
        retry$ = UCase$(retry$)
        If retry$ = Chr$(82) Then
            retrying = 1
            Exit Sub
        Else retrying = 0
        End If
        Circle (cx, cy), cr
        _Display
        If xd = 1 Then cx = cx + xs
        If xd = 2 Then cx = cx - xs
        If yd = 1 Then cy = cy - ys
        If yd = 2 Then cy = cy + ys
        _Limit fps
    Loop Until _KeyDown(57)
End Sub




























