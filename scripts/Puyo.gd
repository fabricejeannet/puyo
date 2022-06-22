extends KinematicBody2D

var motion = Vector2 (0.0, 1.0)
var laid_down = false
export var vertical_speed = 1.0

func _physics_process(delta):
	if not laid_down:
#		position.y += vertical_speed
		move_and_collide(motion * vertical_speed)
