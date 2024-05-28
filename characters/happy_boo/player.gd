extends CharacterBody2D

var speed = 600
var health = 100.0
var damage_rate = 5.0

signal health_depleted

@export
var animations : Node2D

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	velocity = direction * speed
	move_and_slide()
	
	if velocity.length() > 0.0:
		animations.play_walk_animation()
	else:
		animations.play_idle_animation()
	
	var overlapping_enemies = $HitBox.get_overlapping_bodies()
	health -= damage_rate*overlapping_enemies.size()*delta
	$HealthBar.set_value(health)
	
	if health <= 0.0:
		health_depleted.emit()
	
