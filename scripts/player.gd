extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	# Pilla la direccion, -1, 0, 1
	var direction = Input.get_axis("MoveLeft", "MoveRight")
	
	#Cambiar Sprite
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
		
	#Animaciones
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idle")
		else :
			animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("jump")


	#Aplicar Movimiento
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()