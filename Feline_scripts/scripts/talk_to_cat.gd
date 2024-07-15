extends Node2D

@onready var cat_label = $Label
var dialogue = ["Quinn: Hello whiskers, it seems there was some loud banging coming from the neighbours last night, I hope everything is alright, perhaps I will check on them.",
				"\"Whiskers looks at you with the blank stare he always give you\""]
var text_index = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	cat_label.text = dialogue[0]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if text_index == 2:
		if Input.is_action_pressed("ui_accept"):
			return_To_Room()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		text_index += 1
		show_next_text()
		
		
func show_next_text():
	match text_index:
		1:
			cat_label.text = dialogue[1]

func return_To_Room():
	return get_tree().change_scene_to_file("res://scenes/player_room.tscn")
