extends Area2D

@export var speed = 350
@export var velocity = Vector2.ZERO
@export var screensize = Vector2(480, 720)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = Input.get_vector("left", "right", "up", "down")
	position += velocity * speed * delta
	position.x = clamp(position.x, 0 , screensize.x)
	position.y = clamp(position.y, 0 , screensize.y)
	
	#if velocity.x > 0 : 
		
	
	print(velocity)
