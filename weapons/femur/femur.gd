extends Weapon

var damage = 200

func shoot():
	$AnimationPlayer.play("slash")
	$Sound.play(0.6)


