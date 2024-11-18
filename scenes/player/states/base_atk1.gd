extends PlayerState

@export var atk_timer : Timer
@export var item : Item
var COMBO_NUM = 1
var next_state := BASE_ATK2
var atk_animation : String = "fist"
const MAX_SECS := 0.45
const MOVE_SPEED := 10.0

var current_secs := 0

func enter(previous_state_path: String, data := {}) -> void:
	player.state = player.States.ATTACKING
	player.state_label.text = str(atk_animation)
	
	atk_animation = Item.wp_types.find_key(player.current_weapon.type) + "_atk" + str(COMBO_NUM)
	playback.travel(atk_animation)
	
	player.weapon_sprite.texture = player.current_weapon.texture
	player.weapon_animation_player.play(player.current_weapon.animation + "1")
	
	if not player.camera:
		assert("ERROR: You must give CAMERA to PLAYER.");
	player.camera.apply_shake(1.5)
	
	
	
func handle_input(_event: InputEvent) -> void:
	if _event.is_action_pressed("attack") and atk_timer.is_stopped():
		atk_timer.start()
	
	if _event.is_action_pressed("attack2") :
		playback.travel(ground_animation)
		finished.emit(IDLE)

func physics_update(delta: float) -> void:
	step_abit(MOVE_SPEED, delta)
	
	current_secs += 1.0/60.0
	if current_secs >= MAX_SECS:
		playback.travel(ground_animation)
		finished.emit(IDLE)

		

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:	
	if anim_name == atk_animation:
		if atk_timer.is_stopped():
			playback.travel(ground_animation)
			finished.emit(IDLE)
		else:
			finished.emit(next_state)

func exit() -> void:
	current_secs = 0.0
