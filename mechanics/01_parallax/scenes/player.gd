extends CharacterBody2D

func _physics_process(delta: float) -> void:
	var dir := Input.get_axis("ui_left", "ui_right")   # -1, 0, or +1
	velocity.x = dir * 150      
	
	move_and_slide()                # e.g. 150
