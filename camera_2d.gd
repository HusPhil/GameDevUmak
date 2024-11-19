extends Camera2D

@export var shakeFade: float = 5.0

var rng = RandomNumberGenerator.new()
var shake_strength: float = 0.0
	
func apply_shake(_shake_strength : float) -> void:
	shake_strength = _shake_strength

func randomOffset() -> Vector2:
	return Vector2(\
		rng.randf_range(-shake_strength, shake_strength), \
		rng.randf_range(-shake_strength, shake_strength)\
		)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if shake_strength > 0:
		shake_strength = lerpf(shake_strength, 0, shakeFade * delta)
		offset = randomOffset()
	pass