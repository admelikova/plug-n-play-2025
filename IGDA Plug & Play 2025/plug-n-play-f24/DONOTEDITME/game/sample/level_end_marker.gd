extends Area2D
## As the name implies, this class represents what the player has to touch in order to
## complete the level. Your level must have a level end marker in order for the player
## to be able to beat your level and choose another level. DO NOT modify this code.
class_name LevelEndMarker


# Called when the node enters the scene tree for the first time.
func _ready():
	body_entered.connect(_on_area_entered)
	area_entered.connect(_on_area_entered)


func _on_area_entered(other):
	if other is PlayerSample:
		level_loader.end_level()
		print_rich("[color=green]You have cleared this level")
