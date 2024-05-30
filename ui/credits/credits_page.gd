extends Control


func _ready():
	$HomeButton.pressed.connect(on_home_button_pressed)

func on_home_button_pressed():
	var home_scene : PackedScene = load("res://ui/start_menu/start_menu.tscn")
	get_tree().change_scene_to_packed(home_scene)
