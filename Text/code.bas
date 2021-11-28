start:
Screen _NewImage(1000, 800, 32)
_FullScreen
Randomize Timer
Dim fh As Long
fh = FreeFile
sui& = _LoadFont("Fonts\segoeui.ttf", 30)
suismall& = _LoadFont("Fonts\segoeui.ttf", 15)
login& = _LoadImage("Graphics\LogIn.png")
orimage& = _LoadImage("Graphics\OR.png")
create& = _LoadImage("Graphics\Create.png")
debug = 0
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
        If x >= 340 And x <= 340 + 299 And y >= 200 And y <= 200 + 86 And rm = -1 Then
            _FreeImage login&: _FreeImage orimage&: _FreeImage create&
            GoTo login
        End If
        If x >= 340 And x <= 340 + 299 And y >= 600 And y <= 600 + 86 And rm = -1 Then
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
    Do
        Open "UserData\UserData.txt" For Input As #fh
        Input #fh, id$, password$
        Close #fh
        decrypt password$
        If idx$ = id$ And passwordx$ = password$ Then
            GoTo loggedin
        End If
        If idx$ <> id$ And passwordx$ <> password$ Or idx$ = id$ And passwordx$ <> password$ Then
            Do
                Cls , _RGB(127, 127, 127)
                Color _RGB(255, 0, 0)
                If debug = 1 Then Print "Actual password", password$
                If debug = 1 Then Print "Your try", passwordx$
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
Loop
create:
Cls , _RGB(127, 127, 127)
Color _RGB(255, 255, 255), _RGB(127, 127, 127)
_Font sui&
Print "Enter your accounts username/ID"
Input id$
Print "Enter your accounts password"
Input password$
sumcheck = 0
lenpass = Len(password$)
If lenpass > 8 Then sumcheck = sumcheck + 1
For h = 1 To lenpass
    z$ = Mid$(password$, h, 1)
    If InStr("!@#$%^&*()", z$) Then special_present = 1
    If InStr("1234567890", z$) Then num_present = 1
    If InStr("ABCDEFGHIJKLMNOPQRSTUVWXYZ", z$) Then capital_present = 1
Next
If special_present = 1 Then sumcheck = sumcheck + 1
If num_present = 1 Then sumcheck = sumcheck + 1
If capital_present = 1 Then sumcheck = sumcheck + 1
If sumcheck = 0 Then
    Do
        Cls
        Color _RGB(255, 0, 0), _RGB(127, 127, 127)
        Print sumcheck; "out of 4"
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
End If
If sumcheck = 1 Then
    Do
        Cls
        Color _RGB(255, 255, 0), _RGB(127, 127, 127)
        Print sumcheck; "out of 4"
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
End If
If sumcheck = 2 Then
    Do
        Cls , _RGB(127, 127, 127)
        Color _RGB(55, 216, 55), _RGB(127, 127, 127)
        Print sumcheck; "out of 4"
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
End If
If sumcheck = 3 Then
    Do
        Cls , _RGB(127, 127, 127)
        Color _RGB(50, 255, 139), _RGB(127, 127, 127)
        Print sumcheck; "out of 4"
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
End If
If sumcheck = 4 Then
    encrypt password$
    Open "UserData\UserData.txt" For Append As #fh
    Print #fh, id$
    Print #fh, password$
    Close #fh
    Do
        Cls , _RGB(127, 127, 127)
        Color _RGB(0, 255, 0), _RGB(127, 127, 127)
        Print sumcheck; "out of 4"
        Print "Strong Password"
        Print "Account successfully created!"
        Color _RGB(0, 0, 0)
        Print "Press E to return to the menu"
        _Display
        return$ = InKey$
        return$ = UCase$(return$)
        If return$ = Chr$(69) Then GoTo start:
        _Limit 30
    Loop
End If
Screen _NewImage(1300, 600)
loggedin:
Sub decrypt (password$)
    decryptedpass$ = ""
    For x = 1 To Len(password$)
        passz$ = Mid$(password$, x, 1)
        passasc = Asc(passz$)
        If passasc = 122 Or passasc = 90 Then passasc = passasc + 1 Else passasc = passasc - 1
        decryptedpass$ = decryptedpass$ + Chr$(passasc)
    Next
    password$ = decryptedpass$
End Sub
Sub encrypt (password$)
    encryptedpass$ = ""
    For x = 1 To Len(password$)
        passz$ = Mid$(password$, x, 1)
        passasc = Asc(passz$)
        If passasc = 122 Or passasc = 90 Then passasc = passasc - 1 Else passasc = passasc + 1
        encryptedpass$ = encryptedpass$ + Chr$(passasc)
    Next
    password$ = encryptedpass$
End Sub








