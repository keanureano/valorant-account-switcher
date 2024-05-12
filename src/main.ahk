#SingleInstance, force
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
CoordMode,Mouse,Window
CoordMode,Pixel,Window

global valorantPath := A_Args[1]
global loginUsername := A_Args[2]
global loginPassword := A_Args[3]

Run, %valorantPath%

Sleep, 1000
Send, {Enter}

WinWaitActive, Riot Client

Loop {
  PixelGetColor, pixelColor, 160, 80, rgb
  Sleep, 50
} Until pixelColor = 0xEB0029

MouseGetPos, startX, startY
MouseClick, Left, 160, 80
MouseMove, startX, startY

Sleep, 100
SendInput, {Tab down}
SendInput, {Tab Up}
Sleep, 100
Send, %loginUsername%
Sleep, 100
SendInput, {Tab down}
SendInput, {Tab Up}
Sleep, 100
Send, %loginPassword%
Sleep, 2600
SendInput, {Enter down}
SendInput, {Enter up}

ExitApp