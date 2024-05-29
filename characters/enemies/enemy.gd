extends CharacterBody2D
class_name Enemy

var player : CharacterBody2D 

@export
var health = 3
@export
var speed = 150
@export
var death_scene : PackedScene

@onready
var animations = $Animations

func _ready():
	#animations.play_walk()
	pass

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()
	
func take_damage(damage):
	#animations.play_hurt()
	health -= damage
	if health <= 0:
		queue_free()
		#var death_animation = death_scene.instantiate()
		#death_animation.global_position = global_position
		#add_sibling(death_animation)
