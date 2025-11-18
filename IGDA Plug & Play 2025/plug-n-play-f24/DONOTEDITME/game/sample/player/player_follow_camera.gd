@tool
extends Camera2D
## This camera dynamically follows the player and can be configured to fixed level
## bounds. You should not need to modify this code, HOWEVER, you can dynamically change the
## minimum and maximum bounds of a player follow camera in code if you wanted to.
class_name PlayerFollowCamera

@export_category("Camera Bounds")
@export var min_x: float
@export var min_y: float
@export var max_x: float
@export var max_y: float

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position.x = clampf(%Player.global_position.x, min_x, max_x)
	position.y = clampf(%Player.global_position.y, min_y, max_y)
	queue_redraw()

func _draw():
	if Engine.is_editor_hint():
		var top_left = Vector2(min_x, min_y) - global_position
		draw_rect(Rect2(top_left, Vector2(max_x - min_x, max_y - min_y)), Color.RED, false, 3.0)
