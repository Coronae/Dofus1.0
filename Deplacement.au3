#cs ----------------------------------------------------------------------------

 AutoIt Version : 3.3.8.0

 Fonction du Script :
	Gestion des déplacement dans Dofus

#ce ----------------------------------------------------------------------------


; Utilise une potion ou une ressource dans l'inventaire rapide
; Dispo : bonta, rappel, brakmar
Func usePotion($type)
	FFSetDebugMode($DEBUG_GRAPHIC)


	local $ShadeVariation=0 ; Variable de Variation de couleur
	local $Coord ; Recupere coordonne du pixel trouve sous forme $Coord[0], $Coord[1]
	Local $Color = GetColor($type)

	;FFTrace(@HOUR&" "&@lf&"   ** Detection de zone " &$MaRessource &@lf&"") ; Put this in the different debugging channels (tracer.txt, console...) as set with FFSetDebugMode

	do
		$Coord = FFNearestPixel ( 0, 0, $Color) ;  Recherche la couleur de la ressource, stock dans $Coord[0], $Coord[1]
		if (Not IsArray($Coord)) Then $ShadeVariation += 1 ; Si pas de couleur trouve, on augmente la Variation

	until (IsArray($Coord) OR $ShadeVariation >250)  ;Boucle tant que couleur trouve ou Variation > 250


	if (IsArray($Coord)) Then  ; Si couleur trouve faire
		MouseClick("left",$Coord[0],$Coord[1], 2, 1) ; Double click sur la position trouvée ( potion dans la barre de raccourcis )
	Else

		;////////////////: DEBUG //////////////////////////

		local $sMsg = "Aucune Potion "&$type
		;FFTrace("   ** "&$sMsg&@lf&"")
		TrayTip("Not found", $sMsg, 2000)

		;////////////////: DEBUG //////////////////////////
	EndIf
EndFunc

