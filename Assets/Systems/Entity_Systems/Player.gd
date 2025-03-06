extends Entitydata
var dash_count:Array
var input_dir:float
var friction:float
var acceleration: float


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.movement_spd = 8
	self.dash_vel = 5
	self.friction = 0
	dash_count = [0,2]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	rotate_attack()
	movement(delta)
	
			
#func Use weapon
	#if Input.is_action_just_pressed("use_weapon"):
	#insert attack stuff

#rotates the attack hitbox based on mouse position
func rotate_attack():
	var mouse_position = get_global_mouse_position()
	var angle = get_angle(self.position,mouse_position)
	$"Attack hitbox".rotation = angle



#Manages all movement related code
func movement(delta:float):
	input_dir = Input.get_axis("move_left", "move_right") 
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -400.0 * 1.5
	self.velocity.x = input_dir * movement_spd / delta
	dash(delta)
	position_round()
	acceleration_system()
	move_and_slide()


#Causes acceleration to function
func acceleration_system():
	if abs(self.acceleration) > 0 && !(abs(self.acceleration) - self.friction < 0): 
		friction = -self.acceleration/pow(abs(self.acceleration),0.4)
		self.acceleration += self.friction
		self.velocity.x += lerp(self.velocity.x,self.acceleration,0.6)
		self.acceleration = roundf(self.acceleration * 100)/100
		print(self.acceleration)
	else:
		self.acceleration = 0






#Allows for dashing to be called
func dash(delta:float):
	if !is_on_floor():
		velocity += get_gravity() * delta
	elif is_on_floor():
			dash_count[0] = dash_count[1]
	if Input.is_action_just_pressed("Dash") && dash_count[0] > 0 && !is_on_floor():
		self.acceleration = (input_dir * dash_vel / delta * self.movement_spd);
		print(self.acceleration)
		dash_count[0] -= 1;
	
	
