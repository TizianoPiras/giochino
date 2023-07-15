extends Control


func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/game_level.tscn")


func _on_settings_pressed():
	get_tree().change_scene_to_file("res://scenes/option_menu.tscn")


func _on_exit_pressed():
	get_tree().quit()


func _physics_process(_delta):
	if (Input.is_action_just_pressed("esc")):
		get_tree().quit()

