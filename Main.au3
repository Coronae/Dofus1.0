#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_Res_Language=1036
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs ----------------------------------------------------------------------------

 AutoIt Version : 3.3.8.0
 Auteur:         MonNom

 Fonction du Script :
	Mod�le de Script AutoIt.

#ce ----------------------------------------------------------------------------

; D�but du script - Ajouter votre code ci-dessous.

#include "FastFind.au3"
#Include <WinAPI.au3>
#include "Affichage.au3"
#Include "Couleur.au3"
#include "Fauchage.au3"
#include "CheckUp.au3"
#include "Deplacement.au3"

global const $DEBUG_DEFAULT = 2
global const $DEBUG_GRAPHIC = $DEBUG_DEFAULT + 4
global const $WINDOW_CLASS = "ShockwaveFlash" ; CLASS of the target Window
global const $WINDOW_TITLE = "Dofus" ; TITLE of the target Window
Global $MaRessource ;= "orge" ; Determine ressource recherch�. Disponible actuellement :  ble orge avoine fer cuivre ATTENTTION  TOUT MINUSCULE
Global $ColorRessource



FFSetDebugMode($DEBUG_GRAPHIC) 	 ; Enable advanced (graphical) debug mode, so you will have traces + graphical feedback
FFSetDefaultSnapShot(0)

;-------------------------------------------------------------------------------
;                           Raccourcis claviers
;-------------------------------------------------------------------------------

HotKeySet("{ESC}", "Bye") ; On assigne la fonction Bye (Pour quitter) � la touche 'Echap'
HotKeySet("^{SPACE}", "BoxRessource") ; On assigne la fonction Bye (Pour quitter) � la touche 'Echap'


;-------------------------------------------------------------------------------
;                             Main
;-------------------------------------------------------------------------------

;UsePotion("bonta")



BoxRessource()
Main()

Func Main()

	while (1)
		SelectWindow() ; R�cup�re la fen�tre Dofus

		recolte() ; Fonction de r�colte
		Verif()

	WEnd
EndFunc







Func Bye()
	Exit 0
EndFunc   ;==>Bye


