extends MarginContainer








func _process(delta: float) -> void:
	#z()
	pass

func z():
	add_theme_constant_override("margin_left", 250)

func u():
	add_theme_constant_override("margin_left", 80)
	pass
