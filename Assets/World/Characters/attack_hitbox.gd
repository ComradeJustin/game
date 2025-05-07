extends RayCast2D


func check_enemy(damage) -> void:
	if is_colliding() and self.get_collider().is_in_group("Hurtbox"):
		self.get_collider().damage(damage)
