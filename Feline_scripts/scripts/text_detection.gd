extends Area2D

@export var textAreaID: int
@onready var characterInRange: bool


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text_manaager()


func _on_body_entered(body):
	if body.is_in_group("player"):
		characterInRange = true


func _on_body_exited(body):
	characterInRange = false
	
func text_manaager():
	match textAreaID:
		1:
			if characterInRange == true and Input.is_action_just_pressed("ui_accept"):
				get_tree().change_scene_to_file("res://scenes/talk_to_cat.tscn")
		2:
			if characterInRange == true and Input.is_action_just_pressed("ui_accept"):
				get_tree().change_scene_to_file("res://scenes/listening_to_tv.tscn")
				
				
	
