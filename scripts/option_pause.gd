extends Control


func _on_video_settings_pressed():
	get_tree().change_scene_to_file("res://scenes/video_pause.tscn")


func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/Menu_pause.tscn")


func _physics_process(_delta):
	if (Input.is_action_just_pressed("esc")):
		get_tree().change_scene_to_file("res://scenes/Menu_pause.tscn")

