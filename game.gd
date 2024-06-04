extends Node2D

@export
var enemy_scene : PackedScene

func _ready():
	$Timer.timeout.connect(spawn_enemy)
	$Player.health_depleted.connect(on_player_health_depleted)
	$GameOverLayer/ColorRect/HomeButton.pressed.connect(on_home_button_pressed)
	for i in range(7):
		spawn_enemy()

func spawn_enemy():
	var enemy = $Player/EnemySpawner.spawn_enemy()
	enemy.player = $Player
	add_child(enemy)

func on_player_health_depleted():
	$GameOverLayer.set_visible(true)
	get_tree().set_pause(true)

func on_home_button_pressed():
	var home_scene : PackedScene = load("res://ui/start_menu/start_menu.tscn")
	get_tree().set_pause(false)	
	get_tree().change_scene_to_packed(home_scene)
	
func _input(_event):
	if Input.is_action_just_pressed("pause"):
		get_tree().set_pause(true)
		$PauseMenu.set_visible(true)

