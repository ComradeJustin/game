extends Entitydata
var dash_count:Array
var input_dir:float
@onready var attack_hitbox = $"Attack hitbox"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.movement_spd = 8
	self.dash_vel = 4
	self.friction = 0
	dash_count = [0,2]
	attack_dmg = 2
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	rotate_attack()
	if Input.is_action_just_pressed("Attack"):
		var enemy = $"Attack hitbox".get_collider()
		if enemy is Entitydata:
			attack(enemy)
			print(enemy)
		else:
			print("no target")
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
	if !is_on_floor():
		velocity += get_gravity() * delta
	self.velocity.x = input_dir * movement_spd / delta
	position_round()
	dash_input_check(delta)
	acceleration_system()
	move_and_slide()




func dash_input_check(delta:float):
	if is_on_floor():
			dash_count[0] = dash_count[1]
	if Input.is_action_just_pressed("Dash") && dash_count[0] > 0 && !is_on_floor():
			dash(delta,input_dir)
			dash_count[0] -= 1;



	
	
