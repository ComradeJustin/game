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
	move_and_slide()


	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -400.0 * 1.5
	input_dir = Input.get_axis("move_left", "move_right") 

			
			
		
	self.velocity.x = input_dir * movement_spd / delta

		
	if !is_on_floor():
		velocity += get_gravity() * delta
	elif is_on_floor():
			DashAmount = DashMax		

		#Use weapon
	if Input.is_action_just_pressed("use_weapon"):
		if self.attack_dir < Vector2(0,0):
			print("left")
		elif self.attack_dir > Vector2(0,0):
			print("right")


	
	if Input.is_action_just_pressed("Dash") and !is_on_floor():
		if DashAmount > 0:
			self.velocity.x = input_dir * dash_vel / delta * self.movement_spd;
			DashAmount -= 1;
				

