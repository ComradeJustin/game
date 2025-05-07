extends CharacterBody2D
class_name Entitydata
var attack_dmg: float
@export var hp: float
var movement_spd: float
var attack_dir: Vector2
var is_hiding: bool
var current_dimension: bool
var jump_strength: float
var dash_vel: float
var friction:float
var acceleration: float


func get_current_dimension() -> String:
	if self.current_dimension == true:
		return "%s is in Light dimenssion" % self.name
	if self.current_dimension == false:
		return "%s is in Dark dimension" % self.name
	else:
		return "error {self.name} is not assigned a dimension"

func get_jump_strength() -> float:
	return self.jump_strength
func check_hiding_status() -> bool:
	return is_hiding
func get_attack_dir() -> Vector2:
	return self.attack_dir
func get_health() -> float:
	return self.hp
func get_movement_spd() -> float:
	return self.movement_spd
func get_attack_dmg() -> float:
	return self.attack_dmg
func getpos() -> Vector2:
	return self.position
func get_world_gravity() -> float:
	return self.gravity


func position_round():
	self.position = (self.position*100).round()/100

#Gets an angle of an object from two points in space
func get_angle(current:Vector2,target:Vector2):
	var y = current.y - target.y
	var x = current.x - target.x
	return atan2(-y,-x)

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

func check_death():
	if self.hp <= 0:
		self.queue_free()
		
func damage(damage: float):
	self.hp -= damage
	check_death()

#Allows for dashing to be called
func dash(delta:float, input_dir:float):
	self.acceleration = (input_dir * dash_vel/ delta * self.movement_spd);
