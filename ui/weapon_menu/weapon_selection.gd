extends CanvasLayer

@export
var player : CharacterBody2D
@onready
var femur_scene = preload("res://weapons/femur/femur.tscn")
@onready
var pistol_scene = preload("res://weapons/pistol/pistol.tscn")

func _ready():
	get_tree().set_pause(true)
	$Control/PistolButton.pressed.connect(on_pistol_pressed)
	$Control/FemurButton.pressed.connect(on_femur_pressed)
	
func on_pistol_pressed():
	var pistol = pistol_scene.instantiate()
	player.set_weapon(pistol)
	set_visible(false)
	get_tree().set_pause(false)

func on_femur_pressed():
	var femur = femur_scene.instantiate()
	player.set_weapon(femur)
	set_visible(false)
	get_tree().set_pause(false)
