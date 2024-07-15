extends Node2D

@onready var toms_label = $Label
var text = [
"A note can be found on a desk, it's from Tom", 
"Tom: To my wife and daughter: i'm sorry for doing the things that I did, I feel as if something is taking over my mind.",
"Tom: I tried to get help but the doctore just perscribe more meds, it's not enough", 
"Tom i'm going to",
 "the note ends there", 
"\"you seem confused\""
]
var text_index = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	toms_label.text = text[0]


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
			toms_label.text = text[1]
		2:
			toms_label.text = text[2]
		3:
			toms_label.text = text[3]
		4:
			toms_label.text = text[4]
		5:
			toms_label.text = text[5]
