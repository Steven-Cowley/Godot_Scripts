extends Area2D

@onready var player_entered = false
@onready var text_index = 1
@onready var ninepatchrectREF = $"../green_mage_NPR"
@onready var labelREF = $"../green_mage_NPR/green_mage_label"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_entered and Input.is_action_just_pressed("interact"):
		handleVisible()
	elif !player_entered:
		ninepatchrectREF.visible = false


func _on_body_entered(body):
	if body.name == "player":
		player_entered = true


func _on_body_exited(body):
	if body.name == "player":
		player_entered = false
		
func handleVisible():
	if player_entered:
		ninepatchrectREF.visible = true
		display_text()
	elif !player_entered:
		ninepatchrectREF.visible = false

func display_text():
		match text_index:
			1:
				labelREF.text = "ah, so you're the fire mage i have been hearing about"
				text_index = 2
			2:
				labelREF.text = "I am the captain of the earth mages: rexceil"
				text_index = 3
			3:
				labelREF.text = "we were sent to provide aid to the water mages"
				text_index = 4
			4:
				labelREF.text = "however whenever we try to commune with them"
				text_index = 5
			5:
				labelREF.text = "theres no answer"
				text_index = 6
			6:
				labelREF.text = "we're not a combat team"
				text_index = 7
			7:
				labelREF.text = "so unfortunatly we cannot provide aid in that regard"
				text_index = 8
			8:
				labelREF.text = "if you ever need healing please feel free to commune"
				text_index = 9
			9:
				labelREF.text = "but be warned fire mage"
				text_index = 10
			10:
				labelREF.text = "reports from scouts say there's more to this then just"
				text_index = 11
			11:
				labelREF.text = "goblins and trolls, there's something more... sinister"
