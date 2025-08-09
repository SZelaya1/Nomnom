extends Node

func play_click():
	if $ButtonClick.playing:
		$ButtonClick.stop()
	$ButtonClick.play()
	
func play_close():
	if $ButtonClose.playing:
		$ButtonClose.stop()
	$ButtonClose.play()

func play_tutorial():
	if $ButtonOpenTutorial.playing:
		$ButtonOpenTutorial.stop()
	$ButtonOpenTutorial.play()
	
