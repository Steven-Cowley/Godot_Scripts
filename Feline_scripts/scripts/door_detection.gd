extends Area2D

@export var doorID: String
@onready var player_in_detection = false

var current_scene: String = ""
var previous_scene: String = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_in_detection and Input.is_action_just_pressed("ui_accept"):
		door_manager(doorID)
	
func door_manager(scene: String):
	if scene == current_scene:
		return
	
	previous_scene = current_scene
	current_scene = scene
	
	match scene:
		"hallway_3rd_from_player_room":
			Global.next_player_pos = Vector2(-131, -16)
			Global.should_set_pos = true
			get_tree().change_scene_to_file("res://scenes/hallway_3a.tscn")
		"player_room_from_hallway":
			Global.next_player_pos = Vector2(121, -16)
			Global.should_set_pos = true
			get_tree().change_scene_to_file("res://scenes/player_room.tscn")
		"to_3b":
			Global.next_player_pos = Vector2(121, -16)
			Global.should_set_pos = true
			get_tree().change_scene_to_file("res://scenes/3b.tscn")
		"3b_to_3rd_hallway":
			Global.next_player_pos = Vector2(147, -16)
			Global.should_set_pos = true
			get_tree().change_scene_to_file("res://scenes/hallway_3a.tscn")
		"to_3a":
			Global.next_player_pos = Vector2(121, -16)
			Global.should_set_pos = true
			get_tree().change_scene_to_file("res://scenes/apt_3a.tscn")
		"3a_to_3rd_hallway":
			Global.next_player_pos = Vector2(427.5, -16)
			Global.should_set_pos = true
			get_tree().change_scene_to_file("res://scenes/hallway_3a.tscn")
	
func _on_body_entered(body):
	if body.name == "Player":
		player_in_detection = true
	
func _on_body_exited(body):
	if body.name == "Player":
		player_in_detection = false

