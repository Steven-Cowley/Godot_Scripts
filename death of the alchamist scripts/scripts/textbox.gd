extends Camera2D

class_name text_box

@onready var make_ninepatch_visible: bool = false
@onready var ninepatch = $NinePatchRect
@onready var label = $NinePatchRect/Label
@export var cameraID: String = ""
var text_index = 0
var player_entered = false



@onready var sun_knight_text = [
	"",
	"Hey there friend",
	"I am a sun knight, a fighter for the sun",
	"isn't it just beautiful?"
]

# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = sun_knight_text[0]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_entered:
		if Input.is_action_just_pressed("interact"):
			ninepatch.visible = true
			text_index += 1
			show_next_text()
			
func show_next_text():
	match text_index:
		1:
			label.text = sun_knight_text[1]
		2:
			label.text = sun_knight_text[2]
		3:
			label.text = sun_knight_text[3]
		4:
			ninepatch.visible = false


func _on_sk_text_trigger_body_entered(body):
	if body.name == "player":
		player_entered = true


func _on_sk_text_trigger_body_exited(body):
	if body.name == "player":
		player_entered == false
		ninepatch.visible = false
