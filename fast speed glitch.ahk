SetBatchLines -1
#Persistent
#InstallKeybdHook
#InstallMouseHook

global macroEnabled := false
global exitFlag := false

; === GUI Setup ===
Gui, Add, Text,, Use the buttons below to control the macro:
Gui, Add, Button, gActivateMacro x20 y40 w100 h30, Activate
Gui, Add, Button, gDeactivateMacro x140 y40 w100 h30, Deactivate
Gui, Add, Button, gExitScript x260 y40 w100 h30, Exit Script
Gui, Show, w400 h100, Macro Control Panel
return

; === XButton1 Macro Trigger ===
XButton1::
if (!macroEnabled)
    return

exitFlag := false
Loop
{
    if (!GetKeyState("XButton1", "P") || exitFlag)
        Break

    MouseMove, 1300, 260, 0
    MouseMove, -50, 260, 0
    {
        Sleep, 9999999999999999999999999999999999999999
        if (exitFlag || !GetKeyState("XButton1", "P"))
            Break
    }
}
return

; === Button Actions ===
ActivateMacro:
macroEnabled := true
return

DeactivateMacro:
macroEnabled := false
exitFlag := true  ; force stop if currently running
return

ExitScript:
exitFlag := true
ExitApp
return

GuiClose:
Goto, ExitScript
