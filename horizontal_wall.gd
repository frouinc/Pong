extends Area2D

func _on_area_entered( area ):
	if (area.get_name() == "ball"):
		area.direction = Vector2(area.direction.x, -area.direction.y)
