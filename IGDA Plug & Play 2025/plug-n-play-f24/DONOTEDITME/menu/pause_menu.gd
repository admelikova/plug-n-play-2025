extends CanvasLayer
## DO NOT TOUCH THIS CODE AT ALL. You should not need to modidy the pause screen.
class_name PauseMenu

# Other references
@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var focus_button: Button = $MenuElements/ColorRect/VBoxContainer/ContinueButton

# Volume Sliders
@onready var master_slider: Slider = $MenuElements/ColorRect/VBoxContainer/MasterVolumeSlider/HSlider
@onready var sfx_slider: Slider = $MenuElements/ColorRect/VBoxContainer/SFXSlider/HSlider
@onready var music_slider: Slider = $MenuElements/ColorRect/VBoxContainer/MusicSlider/HSlider

var loaded = false

# Called when the node enters the scene tree for the first time.
func _ready():
	sfx_slider.value = sfx_slider.max_value * sound_player.sfx_curr_vol
	master_slider.value = master_slider.max_value * sound_player.master_curr_vol
	music_slider.value = music_slider.max_value * sound_player.music_curr_vol
	loaded = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel") and not level_loader.reloading and not level_loader.loading:
		if not get_tree().paused:
			anim_player.play("OPEN")
			get_tree().paused = true
		else:
			anim_player.play("CLOSE")


func get_sfx_volume():
	return sfx_slider.value / sfx_slider.max_value


func get_master_volume():
	return master_slider.value / master_slider.max_value


func get_music_volume():
	return music_slider.value / music_slider.max_value


func _on_animation_finished(anim_name):
	if anim_name == "OPEN":
		focus_button.grab_focus()
	else:
		focus_button.grab_focus()
		focus_button.release_focus()
		get_tree().paused = false


func _on_slider_changed(_value: float):
	if loaded:
		sound_player.update_sound(self)


# Button Scripts

func _on_fullscreen_press() -> void:
	if (DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED):
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_continue_press() -> void:
	anim_player.play("CLOSE")


func _on_restart_press() -> void:
	level_loader.reload_level()
