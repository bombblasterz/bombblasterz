start:
Screen _NewImage(1000, 800, 32)
_FullScreen
Randomize Timer
Dim fh As Long
fh = FreeFile
sui& = _LoadFont("segoeui.ttf", 30)
login& = _LoadImage("LogIn.png")
orimage& = _LoadImage("OR.png")
create& = _LoadImage("Create.png")
Do
    Cls
    _PutImage (340, 200), login&
    _PutImage (340, 400), orimage&
    _PutImage (340, 600), create&
    _Display
    While _MouseInput
        x = _MouseX
        y = _MouseY
        rm = _MouseButton(1)
        If x >= 340 And x <= 340 + 317 And y >= 200 And y <= 200 + 58 And rm = -1 Then
            _FreeImage login&: _FreeImage orimage&: _FreeImage create&
            GoTo login
        End If
        If x >= 340 And x <= 340 + 317 And y >= 600 And y <= 600 + 58 And rm = -1 Then
            _FreeImage login&: _FreeImage orimage&: _FreeImage create&
            GoTo create
        End If
    Wend
    _Limit 30
Loop Until _KeyDown(13)
login: Do
    Cls , _RGB(127, 127, 127)
    Color _RGB(255, 255, 255), _RGB(127, 127, 127)
    _Font sui&
    Print "Enter your ID"
    Input idx$
    Print "Enter your password"
    Input passwordx$
    _Display
    Open "UserData.txt" For Input As #fh
    Input #fh, id$, password$
    Close #fh
    If idx$ = id$ And passwordx$ = password$ Then
        GoTo loggedin
    End If
    If idx$ = id$ And passwordx$ <> password$ Then
        GoTo resetpassword
    End If
    If idx$ <> id$ And passwordx$ <> password$ Then
        Color _RGB(255, 0, 0)
        Print "Incorrect Details"
        Print "Usernames and Passwords are case sensitive"
    End If
    _Limit 30
Loop Until _KeyDown(13)
create:
Cls , _RGB(127, 127, 127)
Color _RGB(255, 255, 255), _RGB(127, 127, 127)
_Font sui&
Print "Enter your accounts username/ID"
Input id$
Print "Enter your accounts password"
Input password$
_Display
lenpass = Len(password$)
For h = 1 To lenpass
    Cls
    z$ = Mid$(password$, h, 1)
    If InStr("!@#$%^&*()", z$) = 0 Then
        Color _RGB(255, 0, 0), _RGB(127, 127, 127)
        _PrintString (120, 80), "Weak Password, a strong password should contain at least one special character"
        Do
            Print "Press T to try again"
            tryagain$ = InKey$
            tryagain$ = UCase$(tryagain$)
            If tryagain$ = "T" Then GoTo create
        Loop Until tryagain$ = "T"
        _Display
    End If
Next
Open "UserData.txt" For Append As #fh
Print #fh, id$
Print #fh, password$
Close #fh
Do
    Cls
    Print "Press E to return to the menu"
    return$ = InKey$
    return$ = UCase$(return$)
    If return$ = Chr$(69) Then GoTo start:
    _Limit 30
Loop Until return$ = Chr$(69)
loggedin:
resetpassword:
incorrectdetails:







