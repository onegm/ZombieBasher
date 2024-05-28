extends Area2D
class_name Weapon

@export
var bullet_scene : PackedScene

func _ready():
	$Timer.timeout.connect(shoot)
	
func target_enemy(enemies_in_range : Array):
	return enemies_in_range.front()

func _physics_process(_delta):
	var enemies_in_range = get_overlapping_bodies()
	
	if enemies_in_range.size() > 0:
		var enemy = target_enemy(enemies_in_range)
		look_at(enemy.global_position)

func shoot():
	pass

	
	
