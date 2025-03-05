extends Entitydata
var DashMax = 2
var DashAmount = DashMax
var input_dir:float


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.movement_spd = 8
	self.dash_vel = 30
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	input_dir = Input.get_axis("move_left", "move_right") 
	move_and_slide()
	self.velocity.x = input_dir * movement_spd / delta
	rotate_attack()
	movement(delta)
	
			
		
	

		
	

		#Use weapon
	#if Input.is_action_just_pressed("use_weapon"):
		#inser attack stuff


	
	
func rotate_attack():
	var mouse_position = get_global_mouse_position()
	var angle = get_angle(self.position,mouse_position)
	$"Attack hitbox".rotation = angle


func movement(delta:float):
	position_round()
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -400.0 * 1.5
	if !is_on_floor():
		velocity += get_gravity() * delta
	elif is_on_floor():
			DashAmount = DashMax
	if Input.is_action_just_pressed("Dash") and !is_on_floor():
		if DashAmount > 0:
			self.velocity.x = (input_dir * dash_vel / delta * self.movement_spd);
			DashAmount -= 1;