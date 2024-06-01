extends CharacterBody2D
class_name Player

var speed = 600
var health = 100.0
var damage_rate = 5.0

signal health_depleted

@onready
var animations : Node2D = $Animations

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	velocity = direction * speed
	animations.look_at(get_global_mouse_position())
	move_and_slide()
	
	if velocity.length() > 0.0:
		animations.play_walk_animation()
	else:
		animations.play_idle_animation()
	
	check_damage(delta)

func check_damage(delta):
	var overlapping_enemies = $HitBox.get_overlapping_bodies()
	health -= damage_rate*overlapping_enemies.size()*delta
	$HealthBar.set_value(health)
	
	if health <= 0.0:
		health_depleted.emit()
	
