extends Area2D


@onready var path_to_goblin = $"../goblin"
@onready var path_to_fireball = preload("res://scenes/fireball.tscn")
@onready var anim = $AnimatedSprite2D
var damage_index: = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	var fireballRef = path_to_fireball.instantiate()
	#get_parent().add_child(fireballRef)
	if body.name == "fireball_body":
		match damage_index:
			1:
				anim.play("hit1")
				damage_index = 2
			2:
				anim.play("hit2")
				damage_index = 3
			3:
				anim.play("hit3")
				damage_index = 4	
			4:
				anim.play("killed")
				path_to_goblin.play("death")
