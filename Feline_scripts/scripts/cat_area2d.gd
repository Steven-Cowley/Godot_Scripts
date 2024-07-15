extends Area2D

@onready var player_detected = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	player_detected = true	
	

func _on_body_exited(body):
	player_detected = false
