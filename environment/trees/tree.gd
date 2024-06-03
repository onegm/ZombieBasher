extends StaticBody2D

func _ready():
	var rand_scale = randf_range(0.7, 1.5)
	var rand_position = Vector2(randi_range(0, 4000), randi_range(0, 4000))
	set_scale(scale*rand_scale)
	set_global_position(rand_position)
	
func _process(_delta):
	var overlapping = $CharacterDetector.get_overlapping_bodies().any(func(c): return c is CharacterBody2D)
	if overlapping:
		$Leaves.modulate.a = 0.5
	else:
		$Leaves.modulate.a = 1

func take_damage(_damage):
	if not $Sound.playing:
		$Sound.play(1.15)
