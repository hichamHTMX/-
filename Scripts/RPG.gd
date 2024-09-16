extends Node2D


@onready var warp_translation: AnimatedSprite2D = $warp_translation















func _ready() -> void:
	warp_translation.frame = 16
	warp_translation.speed_scale = -1
	warp_translation.show()
	
	pass










func _process(delta: float) -> void:
	for child in get_children():
		if child is Node2D and !AnimatedSprite2D:
			child.z_index = child.position.y
