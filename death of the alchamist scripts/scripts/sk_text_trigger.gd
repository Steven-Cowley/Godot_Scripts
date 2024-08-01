extends Area2D

@onready var nprREF = $NinePatchRect
@onready var labelRef = $NinePatchRect/Label

var player_entered = false
var text_index = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	nprREF.visible = false
	labelRef.text = "test1"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_entered and Input.is_action_just_pressed("interact"):
		handleVisible()
	elif !player_entered:
		nprREF.visible = false

func _on_body_entered(body):
	if body.name == "player":
		player_entered = true

func _on_body_exited(body):
	if body.name == "player":
		player_entered = false

func handleVisible():
	if nprREF.visible:
		handleText()
	else:
		nprREF.visible = true

func handleText():
	match text_index:
		1:
			labelRef.text = "test1"
			text_index = 2
		2:
			labelRef.text = "test2"
			text_index = 3
		3:
			labelRef.text = "test3"
			text_index = 1
