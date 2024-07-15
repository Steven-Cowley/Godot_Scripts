extends Node2D

@onready var tv_label = $Label
var text_index = 0
var tv_text = ["News Anchor: in todays news we find that the parasite known as toxoplasmosis, a parasiste
				found orgionally found in cat fecies has evolved to become air bourn and can now be found
				infecting people.",
				"it is not known as to how rapid or how many have been affected by toxoplasmosis"]

# Called when the node enters the scene tree for the first time.
func _ready():
	tv_label.text = tv_text[0]


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
			tv_label.text = tv_text[1]
			
func return_To_Room():
	return get_tree().change_scene_to_file("res://scenes/player_room.tscn")
