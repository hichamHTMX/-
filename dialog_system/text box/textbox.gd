extends CanvasLayer

const CHAR_READ_RATE = 0.5

@onready var Textbox_Container = $TextboxContainer
@onready var start_symbol = $TextboxContainer/MarginContainer/HBoxContainer/start
@onready var end_symbol = $TextboxContainer/MarginContainer/HBoxContainer/end
@onready var Labl = $TextboxContainer/MarginContainer/HBoxContainer/Label
@onready var texture = $Sprite2D # يجب أن تكون هناك عقدة Sprite2D في المشهد

enum State {
	READY,
	READING,
	FINISHED
}


var current_state = State.READY
var text_queue = []
@export var text1 = "null"
@export var text2 = "null"
@export var text3 = "null"
@export var text4 = "null"
@export var text5 = "null"
@export var text6 = "null"
@export var text7 = "null"
@export var text8 = "null"
@export var png1 = Texture2D
@export var png2 = Texture2D
@export var png3 = Texture2D
@export var png4 = Texture2D
@export var png5 = Texture2D
@export var png6 = Texture2D
@export var png7 = Texture2D
@export var png8 = Texture2D
@export var snd2 = "res://down/snd_txtral_ch1.wav"
@export var snd3 = "res://down/snd_txtund_ch1.wav"
@export var snd1 = "res://down/snd_txtund_ch1.wav"
@export var snd4 = "res://down/snd_txtnoe_ch1.wav"
@export var snd5 = "res://down/snd_txtral_ch1.wav"
@export var snd6 = "res://down/snd_txtral_ch1.wav"
@export var snd7 = "res://down/snd_txtral_ch1.wav"
@export var snd8 = "res://down/snd_txtral_ch1.wav"





func _ready() -> void:
	$TextboxContainer.show()
	hide_textbox()
	texture.visible = false # إخفاء الصورة عند بدء تشغيل البرنامج




@onready var anim = $AnimationPlayer

func _process(delta):
	match current_state:
		State.READY:
			if !text_queue.is_empty():
				display_text()
				Global.play = false
				
		State.READING:
			if Input.is_action_just_pressed("ui_accept"):
				Labl.visible_ratio = 1.0
				$AnimationPlayer.play("RESET")
				$AnimationPlayer.stop()
				end_symbol.text = "=>"
				change_state(State.FINISHED)
		State.FINISHED:
			if Input.is_action_just_pressed("ui_accept") :
				change_state(State.READY)
				if text_queue.is_empty():
					hide_textbox()
				texture.visible = false # إخفاء الصورة عند انتهاء النص
				Global.play = true






func queue_text(next_text, next_texture):
	text_queue.push_back([next_text, next_texture])

func hide_textbox():
	start_symbol.text = ""
	end_symbol.text = ""
	Labl.text = ""
	Textbox_Container.hide()
	texture.visible = false # إخفاء الصورة عند إخفاء النص

func show_textbox():
	start_symbol.text = "* "
	Textbox_Container.show()
	texture.visible = true # إظهار الصورة عند إظهار النص
var we2 = 1
func display_text():
	var next = text_queue.pop_front()
	var next_text = next[0]
	var next_texture = next[1]
	Labl.text = next_text
	texture.texture = next_texture
	Labl.visible_ratio = 0.0
	change_state(State.READING)
	show_textbox()
	var tw = get_tree().create_tween()
	tw.tween_property(Labl, "percent_visible", 1.0, len(next_text) * CHAR_READ_RATE * $TextboxContainer/MarginContainer/HBoxContainer/Label.visible_characters)
	tw.TRANS_LINEAR
	
	we2 = len(next_text) * CHAR_READ_RATE
	print(we2)
	$AnimationPlayer.play("tween")
	var max_iterations: int = len(next_text) * CHAR_READ_RATE  # عدد المرات التي سيعمل فيها الكود








func _on_animation_player_animation_finished(anim_name):
	end_symbol.text = " "
	change_state(State.FINISHED)
	pass # Replace with function body.





func change_state(next_state):
	current_state = next_state
	match current_state:
		State.READY:
			print("Changing state to: State.READY")
		State.READING:
			print("Changing state to: State.READING")
		State.FINISHED:
			print("Changing state to: State.FINISHED")


@onready var so = $AudioStreamPlayer

var nut = 1
var f = true
var g = true
var h = true
var fg = true




func te():
	hide_textbox()

	if text1 != "null":
		
		queue_text(text1, png1)
	if text2 != "null":
		queue_text(text2, png2)
	if text3 != "null":
		queue_text(text3, png3)
	if text4 != "null":
		queue_text(text4, png4)
	if text5 != "null":
		queue_text(text5, png5)
	if text6 != "null":
		queue_text(text6, png6)
	if text7 != "null":
		queue_text(text7, png7)
	if text8 != "null":
		queue_text(text8, png8)
	
