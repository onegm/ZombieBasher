extends Control

@onready
var home_scene : PackedScene = preload("res://ui/start_menu/start_menu.tscn")

func _ready():
	$ResumeButton.pressed.connect(on_resume_button_pressed)
	$HomeButton.pressed.connect(on_home_button_pressed)

func on_resume_button_pressed():
	get_tree().set_pause(false)

func _input(event):
	if Input.is_action_just_pressed("pause"):
		on_resume_button_pressed()

func on_home_button_pressed():
	get_tree().change_scene_to_packed(home_scene)
