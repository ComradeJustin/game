extends Entitydata

var Player

func _ready() -> void:
	Player = get_tree().get_first_node_in_group("Player")
	movement_spd = 3

func _physics_process(delta: float) -> void:
	_look_at(Player.getpos())
	move(delta)
	move_and_slide()
	check_death()
	
	 
func move(delta: float):
	velocity.x = angle_to_move() * movement_spd / delta
	position_round()
		
func angle_to_move() -> int:
	return(round(self.global_rotation) / 2)

func _look_at(player):
	var angle_to_player = -rad_to_deg(get_angle(self.position ,player))
	if angle_to_player <= 90 and angle_to_player >= -90:
		self.rotation_degrees = 90.00
	else:
		self.rotation_degrees = 270.00
	
