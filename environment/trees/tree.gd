extends StaticBody2D

	
func _process(_delta):
	var overlapping = $CharacterDetector.get_overlapping_bodies().any(func(c): return c is CharacterBody2D)
	if overlapping:
		$Leaves.modulate.a = 0.4
	else:
		$Leaves.modulate.a = 1

func take_damage(_damage):
	if not $Sound.playing:
		$Sound.play(1.15)
