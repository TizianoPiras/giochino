extends Area2D


func _on_body_entered(body):
	if body.name == "Ball":
		Global.ball_boost = true
		Global.balls_counter += 1
		queue_free()


func _on_timer_timeout():
	if Global.ball_boost == true:
		Global.ball_boost = false

