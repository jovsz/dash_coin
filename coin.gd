extends Area2D

var screensize = Vector2.ZERO

func pickup():
	queue_free()

func _ready():
	$AnimatedSprite2D.animation = "shine"
	#$Player.hide()
