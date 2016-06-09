#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Add_Constants=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs
Autojoin Dofus combat

Raccourcis d'utilisation CTRL + SPACE

Algo : Récupération d'un pixel " combat de groupe ", puis accès à l'épée par un click avec shift appuyé.

#ce

#include "FastFind.au3"
#include <WinAPI.au3>


global const $WINDOW_CLASS = "ShockwaveFlash" ; CLASS of the target Window
global const $WINDOW_TITLE = "Dofus" ; TITLE of the target Window
global const $DEBUG_DEFAULT = 2
global const $DEBUG_GRAPHIC = $DEBUG_DEFAULT + 4
global $sizeWindow;


local $ColorGroup ="0x9D9175" ;Couleur du pixel groupe
local $ColorSword ="0xD67E29" ;Couleur du pixel Sword

HotKeySet("^{SPACE}","joinFight")
HotKeySet("!{SPACE}", "Bye") ; On assigne la fonction Bye (Pour quitter) à la touche 'Echap'

do
	sleep(1000)
until(0)




Func joinFight()
	local $CoordFight = findGroupAndSword();
	if(IsArray ($CoordFight)) Then
		MouseMove($CoordFight[0], $CoordFight[1]+45, 0)
		Send("{LSHIFT down}")
		MouseClick("left",$CoordFight[0], $CoordFight[1]+45)
		Send("{LSHIFT up}")
	EndIf
	Sleep(1000)
	Send("+é")
EndFunc

;Trouve un Group et l'épée tout en retournant la coordonnée de l'épée
Func findGroupAndSword()
	SelectWindow();
	Send("+é")
	FFSetDebugMode($DEBUG_GRAPHIC)


	local $ShadeVariation=0 ; Variable de Variation de couleur
	local $CoordGroup; Coordonnée de l'image " combat de groupe "
	local $CoordSword; Coordonnée de l'épée la plus proche du " combat de groupe "2


	;Recherche Pixel groupe
	do
		$CoordGroup = FFNearestPixel ( $sizeWindow[0]/2, $sizeWindow[1]/2, $ColorGroup) ;
		if (Not IsArray($CoordGroup)) Then $ShadeVariation += 1 ; Si pas de couleur trouve, on augmente la Variation

	until (IsArray($CoordGroup) OR $ShadeVariation >10)  ;Boucle tant que couleur trouve ou Variation > 10

	if (IsArray($CoordGroup)) Then
		;Recherche Pixel épée
		do
		$CoordSword = FFNearestPixel ( $CoordGroup[0], $CoordGroup[1], $ColorSword) ;
		if (Not IsArray($CoordSword)) Then $ShadeVariation += 1 ; 2Si pas de couleur trouve, on augmente la Variation

		until (IsArray($CoordSword) OR $ShadeVariation >10)  ;Boucle tant que couleur trouve ou Variation > 250
		;if IsArray($CoordSword) Then MouseMove($CoordSword[0], $CoordSword[1]+45, 0)
	Else

		;////////////////: DEBUG //////////////////////////

		local $sMsg = "Aucun combat sur la map"
		;FFTrace("   ** "&$sMsg&@lf&"")
		TrayTip("", $sMsg, 1500)

		;////////////////: DEBUG //////////////////////////
	EndIf

	If isNear($CoordSword, $CoordGroup) Then
		return $CoordSword
	Else
		return 0;
	EndIf

EndFunc

;vérifie si les coordonnées sont proches l'une de l'autre
Func isNear($Coord1, $Coord2)
	if(IsArray($Coord1) And IsArray($Coord2)) Then

		If abs($Coord1[0]-$Coord2[0])<250 Then
			If abs($Coord1[1]-$Coord2[1])<250 Then
				return 1
			EndIf
		EndIf
	EndIf
	return 0
EndFunc

Func SelectWindow()
	FFTrace(@lf&"   ** SelectWindow"&@lf&"") ; Put this in the different debugging channels as set with FFSetDebugMode
	local $hWnd = WinActivate("[CLASS:"&$WINDOW_CLASS&"; TITLE:"&$WINDOW_TITLE&"]", "") ; We try to find and activate the proper windows
	if $hWnd="" Then
		;$hWnd = WinGetHandle("[ACTIVE]", "") ; If the proper set window can't be found, we use the current active window
		MsgBox(0,"Erreur fenetre","Fenetre dofus non trouve")
	EndIf
	WinSetOnTop ( $hWnd, "", 1)

	$sizeWindow = WinGetClientSize("[active]") ;On recupere la taille de la fenetre dofus


	FFSetDebugMode($DEBUG_DEFAULT)
	FFSetWnd($hWnd)
	FFSnapShot()
	TrayTip("Select Window","Title of the Window: "&WinGetTitle($hWnd)&" Class:"&_WinAPI_GetClassName($hWnd), 2000)
	;FFTrace(@HOUR&"   ** SelectWindow => Title of the Window: "&WinGetTitle($hWnd)&" Class:"&_WinAPI_GetClassName($hWnd)&@lf) ; Put this in the different debugging channels as set with FFSetDebugMode
EndFunc

Func Bye()
	TrayTip("Fin du script AutoJoin","",1000)
	Sleep(1000)
	Exit 0
EndFunc   ;==>Bye