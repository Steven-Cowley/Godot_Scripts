extends Area2D
#ADD TO GITHUB

@onready var player_entered = false
@onready var anim = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	play_animation()


func _on_body_entered(body):
	if body.name == "Player":
		player_entered = true


func _on_body_exited(body):
	if body.name == "Player":
		player_entered = false
		
func play_animation():
	if player_entered == true and Input.is_action_just_pressed("ui_accept"):
		anim.play("dead")
