@tool
extends EnemyHitbox
## A One Way Hitbox (for the goomba type enemy) that specifically only detects hitbox/hurtbox
## interaction from the downward direction, meaning the player must be falling onto this Hitbox
## to trigger a hit.
class_name EnemyOneWayHitbox

# Called when the node enters the scene tree for the first time.
func _ready():
	area_entered.connect(_on_hitbox_entered)


## This is the default hitbox detection behavior. It makes the assumption that the opposing hurtbox
## is a component/child of the object responsible for dealing damage to the enemy. It checks if that
## object has a get_source_damage() method and applies that damage to the enemy accordingly.
func _on_hitbox_entered(other: Area2D):
	# Ignore player hitboxes, player hitboxes should not cause damage'
	if other is PlayerHitbox:
		return
	
	if global_position.y - other.global_position.y < 15:
		return
	
	if other.get_parent() is PlayerSample and other.get_parent().velocity.y <= 0:
		return
	
	var source = other.get_parent()
	if source.has_method("get_source_damage"):
		enemy_reference.damage(source.get_source_damage())
	else:
		print_rich("[color=yellow]<WARNING: A potential damage source \"" + str(source.name) + 
		"\" that does not have a get_source_damage() method has entered the " + str(enemy_reference.name) + " hitbox>")
