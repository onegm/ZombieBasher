extends Node2D
class_name Weapon

func _ready():
	$Timer.timeout.connect(shoot)

func shoot():
	pass

	
	
