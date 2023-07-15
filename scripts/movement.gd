extends CharacterBody2D


@export var move_speed : float = 50
@export var energy_max : float = 100
@export var start_dir : Vector2 = Vector2(0, 1)
@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")
@export var speed_acceleration  = 1.0


func _ready():
	update_animation(start_dir)


func _physics_process(_delta):
	if (Input.is_action_just_pressed("esc")):
		get_tree().change_scene_to_file("res://scenes/Menu_pause.tscn")
	if (Input.is_action_just_pressed("run")):
		speed_acceleration = 4.0
	if (Input.is_action_pressed("run")):
		energy_max -= 0.1
	elif Input.is_action_just_released("run"):
		speed_acceleration = 2.0
	if energy_max <= 0:
		get_tree().change_scene_to_file("res://scenes/end.tscn")
	var input_dir = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	update_animation(input_dir)
	velocity = input_dir * (move_speed * speed_acceleration)
	move_and_slide()
	energy_update()
	pick_new_state()


func update_animation(move_input : Vector2):
	if (move_input != Vector2.ZERO):
		animation_tree.set("parameters/Walk/blend_position", move_input)
		animation_tree.set("parameters/Idle/blend_position", move_input)


func pick_new_state():
	if (velocity != Vector2.ZERO):
		state_machine.travel("Walk")
	else:
		state_machine.travel("Idle")


func _on_collisione_calcio_body_entered(body):
	if body is RigidBody2D:
		var speed = 100
		if Global.ball_boost == true:
			speed = 200
		var motion = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
		)
		var impulse = motion * speed
		body.apply_central_impulse(impulse)


func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		if (Input.is_action_just_pressed("run")):
			speed_acceleration = 0.2
			energy_max -= 20
		else:
			speed_acceleration = 0.1
			energy_max -= 10
	else:
		if (Input.is_action_just_pressed("run")):
			speed_acceleration = 4.0
		if (Input.is_action_pressed("run")):
			energy_max -= 0.1
		elif Input.is_action_just_released("run"):
			speed_acceleration = 1.0


func _on_area_2d_body_exited(body):
	if body is CharacterBody2D:
		speed_acceleration = 1.0


func energy_update():
	var energybar = $Energy
	energybar.value = energy_max
	if energy_max >= 100:
		energybar.visible = false
	else:
		energybar.visible = true


func _on_energy_regen_timeout():
	if energy_max < 100:
		energy_max = energy_max + 5
		if energy_max > 100:
			energy_max = 100
	if energy_max <= 0:
		energy_max = 0


func _on_spaceship_body_entered(_body):
	if Global.balls_counter >= 5:
		get_tree().change_scene_to_file("res://scenes/end2.tscn")

