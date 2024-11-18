extends HitboxComponent
@export var enemy: Enemy
signal has_taget_hit(target : CharacterBody2D)

func _ready():
	if flippable_sprite != null:
		for child in get_children():
			flippable_sprite.is_flipped.connect(child._on_sprite_flipped)
			child.disabled = true

	

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		var enemy := get_parent() 
		body = body as Player
		
		var atk : Attack = Attack.new()
		atk.atk_damage = 100.0;
		atk.knockback_force = 40.0;
		atk.source_entity = enemy
		atk.target_entity = body as CharacterBody2D
		
		body.take_damage(atk)
			
			
		pass # Replace with function body.
