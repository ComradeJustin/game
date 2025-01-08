extends Entitydata


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.current_dimension = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(get_current_dimension())
