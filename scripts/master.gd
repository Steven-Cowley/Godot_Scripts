extends Area2D

signal cast_fireball
@onready var anim = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	emit_signal("cast_fireball", self, "_on_cast_fireball") 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_cast_fireball():
	anim.play("casting")
