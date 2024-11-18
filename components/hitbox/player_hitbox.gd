extends HitboxComponent


func _ready():
	if flippable_sprite != null:
		for child in get_children():
			flippable_sprite.is_flipped.connect(child._on_sprite_flipped)
			child.disabled = true

	

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		var player : Player = get_parent()
		var enemy : Enemy = body as Enemy
		var atk : Attack = Attack.new()
		atk.atk_damage = player.current_weapon.damage;
		atk.knockback_force = player.current_weapon.knock_back_force;
		atk.source_entity = player
		atk.target_entity = enemy
		enemy.state_label.text = "h: " + str(enemy.health)
			
		body.take_damage(atk);
		pass # Replace with function body.
