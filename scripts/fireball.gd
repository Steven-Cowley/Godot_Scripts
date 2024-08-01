extends CharacterBody2D

@onready var velocityFireball = Vector2(1, 0)
var speed = 100

func _ready():
	pass
	
func _physics_process(delta):
	var collisionInfo = move_and_collide(velocityFireball.normalized() * delta * speed)
