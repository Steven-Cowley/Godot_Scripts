extends AnimatedSprite2D

@onready var player_detected: bool = false
@onready var player_hit: bool = false
@onready var goblin_hit: bool = false
@onready var player_REF = preload("res://scenes/player.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_to_player()


func _on_detected_body_entered(body):
	player_detected = true


func _on_hitbox_body_entered(body):
	goblin_hit = true


func _on_detected_body_exited(body):
	player_detected = false


func _on_hitbox_body_exited(body):
	goblin_hit = false
	
func move_to_player():
	if player_detected == true:
		print_debug(move_toward(player_REF.position, 1, 1))
