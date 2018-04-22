extends Area2D

func _on_area_entered( area ):
	if (area.get_name() == "ball"):
		get_node("../beep").play()
		if (get_name() == "goal_left"):
			global.score_left += 1
			get_node("../score_right").set_text(str(global.score_left))
		elif (get_name() == "goal_right"):
			global.score_right += 1
			get_node("../score_left").set_text(str(global.score_right))
		area.reset()
