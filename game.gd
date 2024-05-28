extends Node2D

@export
var mob_scene : PackedScene

@onready
var spawn_path = $Player/SpawnPath/PathFollow2D

func _ready():
	$Timer.timeout.connect(spawn_mob)
	$Player.health_depleted.connect(on_player_health_depleted)
	for i in range(7):
		spawn_mob()

func spawn_mob():
	var mob = mob_scene.instantiate()
	spawn_path.progress_ratio = randf()
	mob.global_position = spawn_path.global_position
	mob.player = $Player
	add_child(mob)

func on_player_health_depleted():
	$GameOverLayer.set_visible(true)
	get_tree().set_pause(true)
