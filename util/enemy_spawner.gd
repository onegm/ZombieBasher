extends Node2D

const slime_scene = preload("res://characters/enemies/slime/slime.tscn")
const zombie_scene = preload("res://characters/enemies/zombie/zombie.tscn")
var mean = 0.0
var std = 0.5

@onready
var spawn_path = $SpawnPath/PathFollow2D
	
func spawn_enemy() -> Enemy:
	var enemy
	var num = clampf(randfn(mean, std), 0, 10)
	mean += 0.05
	std += 0.01
	if num < 1:
		enemy = slime_scene.instantiate()
	else:
		enemy = zombie_scene.instantiate()
	
	spawn_path.progress_ratio = randf()
	enemy.global_position = spawn_path.global_position
	return enemy
