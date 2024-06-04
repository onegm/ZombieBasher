extends CanvasLayer

func _ready():
	$Control/ResumeButton.pressed.connect(on_resume_button_pressed)
	$Control/HomeButton.pressed.connect(on_home_button_pressed)

func on_resume_button_pressed():
	get_tree().set_pause(false)
	set_visible(false)

func _input(event):
	if event.is_action("pause") and visible == true:
		on_resume_button_pressed()
		get_tree().set_pause(false)

func on_home_button_pressed():
	var home_scene = load("res://ui/start_menu/start_menu.tscn")
	get_tree().set_pause(false)
	get_tree().change_scene_to_packed(home_scene)
