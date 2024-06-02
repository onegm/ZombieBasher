extends Node2D

var speed = 1000
var damage = 1
var max_range = 1200
var travelled_distance = 0

@export
var impact_scene : PackedScene

func _ready():
	$HitBox.area_entered.connect(on_impact)

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	global_position += direction * speed * delta
	
	travelled_distance += speed * delta
	
	if travelled_distance > max_range:
		queue_free()

func on_impact(_area):
	queue_free()

	var impact = impact_scene.instantiate()
	impact.global_position = global_position
	add_sibling(impact)
