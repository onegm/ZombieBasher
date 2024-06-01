extends Weapon

var damage = 30
var state = "idle"

func shoot():
	state = "active"
	$AnimationPlayer.play("shoot")
	await $AnimationPlayer.animation_finished
	state = "idle"
	

func _process(delta):
	if state != "active":
		return
		
	var bodies = $Femur/AttackArea.get_overlapping_bodies()
	for body in bodies:
		if body.has_method("take_damage"):
			body.take_damage(damage*delta)

