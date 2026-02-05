extends CharacterBody2D


const SPEED = 140.0
const JUMP_VELOCITY = -300.0

@onready var animated_sprite_2d = $AnimatedSprite2D

func death():
	animated_sprite_2d.play("hit")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	# get direction -1, 0 or 1 0 bring no movement
	
	var direction = Input.get_axis("moveleft", "moveright")
	
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0: 
		animated_sprite_2d.flip_h = true
		
	#Play animations
	
	
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
