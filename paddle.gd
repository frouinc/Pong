extends Area2D

const MOVE_SPEED = 500
const MOVE_SLOW = 350
var speed_left = MOVE_SPEED
var speed_right = MOVE_SPEED

func _process(delta):
	var which = get_name()
	if (Input.is_action_pressed(which + "_slow")):
		set("speed_" + which, MOVE_SLOW)
	if (Input.is_action_just_released(which + "_slow")):
		set("speed_" + which, MOVE_SPEED)
	if (Input.is_action_pressed(which + "_move_up") and position.y > 0):
		position.y -= get("speed_" + which) * delta
	if (Input.is_action_pressed(which + "_move_down") and position.y < get_viewport_rect().size.y):
		position.y += get("speed_" + which) * delta
	if (Input.is_action_pressed(which + "_move_left") and
	((which == "left" and position.x > 0) or (which == "right" and position.x > get_viewport_rect().size.x / 2))):
		position.x -= get("speed_" + which) * delta
	if (Input.is_action_pressed(which + "_move_right") and
	((which == "left" and position.x < get_viewport_rect().size.x / 2) or (which == "right" and position.x < get_viewport_rect().size.x))):
		position.x += get("speed_" + which) * delta

func _on_area_entered( area ):
	if (area.get_name() == "ball"):
		get_node("../plop").play()
		area.direction = Vector2(-area.direction.x, randf() * 2 - 1).normalized()
		area.update()
