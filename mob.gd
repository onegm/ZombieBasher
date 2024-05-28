extends CharacterBody2D

@export
var player : CharacterBody2D 

@export
var smoke_scene : PackedScene

@onready
var animations = $Slime

var health = 3
var speed = 150

func _ready():
	animations.play_walk()

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()
	
func take_damage():
	animations.play_hurt()
	health -= 1
	if health <= 0:
		queue_free()
		var smoke = smoke_scene.instantiate()
		smoke.global_position = global_position
		add_sibling(smoke)
