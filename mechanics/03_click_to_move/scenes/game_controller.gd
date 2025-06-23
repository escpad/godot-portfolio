extends Node
@onready var player := $"../Player"

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		print("CLICKED")
		player.set_move_target(event.position)
