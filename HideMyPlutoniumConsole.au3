#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16.1
 Author:         lattemango

 Script Function:
	Hides the plutonium bootstrapper console via the tray.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#NoTrayIcon
#include <WinAPISysWin.au3>
#include <TrayConstants.au3>
Opt("TrayMenuMode", 3)

Local $showConsoleItem = TrayCreateItem("Show Console", -1, -1, $TRAY_ITEM_NORMAL)
Local $hideConsoleItem = TrayCreateItem("Hide Console", -1, -1, $TRAY_ITEM_NORMAL)
Local $exitItem = TrayCreateItem("Kill Script")

TraySetState($TRAY_ICONSTATE_SHOW)

While(1)
	Switch(TrayGetMsg())
		Case $hideConsoleItem
			Local $plutoniumConsole = WinGetHandle("[REGEXPTITLE:(?i)(Plutonium r\d{4,})]")
			WinSetState($plutoniumConsole, "", @SW_HIDE)
		Case $showConsoleItem
			Local $plutoniumConsole = WinGetHandle("[REGEXPTITLE:(?i)(Plutonium r\d{4,})]")
			WinSetState($plutoniumConsole, "", @SW_SHOW)
			_WinAPI_FlashWindowEx($plutoniumConsole, 8)
		Case $exitItem
			ExitLoop
	EndSwitch
WEnd
