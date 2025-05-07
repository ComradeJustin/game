extends Area2D

func damage(damage_amount: float) -> void:
	"attack recievedd"
	get_parent().damage()
