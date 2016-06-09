#cs ----------------------------------------------------------------------------

 AutoIt Version : 3.3.8.0
 Auteur:         MonNom

 Fonction du Script :
	Mod�le de Script AutoIt.

#ce ----------------------------------------------------------------------------

; D�but du script - Ajouter votre code ci-dessous.


Func recolte()

	DetectRessource()
	Sleep(6000)  ;Temporaire, en attendant une meilleure solution
	Verif()
EndFunc   ;==>Fauchage

;Fonction qui check et clique ressource
Func CliqueRessource($Coord, $ShadeVariation)

		;MouseMove($Coord[0], $Coord[1] + 40) ; +40 car curseur decale, vue que mousemove prend en compte l'ecran total pour les coord alors que FFBestSpot ne prend en compte que dofus pour coord...... C'EST LA MERDE
		;DetectSurbri($Coord)
		MouseClick("left", $Coord[0], $Coord[1] + 40) ; clique sur ressource

		;sleep(500)

		;MouseMove($Coord[0] + 10, $Coord[1] + 91) ; Deplace la souris o� est suppose �tre l'action ( i.e faucher, miner couper etc)
		DetectRougeAction ($Coord)
		MouseClick("left", $Coord[0] + 10, $Coord[1] + 91)

			;////////////////: DEBUG //////////////////////////
		local $Msg = " pixels found (ShadeVariation : "&$ShadeVariation&"): the corresponding spot the closest is in "&$Coord[0]&","&$Coord[1];
		FFTrace("   ** "&$Msg&""&@lf&"")
		TrayTip(@HOUR& " Area found", $Msg, 2000)
			;//////////////// /DEBUG //////////////////////////

EndFunc