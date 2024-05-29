extends Node2D

const slime_scene = preload("res://characters/enemies/slime/slime.tscn")
const super_slime_scene = preload("res://characters/enemies/zombie/zombie.tscn")

@onready
var spawn_path = $SpawnPath/PathFollow2D
	
func spawn_enemy() -> Enemy:
	var enemy
	var num = randf()
	if num < 0.5:
		enemy = slime_scene.instantiate()
	else:
		enemy = super_slime_scene.instantiate()
	
	spawn_path.progress_ratio = randf()
	enemy.global_position = spawn_path.global_position
	return enemy
