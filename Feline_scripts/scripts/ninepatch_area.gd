extends Area2D

@export var ninepatch_ID: int
@onready var ninepatch_reference = $ninepatch
@onready var label = $ninepatch/Label
var text = [
	"test0",
	"test1",
	"test2"
]
var text_index = 0
var player_entered = false

# Called when the node enters the scene tree for the first time.
func _ready():
	ninepatch_reference.visible = false
	self.connect("body_entered", Callable(self, "_on_body_entered"))
	self.connect("body_exited", Callable(self, "_on_body_exited"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	checkID()
	show_next_text()


func _on_body_entered(body):
	if body.name == "Player":
		player_entered = true


func _on_body_exited(body):
	if body.name == "Player":
		player_entered = false

func checkID():
	if player_entered and Input.is_action_just_pressed("ui_accept"):
		match ninepatch_ID:
			0:
				ninepatch_reference.visible = true
			1:
				ninepatch_reference.visible = true
			_:
				ninepatch_reference.visible = false
	elif !player_entered:
		ninepatch_reference.visible = false
		
func show_next_text():
	if player_entered:
		match ninepatch_ID:
			0:
				if Input.is_action_just_pressed("ui_accept"):
					text_index += 1
					match text_index:
						1: 
							label.text = text[0]
						2:
							label.text = "finished"
						3:
							label.text = "finished again"
							
