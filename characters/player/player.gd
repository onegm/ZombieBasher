extends CharacterBody2D
class_name Player

var max_speed = 500
var acceleration = 1000
var deceleration = 3000
var health = 100.0
var damage_rate = 5.0
var current_weapon : Weapon = null

signal health_depleted

@onready
var animations : Node2D = $Animations

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction == Vector2.ZERO:
		velocity -= velocity.normalized()* deceleration * delta
	else:
		velocity += direction * acceleration * delta
	
	velocity = velocity.clamp(Vector2(-1,-1)*max_speed, Vector2.ONE*max_speed)
	animations.look_at(get_global_mouse_position())
	#$FlashLight.look_at(get_global_mouse_position())
	move_and_slide()
	
	if velocity.length() > 0.0:
		animations.play_walk_animation()
	else:
		animations.play_idle_animation()

func take_damage(damage):
	health -= damage
	$HealthBar.set_value(health)
	if health <= 0.0:
		health_depleted.emit()
		
func set_weapon(weapon : Weapon):
	if current_weapon != null:
		current_weapon.queue_free()
	current_weapon = weapon
	animations.add_child(current_weapon)
	current_weapon.set_position(Vector2(20, 26))
