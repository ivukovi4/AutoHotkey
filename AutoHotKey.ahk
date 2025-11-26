#Requires AutoHotkey v2.0
#SingleInstance Force

; Optional: make synthetic keys snappier
SetKeyDelay(0, 10)  ; press delay 0 ms, release delay 10 ms

; ─────────────────────────────────────────
; SC178 as navigation modifier
; ─────────────────────────────────────────

; No modifiers
#HotIf !GetKeyState("Shift", "P")
SC178 & Up:: SendInput("{PgUp}")
SC178 & Down:: SendInput("{PgDn}")
SC178 & Left:: SendInput("{Home}")
SC178 & Right:: SendInput("{End}")
#HotIf

; With physical Shift held → select while moving
#HotIf GetKeyState("Shift", "P")
SC178 & Up:: SendInput("+{PgUp}")   ; Shift+PgUp
SC178 & Down:: SendInput("+{PgDn}")   ; Shift+PgDn
SC178 & Left:: SendInput("+{Home}")   ; Shift+Home
SC178 & Right:: SendInput("+{End}")    ; Shift+End
#HotIf

; ─────────────────────────────────────────
; macOS-like Ctrl + Backspace behavior
; ─────────────────────────────────────────

#HotIf GetKeyState("Ctrl", "P")
SC178 & BackSpace:: {
    ; Delete to end of line
    SendInput("+{End}")
    SendInput("{Delete}")
}

^BackSpace:: {
    ; Select to beginning
    SendInput("+{Home}")

    if (WinActive("ahk_exe Code.exe") || WinActive("ahk_exe rider64.exe")) {
        ; Some IDEs need this twice
        SendInput("+{Home}")
    }

    SendInput("{Backspace}")
}
#HotIf

; Default SC178 + Backspace → Delete
#HotIf
SC178 & BackSpace:: SendInput("{Delete}")

; ─────────────────────────────────────────
; Alt word navigation / deletion
; ─────────────────────────────────────────

Alt & BackSpace:: {
    SendInput("+^{Left}")   ; select previous word
    SendInput("{Backspace}")
}

Alt & Left:: SendInput("^{Left}")
Alt & Right:: SendInput("^{Right}")