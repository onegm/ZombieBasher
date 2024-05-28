extends Area2D

@export
var bullet_scene : PackedScene

@onready
var bullet_point = $GunPivotPoint/Pistol/BulletPoint

func _ready():
	$Timer.timeout.connect(shoot)

func _physics_process(_delta):
	var enemies_in_range = get_overlapping_bodies()
	
	if enemies_in_range.size() > 0:
		var target_enemy = find_closest(enemies_in_range)
		look_at(target_enemy.global_position)

func shoot():
	var bullet = bullet_scene.instantiate()
	bullet.global_position = bullet_point.global_position
	bullet.global_rotation = bullet_point.global_rotation
	bullet_point.add_child(bullet)

func find_closest(arr):
	var closest = arr.front()
	var distance = global_position.distance_to(closest.global_position)
	for element in arr:
		var current_distance = global_position.distance_to(element.global_position)
		if current_distance < distance:
			closest = element
			distance = current_distance
	return closest
	
	
