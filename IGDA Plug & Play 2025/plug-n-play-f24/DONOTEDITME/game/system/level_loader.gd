extends Node
## This class is designed to be a singleton object for loading and reloading levels.
## The most important takeaway from this class is the reload level function which 
## reloads/restarts the level. This is called when you press "restart" in the pause menu
## and at the end of the default kill screen animation. YOU DO NOT NEED TO MODIFY THIS CLASS
class_name LevelLoader

const LEVEL_END_TIME: float = 1

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var level_loaded: int = -1
var loading = false
var reloading = false

## Call this function to reload the scene
func reload_level() -> void:
	get_tree().paused = true
	reloading = true
	animation_player.play("CLOSE")


## Method stub for me to implement later when stringing all the levels together
func load_level(_level: PackedScene) -> void:
	get_tree().paused = true
	animation_player.play("CLOSE")


## This method is called when a level is ended
func end_level() -> void:
	get_tree().paused = true
	sound_player.unload_music_stream()
	level_loaded = -1
	
	sound_player.play_sound(load("res://DONOTEDITME/assets/sounds/sfx/win_fx.ogg"), Vector2(0, 0))
	var end_timer = get_tree().create_timer(LEVEL_END_TIME)
	end_timer.timeout.connect(level_end_timer_end)


func level_end_timer_end() -> void:
	animation_player.play("CLOSE")
	reload_level() # Temporary, replace with returning to the map later


func _on_animation_finished(anim_name):
	if anim_name == "CLOSE" and reloading:
		var _reload = get_tree().reload_current_scene()
		reloading = false


func _on_scene_loaded(level: Level):
	get_tree().paused = false
	animation_player.play("OPEN")
	
	if level_loaded != level.level_id:
		sound_player.load_music_stream(level.music_stream)
		level_loaded = level.level_id
