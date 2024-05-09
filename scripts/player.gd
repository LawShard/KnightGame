extends CharacterBody2D
@onready var player_animated_sprite_2d = $Marker2D/PlayerAnimatedSprite2D
@onready var sword = $Marker2D/PlayerAnimatedSprite2D/Sword
@onready var sword_timer = $Marker2D/PlayerAnimatedSprite2D/Sword/SwordTimer
@onready var coyote_timer = $CoyoteTimer
@onready var sword_animated_sprite_2d = $Marker2D/PlayerAnimatedSprite2D/Sword/SwordAnimatedSprite2D
@onready var marker_2d = $Marker2D
@onready var colisionEnemigo = $Killzone/CollisionShape2D
@onready var jump_audio = $Sonidos/JumpAudio


var shine = 10
var coyote_time = 0.3
var can_jump = false

const SPEED = 130.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	sword_timer.start()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	if is_on_floor() and can_jump == false:
		can_jump = true
	elif can_jump == true and $CoyoteTimer.is_stopped():
		$CoyoteTimer.start(coyote_time)
		
	# Handle jump.
	if can_jump:
		if Input.is_action_just_pressed("Jump"):
			velocity.y = JUMP_VELOCITY
			jump_audio.play()


	# Pilla la direccion, -1, 0, 1
	var direction = Input.get_axis("MoveLeft", "MoveRight")
	
	#Cambiar Sprite
	if direction > 0:
		marker_2d.scale.x = 1
	elif direction < 0:
		marker_2d.scale.x =- 1

	#Animaciones
	if is_on_floor():
		if direction == 0:
			player_animated_sprite_2d.play("idle")
		else :
			player_animated_sprite_2d.play("run")
	else:
		player_animated_sprite_2d.play("jump")


	#Aplicar Movimiento
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_coyote_timer_timeout():
	can_jump = false
	pass # Replace with function body.


func _on_sword_timer_timeout():
	sword_animated_sprite_2d.play("Shinning")


func _on_sword_animated_sprite_2d_animation_finished():
	sword_animated_sprite_2d.play("Idle")
	sword_timer.start(shine)




