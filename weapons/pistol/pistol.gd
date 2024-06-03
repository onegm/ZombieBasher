extends Weapon
class_name Gun

@onready
var bullet_point = $BulletPoint
@onready
var bullet_scene : PackedScene = preload("res://weapons/pistol/bullet/bullet.tscn")
@onready
var muzzle_flash : PackedScene = preload("res://VFX/muzzle_flash/muzzle_flash.tscn")

func target_enemy(enemies_in_range):
	if enemies_in_range.is_empty():
		return
	var closest = enemies_in_range.front()
	var distance = global_position.distance_to(closest.global_position)
	for element in enemies_in_range:
		var current_distance = global_position.distance_to(element.global_position)
		if current_distance < distance:
			closest = element
			distance = current_distance
	return closest

func shoot():
	var bullet = bullet_scene.instantiate()
	bullet.global_position = bullet_point.global_position
	bullet.global_rotation = bullet_point.global_rotation
	bullet_point.add_child(bullet)
	
	var flash = muzzle_flash.instantiate()
	flash.global_position = Vector2.ZERO
	bullet_point.add_child(flash)
	$BulletSound.play(0.16)
	
	
	
