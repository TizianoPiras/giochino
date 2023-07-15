extends Control


@export var previous_window = DisplayServer.window_get_mode()
@export var current_window = DisplayServer.window_get_mode()
@export var preview_vsync = DisplayServer.window_get_vsync_mode()
@export var current_vsync = DisplayServer.window_get_vsync_mode()


func _on_fullscreen_pressed():
	Global.fullscreen_pressed()


func _on_vsync_pressed():
	Global.vsync_pressed()


func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/option_pause.tscn")


func _physics_process(_delta):
	$VBoxContainer3/HBoxContainer/VBoxContainer2/fullscreen.set_pressed_no_signal(Global.fullscreen_flag)
	$VBoxContainer3/HBoxContainer/VBoxContainer2/vsync.set_pressed_no_signal(Global.vsync_flag)
	if (Input.is_action_just_pressed("esc")):
		get_tree().change_scene_to_file("res://scenes/option_pause.tscn")

