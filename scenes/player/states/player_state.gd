class_name PlayerState extends State

const IDLE = "Idle"
const RUNNING = "Running"
const JUMPING = "Jumping"
const FALLING = "Falling"
const BASE_ATK1 = "BaseAttack1"
const BASE_ATK2 = "BaseAttack2"
const BASE_ATK3 = "BaseAttack3"

var double_jump_velocity := -100
var playback : AnimationNodeStateMachinePlayback

var jump_animation := "jump"
var fall_animation := "fall"
var run_animation := "run"
var idle_animation := "idle"
var double_jump_animation := "double_jump"
var ground_animation := "Move"

var base_atk1_animation := "base_atk1"
var base_atk2_animation := "base_atk2"
var base_atk3_animation := "base_atk3"

var fist_atk1_animation := "fist_atk1"
var fist_atk2_animation := "fist_atk2"
var fist_atk3_animation := "fist_atk3"


var player: Player

func _ready() -> void:
	await owner.ready
	player = owner as Player
	playback = player.animation_tree["parameters/playback"]
	assert(player != null, "The PlayerState state type must be used only in the player scene. It needs the owner to be a Player node.")

func double_jump():
	if player.can_double_jump:
		playback.travel(double_jump_animation)
		player.velocity.y = double_jump_velocity;
		player.can_double_jump = false
