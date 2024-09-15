extends CharacterBody2D

# متغير السرعة
var speed = 300

#المتغير اللي بخلي السرعة سموز بالتدريج
var accel = 10

#نود البارتكلز
@onready var particles = $Particles

func _physics_process(delta):
	#اتجاه الحركة
	var diraction: Vector2 = Input.get_vector("left","right","up","down")
	
	#التحرك
	velocity.x = move_toward(velocity.x, speed * diraction.x, accel)
	velocity.y = move_toward(velocity.y, speed * diraction.y, accel)
	
	#تشغيل البارتكلز
	if diraction :
		particles.emitting = true
	else :
		particles.emitting = false
	
	move_and_slide()
	pass
