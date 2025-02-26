extends Entitydata
var DashMax = 2
var DashAmount = DashMax
var direction = null


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.movement_spd = 300.0
	self.dash_vel = 100
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
		if not is_on_floor():
			velocity += get_gravity() * delta
			
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = -400.0 * 1.5
			
		var input_dir := Input.get_axis("move_left", "move_right") 
		
		if input_dir:
			self.velocity.x = input_dir * movement_spd * delta * dash_vel
		else:
			velocity.x = move_toward(velocity.x, 0, movement_spd)
			
		if input_dir < 0:
			direction = false
		elif input_dir > 0:
			direction = true
			
		if Input.is_action_just_pressed("use_weapon"):
			if direction == false:
				print("left")
			else:
				print("right")
		
		if Input.is_action_just_pressed("Dash") and !is_on_floor():
			if DashAmount > 0:
				self.velocity.x = input_dir * movement_spd / delta
				DashAmount -= 1;
				
		if is_on_floor():
			DashAmount = DashMax

		move_and_slide()


# sorry justin, but I have no idea why we would need this to be a function
#func input_reader():
#	var input_dir = Input.get_vector("move_left", "move_right","jump","move_down") 
	

	

	
