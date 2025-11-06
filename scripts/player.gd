extends CharacterBody2D

const GRAVITY = 980.0
const JUMP_VELOCITY = -500.0

var is_alive = true

func _ready():
	pass

func _physics_process(delta):
	if not is_alive:
		return

	# Apply gravity
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Handle jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	move_and_slide()

func die():
	is_alive = false
	# Simple death animation - could be enhanced
	velocity = Vector2.ZERO
