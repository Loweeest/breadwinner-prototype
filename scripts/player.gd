extends CharacterBody2D

@onready var animation = $AnimationPlayer
@onready var sprite = $Sprite2D

@export var SPEED = 100.0
@export var JUMP_VELOCITY = -300.0


func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("left"):
		sprite.scale.x = abs(sprite.scale.x) * -1
	if Input.is_action_pressed("right"):
		sprite.scale.x = abs(sprite.scale.x)
		
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		animation.play("jump")
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	update_animation()
	move_and_slide()
	
func update_animation():
	if velocity.x != 0:
		animation.play("Run")
	else:
		animation.play("Idle")
	
	if velocity.y < 0 :
		animation.play("Jump")
	if velocity.y > 0 :
		animation.play("Fall")
	
