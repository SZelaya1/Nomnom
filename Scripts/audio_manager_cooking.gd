extends Node

@onready var music_player = $BackgroundMusic_Cooking

func _ready():
	if not music_player.is_connected("finished", Callable(self, "_on_music_finished")):
		music_player.connect("finished", Callable(self, "_on_music_finished"))

func play_music(path: String):
	if music_player.stream and music_player.stream.resource_path == path and music_player.playing:
		return 
	music_player.stop()
	music_player.stream = load(path)
	music_player.play()

func stop_music():
	if music_player.playing:
		music_player.stop()

func play_correct():
	$CorrectSound.play()

func play_wrong():
	$WrongSound.play()

func _on_music_finished():
	if music_player.stream:
		music_player.play()
