extends Node2D


@export var previous_window = DisplayServer.window_get_mode()
@export var current_window = DisplayServer.window_get_mode()
@export var previous_vsync = DisplayServer.window_get_vsync_mode()
@export var current_vsync = DisplayServer.window_get_vsync_mode()
@export var fullscreen_flag = false
@export var vsync_flag = false
@export var ball_boost = false
@export var balls_counter = 0


func fullscreen_pressed():
		current_window = DisplayServer.window_get_mode()
		if current_window != 4:
			previous_window = current_window
			fullscreen_flag = true
			DisplayServer.window_set_mode(4)
		else:
			if previous_window == 4:
				previous_window = 2
			fullscreen_flag = false
			DisplayServer.window_set_mode(previous_window)


func vsync_pressed():
		current_vsync = DisplayServer.window_get_vsync_mode()
		if current_vsync != 1:
			previous_vsync = current_vsync
			vsync_flag = true
			DisplayServer.window_get_vsync_mode(1)
		else:
			if previous_vsync == 1:
				previous_vsync = 0
			vsync_flag = false
			DisplayServer.window_get_vsync_mode(previous_vsync)

