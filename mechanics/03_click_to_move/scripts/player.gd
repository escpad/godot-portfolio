extends CharacterBody2D

@export var speed : float = 50.0

# ① One–shot click flash  (Particles2D set to one_shot = true)
@export var click_flash_scene   : PackedScene = preload("res://mechanics/03_click_to_move/assets/explosion.tscn")

# ② Persistent marker (e.g. a looping Particles2D or Sprite2D)
@export var target_marker_scene : PackedScene = preload("res://mechanics/03_click_to_move/assets/fire.tscn")

@onready var agent : NavigationAgent2D = $NavigationAgent2D
@onready var anim  : AnimatedSprite2D  = $AnimatedSprite2D

var marker : Node = null

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:

		#navigate
		agent.target_position = event.position
		anim.play("walk")
		_update_facing(event.position.x)

		#spawn click flash
		if click_flash_scene:
			var flash := click_flash_scene.instantiate()
			flash.global_position = event.position
			get_tree().current_scene.add_child(flash)

		#spawn/move the persistent marker
		if target_marker_scene:
			if marker == null:
				marker = target_marker_scene.instantiate()
				get_tree().current_scene.add_child(marker)
			marker.global_position = event.position

func _physics_process(_delta: float) -> void:
	
	#play idle when navigation ends
	if agent.is_navigation_finished():
		velocity = Vector2.ZERO
		if anim.animation != "idle":
			anim.play("idle")
		#remove marker when goal is reached
		if marker:
			marker.queue_free()
			marker = null
		return
	
	#
	var next := agent.get_next_path_position()
	var dir  := (next - global_position).normalized()
	velocity = dir * speed
	move_and_slide()
	agent.set_velocity(velocity)
	_update_facing(next.x)

#updates facing direction
func _update_facing(target_x: float) -> void:
	if target_x < global_position.x - 1.0:
		anim.flip_h = true
	elif target_x > global_position.x + 1.0:
		anim.flip_h = false
