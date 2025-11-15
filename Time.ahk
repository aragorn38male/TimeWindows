#Requires AutoHotkey v2.0
clockGui := Gui("+AlwaysOnTop -Caption")

clockGui.Title := "Time"
clockGui.SetFont("s15 w700")
clockGui.BackColor := "Black"
clockGui.Add("Text", "w100 Center cLime vtime")
clockGui.Show("AutoSize Center")

SetTimer(UpdateClock, 1000)

UpdateClock() {
    global clockGui
currentTime := FormatTime(A_Now, "HH:mm:ss")

    clockGui["time"].Text := currentTime
}

clockGuiEscape(*) => CleanupGui()
clockGuiClose(*) => CleanupGui()

CleanupGui() {
    global clockGui
    try clockGui.Destroy()
    ExitApp
}

OnMessage(0x201, DragWindow)
DragWindow(wParam, lParam, msg, hwnd) {
    PostMessage(0xA1, 2,,, hwnd)
}

Esc::ExitApp
