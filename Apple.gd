extends Area2D

var screensize = Vector2()

func _ready():
	add_to_group("apples")
	
func pickup():
	queue_free()
