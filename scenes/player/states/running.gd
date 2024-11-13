extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	player.sprite_animation_player.play("run")

func physics_update(delta: float) -> void:
	var input_direction_x := Input.get_axis("move_left", "move_right")
	
	if input_direction_x:
		player.sprite_animation_player.flip_h = input_direction_x < 0
	
	player.velocity.x = player.speed * input_direction_x
	player.velocity.y += player.base_gravity * delta
	player.move_and_slide()

	if not player.is_on_floor():
		pass
	elif Input.is_action_just_pressed("jump"):
		finished.emit(JUMPING)
	elif is_equal_approx(input_direction_x, 0.0):
		finished.emit(IDLE)
