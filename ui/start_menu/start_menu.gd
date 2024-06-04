extends Control

func _ready():
	$StartButton.pressed.connect(on_start_button_pressed)
	$CreditsButton.pressed.connect(on_credits_button_pressed)

func on_start_button_pressed():
	var start_scene : PackedScene = load("res://game.tscn")
	get_tree().change_scene_to_packed(start_scene)

func on_credits_button_pressed():
	var credits_scene : PackedScene = load("res://ui/credits/credits_page.tscn")
	get_tree().change_scene_to_packed(credits_scene)
