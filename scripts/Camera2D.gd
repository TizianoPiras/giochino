extends Camera2D


var cam_x = 1.0
var cam_y = 1.0
var scene_zoom = Vector2(cam_x, cam_y)
var zoom_max = Vector2(3.0, 3.0)
var zoom_min = Vector2(0.8, 0.8)


func _process(_delta):
	if Input.is_action_pressed("zoom_in"):
		if scene_zoom < zoom_max:
			cam_x += 0.01
			cam_y += 0.01
			scene_zoom = Vector2(cam_x, cam_y)
		elif scene_zoom >= zoom_max:
			scene_zoom = zoom_max
	if Input.is_action_pressed("zoom_out"):
		if scene_zoom > zoom_min:
			cam_x -= 0.01
			cam_y -= 0.01
			scene_zoom = Vector2(cam_x, cam_y)
		elif scene_zoom <= zoom_min:
			scene_zoom = zoom_min
	if Input.is_action_just_pressed("zoom_reset"):
		if scene_zoom != Vector2(1.0, 1.0):
			scene_zoom = Vector2(1.0, 1.0)
	zoom = scene_zoom

