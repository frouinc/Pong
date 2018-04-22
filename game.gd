extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_process(true)

func _process(delta):
	get_node("fps_count").set_text(str(Engine.get_frames_per_second()))
	if (Input.is_action_pressed("ui_cancel")):
		get_tree().quit()