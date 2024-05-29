extends Node2D

@export
var enemy_scene : PackedScene

@onready
var spawn_path = $Player/SpawnPath/PathFollow2D

func _ready():
	$Timer.timeout.connect(spawn_enemy)
	$Player.health_depleted.connect(on_player_health_depleted)
	for i in range(7):
		spawn_enemy()

func spawn_enemy():
	var enemy = enemy_scene.instantiate()
	spawn_path.progress_ratio = randf()
	enemy.global_position = spawn_path.global_position
	enemy.player = $Player
	add_child(enemy)

func on_player_health_depleted():
	$GameOverLayer.set_visible(true)
	get_tree().set_pause(true)
