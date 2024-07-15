extends CharacterBody2D

class_name Player
	
const SPEED = 100.0
const JUMP_VELOCITY = -1
var pos : Vector2
@onready var animation = $AnimatedSprite2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	add_to_group("player")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	# get axis returns 1 or -1 
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		velocity.x = direction * SPEED
		if direction == 1:
			animation.play("walking")
			animation.flip_h = false
		elif direction == -1:
			animation.play("walking")
			animation.flip_h = true	
	else:
		velocity.x = 0 #move_toward(velocity.x, 0, SPEED)
		animation.stop()
		#animation.play("idle")

	move_and_slide()


func _on_area_2d_body_entered(body):
	print("collided")
	
	

	
