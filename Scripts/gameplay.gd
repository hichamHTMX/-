extends CharacterBody2D




class_name PlayerRPG




var rotat_spd : float = 4.0
@onready var animations: AnimationPlayer = $PlayerAnim
var speed : float = 200
var anim : float = 0






var play = true

func _physics_process(delta):
	updateAnimation()
	movement()
	animations.stop()
	BoxMove()

var direction = "Down"

func updateAnimation():
	# الحصول على الاتجاه المدخل من اللاعب
	var we = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	
	
	if we.x < 0:
		direction = "Left"
	elif we.x > 0:
		direction = "Right"
	elif we.y < 0:
		direction = "Up"
	elif we.y > 0:
		direction = "Down"
	
	# إذا كان هناك حركة فعلية
	if velocity.length() > 0:
		animations.play(direction)
	else:
		# إذا لم يكن هناك حركة فعلية، ولكن يوجد إدخال
		if we != Vector2.ZERO:
			animations.play(direction)
		else:
			animations.stop()
	if velocity.length() == 0:
		animations.stop()
	

func movement():
	var diraction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	if diraction:
		velocity = diraction * speed
	else:
		velocity.x = 0
		velocity.y = 0
	move_and_slide()


func BoxMove():
	var diraction = Input.get_axis("ui_left", "ui_right")
	if diraction:
		$wiz.rotation = lerp($wiz.rotation, $wiz.rotation + rotat_spd * diraction, 0.018)
	pass
