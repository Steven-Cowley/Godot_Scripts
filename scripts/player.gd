extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -270.0
@onready var anim = $AnimatedSprite2D
@onready var fbAnim = $fireball
@onready var castTimer = $Timer

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
const fireballPath = preload("res://scenes/fireball.tscn")
var path_to_master = preload("res://scenes/master.tscn")
var isCasting = false

func _ready():
	castTimer.wait_time = 3
	castTimer.one_shot = true
	castTimer.connect("timeout", Callable(self, "_on_timer_timeout()"))

func _process(delta):
	if Input.is_action_just_pressed("cast_fireball") and not isCasting:
		isCasting = true
		cast()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		anim.play("walking")
		if direction == -1:
			anim.flip_h = true
		elif direction == 1:
			anim.flip_h = false
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		anim.play("idle")

	move_and_slide()
	
func cast():
	var casted = fireballPath.instantiate()
	get_parent().add_child(casted)
	casted.position = $Marker2D.global_position
	castTimer.start()

func _on_timer_timeout():
	isCasting = false
