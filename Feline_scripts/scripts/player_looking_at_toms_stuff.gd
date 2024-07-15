extends Node2D

@onready var label = $Label
var text = [
	"A photo of Toms family can be found above the tv",
	"Quinn: Tom told me about his family, how bad things got after the divorce",
	"Quinn: I never tried to ask about it, I hope hes ok"
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
