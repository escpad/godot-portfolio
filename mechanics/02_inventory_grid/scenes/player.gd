extends CharacterBody2D

@export var inv: Inventory
func _physics_process(_delta: float) -> void:
	var dir := Input.get_axis("ui_left", "ui_right")
	velocity.x = dir * 150      
	
	move_and_slide()
