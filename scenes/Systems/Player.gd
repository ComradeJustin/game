extends Entitydata


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.movement_spd = 1.0

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
		input_reader()
		



func input_reader():
	var input_dir = Input.get_vector("move_left", "move_right","jump","move_down") 
	var current_vel = input_dir * self.movement_spd
	

	
