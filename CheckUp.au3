#cs ----------------------------------------------------------------------------

 AutoIt Version : 3.3.8.0

#ce ----------------------------------------------------------------------------

#cs
	Fonction de v�rifications pour le script

#ce

;Fonction de v�rification g�n�rale
Func Verif()

	VerifNiveau() ; Fonction qui verifie si LVL UP => bouton OK rouge au centre de l'ecra
EndFunc


;Fonction qui verifie si la couleur de la ressource en surbrillance correspond a ce qui est attendu
;NE FONCTIONE PAS CORRECTEMENT car c'est la merde pour trouver le bon code couleur, autre solution � tester, checker si difference dans cette zone avec le snapshot
Func DetectSurbri($Coord)

	$Color = FFGetPixel($Coord[0], $Coord[1]) ; On r�cup�re la couleur sous la souris.
	Hex($Color, 6) ; On la convertie en Hexad�cimal
	if $Color = $SurbriCouleur Then MsgBox(0,"trouve","Surbri trouve !") ;Me sert de debug pour savoir si j'ai la bonne couleur X)
	If Not $Color = $SurbriCouleur Then Verif() ;Si la couleur sous le curseur n'est pas celle d'une ressource en surbrillance, on lance la fonction Verif().

EndFunc



;Fonction qui verifie si la couleur est celle du "Rouge Action" ( i.e faucher, miner couper etc)
Func DetectRougeAction ($Coord)

	$Color = FFGetPixel($Coord[0], $Coord[1]) ; On r�cup�re la couleur sous la souris.
	Hex($Color, 6) ; On la convertie en Hexad�cimal
	If Not $Color = $SurbriCouleur Then Verif() ;Si la couleur sous le curseur n'est pas celle d'une ressource en surbrillance, on lance la fonction Verif().

EndFunc


; Fonction qui verifie si LVL UP => bouton OK rouge au centre de l'ecran
;TODO BON FONCTIONNEMENT A VERIFIER, Test� � "blanc" en regardant o� la souris se positionn� mais necessite un vrai test...
Func VerifNiveau()

	;$size = WinGetClientSize("[active]") ;On recupere la taille de la fenetre dofus
	$niveau = PixelGetColor(936, 498 - 20) ; R�cup�re la couleur  o� se trouve le bouton Ok lors d'un message de passage � un niveau sup�rieur.
	;TrayTip("",@HOUR&" size windows" & $size[0] & $size[1], 2000)
	$niveau = Hex($niveau, 6)

	;TrayTip("",@HOUR&" Ok Lvl Up", 2000)

	;MouseMove(936, 498 - 20) ; On clique sur Ok et on relance la fonction Verif() au cas ou... Si tout vas bien, Verif() relancera la fonction Fauchage() qui relancera la fonction Verif etc.


	If $niveau = 'FF6100' Then   ; On teste si le bouton Ok de passage � niveau est pr�sent, si c'est la cas, on lance la fonction Niveau().
		TrayTip("",@HOUR&" Ok Lvl Up", 2000)
			;MouseMove(936, 498 - 20) ; On clique sur Ok et on relance la fonction Verif() au cas ou... Si tout vas bien, Verif() relancera la fonction Fauchage() qui relancera la fonction Verif etc.

		MouseClick("", 936, 498 - 20) ; On clique sur Ok et on relance la fonction Verif() au cas ou... Si tout vas bien, Verif() relancera la fonction Fauchage() qui relancera la fonction Verif etc.
		Verif()
	EndIf



EndFunc