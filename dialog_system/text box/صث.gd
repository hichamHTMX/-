extends Sprite2D



@onready var man = $"../TextboxContainer/MarginContainer"

func _process(delta):
	check_texture()

func check_texture():
	if texture:
		man.z()
		# قم بأي عملية إذا كانت الصورة موجودة
	else:
		man.u()
		# قم بأي عملية إذا لم تكن الصورة موجودة
