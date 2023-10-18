extends Area2D

signal pickup
signal hurt

@export var speed = 350
@export var velocity = Vector2.ZERO
@export var screensize = Vector2(480, 720)

#var animated_sprite = 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = Input.get_vector("left", "right", "up", "down")
	position += velocity * speed * delta
	position.x = clamp(position.x, 0 , screensize.x)
	position.y = clamp(position.y, 0 , screensize.y)
	
	if velocity.length() > 0 : 
		$AnimatedSprite2D.animation = "run"
	else:
		$AnimatedSprite2D.animation = "idle"

	if velocity.x != 0:
		$AnimatedSprite2D.flip_h = velocity.x < 0		
	
	print(velocity)

func start ():
	set_process(true)
	position = screensize / 2
	$AnimatedSprite2D.animation = "idle"
	
func die ():
	$AnimatedSprite2D.animation = "hurt"
	set_process(false)

func _on_area_entered(area):
	if area.is_in_group("coins"):
		area.pickup()
	if area.is_in_group("obstacles"):
		hurt.emit()
		die()
