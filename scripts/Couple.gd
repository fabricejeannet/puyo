extends Node2D

# Puyo2 position relative to Puyo1
enum Arrangement {
	NORTH, 
	EAST, 
	SOUTH, 
	WEST
}

var current_arrangement = Arrangement.NORTH

var _couple_rect:Rect2

onready var puyo1 = $Puyo1
onready var puyo2 = $Puyo2

export var puyo_dimension = 32


func _ready():
	arrange()


func rotate_right() -> void :
	current_arrangement += 1
	if current_arrangement > 3 :
		current_arrangement = 0
	arrange()


func rotate_left() -> void :
	current_arrangement -= 1
	if current_arrangement < 0:
		current_arrangement = 3
	arrange()


func arrange() -> void :
	match current_arrangement:
		Arrangement.NORTH:
			puyo2.position.x = puyo1.position.x
			puyo2.position.y = puyo1.position.y - puyo_dimension
			_couple_rect = Rect2 (puyo2.position - Vector2(puyo_dimension / 2.0, puyo_dimension / 2.0), Vector2(puyo_dimension, puyo_dimension * 2))
			
		Arrangement.EAST:
			puyo2.position.x = puyo1.position.x + puyo_dimension
			puyo2.position.y = puyo1.position.y 
			_couple_rect = Rect2 (puyo1.position - Vector2(puyo_dimension / 2.0, puyo_dimension / 2.0), Vector2(puyo_dimension * 2, puyo_dimension))
		
			
		Arrangement.SOUTH:
			puyo2.position.x = puyo1.position.x
			puyo2.position.y = puyo1.position.y + puyo_dimension
			_couple_rect = Rect2 (puyo1.position - Vector2(puyo_dimension / 2.0, puyo_dimension / 2.0), Vector2(puyo_dimension, puyo_dimension * 2))
			
		Arrangement.WEST:
			puyo2.position.x = puyo1.position.x - puyo_dimension
			puyo2.position.y = puyo1.position.y 
			_couple_rect = Rect2 (puyo2.position - Vector2(puyo_dimension / 2.0, puyo_dimension / 2.0), Vector2(puyo_dimension * 2, puyo_dimension))


func get_top_left_corner() -> Vector2 :
	return to_global(_couple_rect.position)


func get_bottom_right_corner() -> Vector2 :
	return to_global(_couple_rect.position + _couple_rect.size)


func _draw():
	draw_rect(_couple_rect, Color.pink, false)
