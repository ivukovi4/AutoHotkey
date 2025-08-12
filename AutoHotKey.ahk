#Requires AutoHotkey v2.0

#SingleInstance Force

SC178 & Up::
{
    Send "{PgUp}"
}

SC178 & Down::
{
    Send "{PgDn}"
}

SC178 & Left::
{
    Send "{Home}"
}

SC178 & Right::
{
    Send "{End}"
}

#HotIf GetKeyState("Shift")
{
    SC178 & Up::
    {
        Send "{Shift Down}{PgUp}{Shift Up}"
    }

    SC178 & Down::
    {
        Send "{Shift Down}{PgDn}{Shift Up}"
    }

    SC178 & Left::
    {
        Send "{Shift Down}{Home}{Shift Up}"
    }

    SC178 & Right::
    {
        Send "{Shift Down}{End}{Shift Up}"
    }
}

#HotIf GetKeyState("Ctrl")
{
    SC178 & BackSpace:: {
        SendInput "+{End}"
        SendInput "{Delete}"
    }

    ^BackSpace:: {
        SendInput "+{Home}"

        if (WinActive('ahk_exe Code.exe') || WinActive('ahk_exe rider64.exe')) {
            ; Most IDE not selecting tabs by default
            SendInput "+{Home}"
        }

        SendInput "{Backspace}"
    }
}

#HotIf
{
    SC178 & BackSpace::
    {
        Send "{Delete}"
    }
}

Alt & BackSpace:: {
    SendInput "+^{Left}"
    SendInput "{Backspace}"
}

Alt & Left:: Send("^{Left}")

Alt & Right:: Send("^{Right}")

; GetSelectedText() {
;     clipSaved := ClipboardAll()
;     SendEvent "^c"
;     ClipWait(0.2)
;     selectedText := A_Clipboard
;     A_Clipboard := clipSaved
;     return selectedText
; }
