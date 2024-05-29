extends Node2D
class_name EnemyAnimation

func play_walk():
	$AnimationPlayer.play("walk")


func play_hurt():
	$AnimationPlayer.play("hurt")
	$AnimationPlayer.queue("walk")
