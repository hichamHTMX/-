@tool
extends Node2D





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Engine.is_editor_hint():
		print("hello")
		pass
	else:
		print("stop")
		pass
	pass # Replace with function body.
