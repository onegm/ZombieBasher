extends Weapon
class_name Gun

@onready
var bullet_point = $GunPivotPoint/Pistol/BulletPoint

func target_enemy(enemies_in_range):
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
