extends Area2D

var speed = 1000
var damage = 1
var max_range = 1200
var travelled_distance = 0

func _ready():
	body_entered.connect(on_body_entered)

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	global_position += direction * speed * delta
	
	travelled_distance += speed * delta
	
	if travelled_distance > max_range:
		queue_free()

func on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage(damage)
