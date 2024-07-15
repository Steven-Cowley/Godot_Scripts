extends Area2D

@export var doorID: String
@onready var player_in_detection = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_in_detection and Input.is_action_just_pressed("ui_accept"):
		door_manager(doorID)
	
func door_manager(scene: String):
	match scene:
		"hallway_3rd_from_player_room":
			get_tree().change_scene_to_file("res://scenes/hallway_3a.tscn")
		"player_room_from_hallway":
			# REMEMBER TO CHANGE PLAYER POSITION AT THE DOOR
			get_tree().change_scene_to_file("res://scenes/player_room.tscn")
	
func _on_body_entered(body):
	player_in_detection = true
	
func _on_body_exited(body):
	player_in_detection = false
