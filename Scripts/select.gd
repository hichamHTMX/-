extends Sprite2D

@onready var markers = [
	$"../Items/Marker2D0",
	$"../Items/Marker2D1",
	$"../Items/Marker2D2",
	$"../Items/Marker2D3",
	$"../Items/Marker2D4"
]

var num = 0
var down_count = 0
var up_count = 0
const MAX_MOVES = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = Input.get_axis("ui_up", "ui_down")
	
	if direction != 0:
		if direction < 0 and down_count < MAX_MOVES:
			down_count += 1
			up_count -= 1
			up_count = max(up_count, 0)
			num = clamp(num + 1, 0, markers.size() - 1)
		elif direction > 0 and up_count < MAX_MOVES:
			up_count += 1
			down_count -= 1
			down_count = max(down_count, 0)
			num = clamp(num - 1, 0, markers.size() - 1)
		
		# التأكد من أن العقدة ليست null قبل الوصول إلى global_position
		if markers[num] != null:
			position.y = markers[num].global_position.y
