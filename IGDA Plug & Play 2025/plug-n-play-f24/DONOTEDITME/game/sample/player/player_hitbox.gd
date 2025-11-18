@tool
extends Area2D
## This is a basic default PlayerHitbox component designed to automatically work
## with the basic player class. When a hurtbox on the Enemy, EnemyProjectile, or Hazard
## layers enters this hitbox, the player damage function is called with the damage
## dealer's information. In order to get this to work as universally as possible, 
## the hitbox simply checks if the opposing hurtbox has a "get_source_damage()" method.
class_name PlayerHitbox

@onready var player_reference: PlayerSample = $"../"

# Called when the node enters the scene tree for the first time.
func _ready():
	area_entered.connect(_on_hitbox_entered)


## This is the default hitbox detection behavior. It makes the assumption that the opposing hurtbox
## is a component/child of the object responsible for dealing damage to the player. It checks if that
## object has a get_source_damage() method and applies that damage to the player accordingly.
func _on_hitbox_entered(other: Area2D):
	# Ignore hitboxes
	if other is EnemyHitbox:
		return
	
	var source = other.get_parent()
	if source.has_method("get_source_damage"):
		player_reference.damage(source.get_source_damage())
	else:
		print_rich("[color=yellow]<WARNING: A potential damage source \"" + str(source.name) + 
		"\" that does not have a get_source_damage() method has entered the PlayerSample hitbox>")


## Extra code to show an editor warning if this is not attached to a PlayerSample object
func _get_configuration_warnings():
	if not (get_parent() is PlayerSample):
		return ["This PlayerHurtbox component must be a child of a PlayerSample object"]
	return []
