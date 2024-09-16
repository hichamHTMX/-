extends CharacterBody2D

# متغير السرعة
var speed : float = 300.0

#المتغير اللي بخلي السرعة سموز بالتدريج
var accel = 10

#نود البارتكلز
@onready var particles = $Particles

func _physics_process(delta: float) -> void:
	#اتجاه الحركة
	var diraction: Vector2 = Input.get_vector("left","right","up","down")
	if diraction:
		velocity = lerp(velocity, diraction * speed, 0.05)
		particles.emitting = true
	else :
		velocity = lerp(velocity, Vector2.ZERO, 0.1)
		particles.emitting = false
		
	
	
	
	move_and_slide()
	pass
