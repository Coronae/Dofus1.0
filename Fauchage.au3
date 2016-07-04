#cs ----------------------------------------------------------------------------

 AutoIt Version : 3.3.8.0
 Auteur:         MonNom

 Fonction du Script :
	Modèle de Script AutoIt.

#ce ----------------------------------------------------------------------------

; Début du script - Ajouter votre code ci-dessous.


Func recolte()

	DetectRessource()
	Sleep(1500)  ;Temporaire, en attendant une meilleure solution
	Verif()
EndFunc   ;==>Fauchage

Func FastClick()
	$Coord = MouseGetPos()
	MouseClick("left", $Coord[0], $Coord[1], 1, 0) ; clique sur ressource
	MouseClick("left", $Coord[0] + 10, $Coord[1] + 42, 1, 0) ; 42 par defaut
EndFunc

;Fonction qui check et clique ressource
Func CliqueRessource($Coord, $ShadeVariation)

		;MouseMove($Coord[0], $Coord[1] + 40) ; +40 car curseur decale, vue que mousemove prend en compte l'ecran total pour les coord alors que FFBestSpot ne prend en compte que dofus pour coord...... C'EST LA MERDE
		;DetectSurbri($Coord)
		MouseClick("left", $Coord[0], $Coord[1] + 40, 1, 0) ; clique sur ressource

		;sleep(500)

		;MouseMove($Coord[0] + 10, $Coord[1] + 91) ; Deplace la souris où est suppose être l'action ( i.e faucher, miner couper etc)
		DetectRougeAction ($Coord)
		MouseClick("left", $Coord[0] + 10, $Coord[1] + 91, 1, 0) ; 91 par defaut 71 sur portable

			;////////////////: DEBUG //////////////////////////
		local $Msg = " pixels found (ShadeVariation : "&$ShadeVariation&"): the corresponding spot the closest is in "&$Coord[0]&","&$Coord[1];
		FFTrace("   ** "&$Msg&""&@lf&"")
		TrayTip(@HOUR& " Area found", $Msg, 2000)
			;//////////////// /DEBUG //////////////////////////

EndFunc
