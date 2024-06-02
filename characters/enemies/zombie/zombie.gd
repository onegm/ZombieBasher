extends Enemy

func _physics_process(delta):
	super(delta)
	look_at(player.global_position)
	rotate(-PI/2)

	
