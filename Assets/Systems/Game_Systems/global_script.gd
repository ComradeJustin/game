extends Node2D

var pausestate:bool
func _ready():
	pausestate = true
	for children in get_children():
		children.process_mode = Node.PROCESS_MODE_PAUSABLE
	self.process_mode = Node.PROCESS_MODE_ALWAYS
	

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Pause"):
		if pausestate == true:
			pausestate = false
			$Ui/Pause.show()
			get_tree().paused = true
			print("pause")
		elif pausestate == false:
			$Ui/Pause.hide()
			get_tree().paused = false
			pausestate = true
			print("unpause")
