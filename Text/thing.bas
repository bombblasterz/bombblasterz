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
Loop
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
        Do
            Cls , _RGB(127, 127, 127)
            Color _RGB(255, 0, 0)
            Print "Incorrect Details"
            Print "Usernames and Passwords are case sensitive"
            Print "Press R to retry"
            _Display
            retry$ = InKey$
            retry$ = UCase$(retry$)
            If retry$ = "R" Then GoTo login
        Loop
    End If
    _Limit 30
Loop
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
sumcheck = 0
For h = 1 To lenpass
    Cls
    z$ = Mid$(password$, h, 1)
    specialcheck = InStr("!@#$%^&*()", z$)
    numcheck = InStr("1234567890", z$)
    capitalcheck = InStr("ABCDEFGHIJKLMNOPQRSTUVWXYZ", z$)
    If lenpass > 8 Then sumcheck = sumcheck + 1
    If specialcheck = 0 Then sumcheck = sumcheck + 1
    If numcheck = 0 Then sumcheck = sumcheck + 1
    If capitalcheck = 0 Then sumcheck = sumcheck + 1
    If h = lenpass Then Exit For
Next
If sumcheck = 4 Then
    Do
        Cls
        Color _RGB(255, 0, 0), _RGB(127, 127, 127)
        Print "Weak Password"
        Print "A strong password should be"
        Color _RGB(0, 255, 0), _RGB(127, 127, 127)
        Print "At least 8 characters long"
        Print "Have at least 1 special character"
        Print "Have at least one number"
        Print "Have at least one capital letter"
        Color _RGB(255, 255, 255), _RGB(127, 127, 127)
        Print "Press T to try again"
        _Display
        tryagain$ = InKey$
        tryagain$ = UCase$(tryagain$)
        If tryagain$ = "T" Then GoTo create
    Loop
ElseIf sumcheck = 3 Then
    Do
        Cls
        Color _RGB(255, 255, 0), _RGB(127, 127, 127)
        Print "Medium Password"
        Print "A strong password should be"
        Color _RGB(0, 255, 0), _RGB(127, 127, 127)
        Print "At least 8 characters long"
        Print "Have at least 1 special character"
        Print "Have at least one number"
        Print "Have at least one capital letter"
        Color _RGB(255, 255, 255), _RGB(127, 127, 127)
        Print "Press T to try again"
        _Display
        tryagain$ = InKey$
        tryagain$ = UCase$(tryagain$)
        If tryagain$ = "T" Then GoTo create
    Loop
ElseIf sumcheck = 2 Then
    Do
        Cls , _RGB(127, 127, 127)
        Color _RGB(55, 216, 55), _RGB(127, 127, 127)
        Print "Normal Password"
        Print "A strong password should be"
        Color _RGB(0, 255, 0), _RGB(127, 127, 127)
        Print "At least 8 characters long"
        Print "Have at least 1 special character"
        Print "Have at least one number"
        Print "Have at least one capital letter"
        Color _RGB(255, 255, 255), _RGB(127, 127, 127)
        Print "Press T to try again"
        _Display
        tryagain$ = InKey$
        tryagain$ = UCase$(tryagain$)
        If tryagain$ = "T" Then GoTo create
    Loop
ElseIf sumcheck = 1 Then
    Do
        Cls , _RGB(127, 127, 127)
        Color _RGB(50, 255, 139), _RGB(127, 127, 127)
        Print "Good Password"
        Print "A strong password should be"
        Color _RGB(0, 255, 0), _RGB(127, 127, 127)
        Print "At least 8 characters long"
        Print "Have at least 1 special character"
        Print "Have at least one number"
        Print "Have at least one capital letter"
        Color _RGB(255, 255, 255), _RGB(127, 127, 127)
        Print "Press T to try again"
        _Display
        tryagain$ = InKey$
        tryagain$ = UCase$(tryagain$)
        If tryagain$ = "T" Then GoTo create
    Loop
ElseIf sumcheck = 0 Then
    Open "UserData.txt" For Append As #fh
    Print #fh, id$
    Print #fh, password$
    Close #fh
    Do
        Cls , _RGB(127, 127, 127)
        Color _RGB(0, 255, 0), _RGB(127, 127, 127)
        Print "Strong Password"
        Print "Account successfully created!"
        Color _RGB(0, 0, 0)
        Print "Press E to return to the menu"
        return$ = InKey$
        return$ = UCase$(return$)
        If return$ = Chr$(69) Then GoTo start:
        _Limit 30
    Loop
End If
loggedin:
resetpassword:
incorrectdetails:







