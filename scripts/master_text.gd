extends NinePatchRect

@onready var playerEntered = false
@onready var labelRef = $Label
var text = [
	"today i am going to teach you a basic spell",
	"this is fireball"
]
var text_index = 1
@onready var master_area = get_node("res://scenes/master.tscn")
@onready var masterRef = $master/AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	visible = true
	labelRef.text = "ah there you are"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if playerEntered and Input.is_action_just_pressed("interact"):
		handleVisible()
	#elif !playerEntered:
	#	visible = false


func _on_master_body_entered(body):
	if body.name == "player":
		playerEntered = true


func _on_master_body_exited(body):
	if body.name == "player":
		playerEntered = false
		
func handleVisible():
	if visible:
		handleText()
	else:
		visible = false

func handleText():
	match text_index:
		1:
			labelRef.text = text[0]
			text_index = 2
		2:
			labelRef.text = text[1]
			text_index = 3
			_on_master_cast_fireball()
		3:
			labelRef.text = "now you try"
			text_index = 4
		4:
			labelRef.text = "use f to cast fireball"
			text_index = 5
		5:
			if Input.is_action_just_pressed("interact"):
				queue_free()

func _on_master_cast_fireball():
	masterRef.play("casting")
