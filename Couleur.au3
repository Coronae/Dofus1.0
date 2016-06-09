#cs ----------------------------------------------------------------------------

 AutoIt Version : 3.3.8.0
 Auteur:         MonNom

 Fonction du Script :
	Modèle de Script AutoIt.

#ce ----------------------------------------------------------------------------

; Début du script - Ajouter votre code ci-dessous.

Global $SurbriCouleur = "A3AE32" ; useless pour le moment, voir commentaire fonction DetectSurbri($Coord)
Global $LastResources

Func DetectRessource()

	FFSetDebugMode($DEBUG_GRAPHIC)


	local $ShadeVariation=0 ; Variable de Variation de couleur
	local $Coord ; Recupere coordonne du pixel trouve sous forme $Coord[0], $Coord[1]



	FFTrace(@HOUR&" "&@lf&"   ** Detection de zone " &$MaRessource &@lf&"") ; Put this in the different debugging channels (tracer.txt, console...) as set with FFSetDebugMode

	do
		$Coord = FFNearestPixel ( 0, 0, $ColorRessource) ;  Recherche la couleur de la ressource, stock dans $Coord[0], $Coord[1]
		if (Not IsArray($Coord)) Then $ShadeVariation += 1 ; Si pas de couleur trouve, on augmente la Variation

	until (IsArray($Coord) OR $ShadeVariation >250)  ;Boucle tant que couleur trouve ou Variation > 250


	if (IsArray($Coord)) Then  ; Si couleur trouve faire
		CliqueRessource($Coord, $ShadeVariation) ;Fonction qui check et clique ressource
	Else

		;////////////////: DEBUG //////////////////////////

		local $sMsg = "Pas de "&$MaRessource
		;FFTrace("   ** "&$sMsg&@lf&"")
		TrayTip("Not found", $sMsg, 2000)

		;////////////////: DEBUG //////////////////////////
	EndIf
EndFunc


;Renvoie les coordonnées
Func getPosColor($Color)



EndFunc



;Fonction qui permet d'attribuer dynamiquement les codes couleurs des ressources, MaRessource se configure dans le Main (variable global).
;Temporaire, le temps de creer la petite boite qui demandera à chaque lancement la roussource voulu.
; String ressources : ble, orge, avoine, fer, cuivre, bronze, frene
; String utils : bonta, rappel, brakmar
Func GetColor ($MaRessource)

	;RAPPEL COULEUR:

	;FERMIER
	;Couleur du ble 0xF5CC12
	;Couleur Orge 0x546800
	;Couleur Avoine 0xC76E00

	;MINEUR
	;Couleur Fer 0xE3E2D1
	;Couleur Cuivre 0xD38440


	;Bucheron
	;Couleur frène 0xD1B34B

	;RAPPEL SURBRILLANCE:
	; ble surbrillance E2C95A
	; orge surbrillance 8CD342
	; avoine surbrillance C89500
	; fer surbrillance BCBBB2

	Switch $MaRessource

; ----------------RESSSOURCES--------------------------------


		Case "orge"
			$SurbriCouleur = "8CD342"
			return 0x546800

		Case "ble"
			$SurbriCouleur = "E2C95A"
			return 0xF5CC12

		Case "avoine"
			$SurbriCouleur = "C89500"
			return 0xC76E00

		Case "fer"
			$SurbriCouleur = "BCBBB2"
			return 0xE3E2D1

		Case "cuivre"
			$SurbriCouleur = "BCBBB2" ; TODO surbri cuivre
			return 0xD38440

		Case "bronze"
			$SurbriCouleur = "BCBBB2" ; TODO surbri bronze
			return 0x926845

		Case "frene"
			$SurbriCouleur = "1946 "
			return 0xBDA255

; ----------------POTION-------------------------------------


		Case "bonta"
			return 0x4674CF
		Case "rappel"
			return 0x77B0A8

; ----------------UTILS---------------------------------------

		Case "zappi"
			return 0xF9DE45


		Case Else

			MsgBox(0, "ErreurGetColor", $MaRessource &" est inconnu saisiser encore la ressource, N'oubliez pas, minuscule et sans accents !")
			;Local $Screen = WinActivate("ErreurGetColor") ; We try to find and activate the proper windows
			;WinSetOnTop ( $Screen, "", 1)
			BoxRessource()




			;Local $hWnd = WinActivate("[CLASS:"&$WINDOW_CLASS&"; TITLE:"&$WINDOW_TITLE&"]", "") ; We try to find and activate the proper windows
			;WinSetOnTop ( $hWnd, "", 1)



	EndSwitch

EndFunc