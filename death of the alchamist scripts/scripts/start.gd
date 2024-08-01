extends Node2D

@onready var audioPlayer = $AudioStreamPlayer2D
@onready var can_cast_FB = false
@onready var isInFirstArea: bool
@onready var firstArea = preload("res://scenes/start.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_audio_stream_player_2d_finished():
	var audioStream = preload("res://DTA-art/music/a wonderful day.wav")
	audioPlayer.stream = audioStream
	audioPlayer.play()

func allowCast():
	if !firstArea:
		can_cast_FB = true
		
func castFB():
	while can_cast_FB:
		if Input.is_action_just_pressed("cast_fireball"):
			pass
