extends CharacterBody2D

func _physics_process(delta: float) -> void:
	var dir := Input.get_axis("ui_left", "ui_right")
	velocity.x = dir * 150      
	
	move_and_slide()
