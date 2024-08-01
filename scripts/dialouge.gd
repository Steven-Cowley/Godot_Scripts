extends Node

class_name dialouge

@onready var sun_knight_text = [
	"Hey there friend",
	"I am a sun knight, a fighter for the sun",
	"isn't it just beautiful?"
]










# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func giveArray():
	return sun_knight_text[0]
