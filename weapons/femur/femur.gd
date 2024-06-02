extends Weapon

var damage = 2

func shoot():
	$AnimationPlayer.play("slash")
	$Sound.play(0.6)


