extends Area2D

@export var zo7lo9a: AnimationPlayer
@export var zo7lo9a2: AnimationPlayer
@export var zo7lo9a3: AnimationPlayer

@export var gro = "pp"
var on = true











func _on_body_entered(body: Node2D):
	if body.is_in_group(gro):
		# تأكد من أن الدالة te موجودة في الأب
		var parent = get_parent()
		if parent.has_method("te"):
			parent.te()
		
		queue_free()

func _process(delta):
	pass
