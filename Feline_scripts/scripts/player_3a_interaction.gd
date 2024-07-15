extends Node2D

@onready var label = $NinePatchRect/Label
var text = [
	#0
	"There seems to have been some sort of disturbance",
	#1
	"the tv is smashed and the chair is flipped over",
	#2
	"you notice a message on the wall...",
	#3
	"it's written in blood, you barly make out the words",
	#4
	"it says \"I love my cat\"",
	#5
	"Quinn: What the hell is going on in this place?"
]
var text_index = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = text[0]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		text_index += 1
		show_next_text()
	
func show_next_text():
	match text_index:
		1:
			label.text = text[1]
		2:
			label.text = text[2]
		3:
			label.text = text[3]
		4:
			label.text = text[4]
		5:
			label.text = text[5]
