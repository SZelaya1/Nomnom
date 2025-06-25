extends Node

func play_click():
	if $ButtonClick.playing:
		$ButtonClick.stop()
	$ButtonClick.play()
