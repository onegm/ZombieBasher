extends Control

@export
var start_scene : PackedScene
@export
var credits_scene : PackedScene

func _ready():
	$StartButton.pressed.connect(on_start_button_pressed)
	$CreditsButton.pressed.connect(on_credits_button_pressed)

func on_start_button_pressed():
	get_tree().change_scene_to_packed(start_scene)

func on_credits_button_pressed():
	get_tree().change_scene_to_packed(credits_scene)
