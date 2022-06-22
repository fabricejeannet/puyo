extends TileMap

var Couple = preload("res://scenes/Couple.tscn")
var couple

func _ready():
	couple = Couple.instance()
	couple.position = Vector2 (map_to_world(Vector2(2.0, 1.0)))
	add_child(couple)
	
func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		couple = Couple.instance()
		var column = world_to_map(get_global_mouse_position()).x
		couple.position = Vector2 (column * 64 + 32, 0)
		add_child(couple)


#func _physics_process(delta):
#	couple.puyo1.laid_down = !can_keep_on_falling()
#	couple.puyo2.laid_down = !can_keep_on_falling()

	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_left"):
		if can_go_left():
			couple.position.x -= 64
		
	if event.is_action_pressed("ui_right"):
		if can_go_right():
			couple.position.x += 64

	if event.is_action_pressed("rotate_right"):
		couple.rotate_right()
		
	if event.is_action_pressed("rotate_left"):
		couple.rotate_left()


func can_go_left() -> bool:
	return  world_to_map(couple.get_top_left_corner()).x > 0


func can_go_right() -> bool:
	return  world_to_map(couple.get_bottom_right_corner()).x < 6

