extends Area2D
class_name HurtBox

func _ready():
	area_entered.connect(on_area_entered)
	
func on_area_entered(hitBox : Area2D):
	if not(hitBox is HitBox):
		return
	
	if owner.has_method("take_damage"):
		owner.take_damage(hitBox.damage)	

func _physics_process(delta):
	var hitboxes = get_overlapping_areas().filter(func(area): return area is HitBox)
	for hit_box in hitboxes:
		owner.take_damage(hit_box.damage * delta)
