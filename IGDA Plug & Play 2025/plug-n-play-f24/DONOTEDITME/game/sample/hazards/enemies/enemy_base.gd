extends CharacterBody2D
## I've provided an EnemyBase class for you to extend for CharacterBody2D type
## enemy objects. It provides some basic functionality to interact with the underlying
## health/damage system I've implemented.
class_name EnemyBase

@export_category("Health/Damage Config")
## The maximum health of the enemy
@export var max_health: float = 1
## The starting health of the enemy
@export var starting_health: float = 1
## The contact damage of the enemy
@export var contact_damage: float = 1

# Enemy state
var current_health: float

# Called when the node enters the scene tree for the first time.
func _ready():
	current_health = starting_health


## Assuming the enemy is itself a hurtbox that deals contact damage, this will 
## return the damage that the enemy should deal on contact.
func get_source_damage() -> float:
	return contact_damage


## Deal damage to the enemy and check if the enemy has died
func damage(amount: float) -> void:
	current_health -= amount
	current_health = clampf(current_health, 0, max_health)
	check_death()


## Checks if the enemy has died and performs behavior accordingly
func check_death() -> void:
	if current_health <= 0.0:
		print(name + " has died")
		queue_free() # Remove the enemy from the scene
