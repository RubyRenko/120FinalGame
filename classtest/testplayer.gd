extends CharacterBody3D


const JUMP_VELOCITY = 7.5
var gravity = 9.8
var speed = 7.5


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY
	else:
		velocity.y -= gravity * delta
	position.y += velocity.y * delta
	
	# Handle rotation if using WASD or arrow keys.
	if Input.is_action_pressed("up") and Input.is_action_pressed("right"):
		rotation -= Vector3(rotation.x, 0.025, rotation.z)
	elif Input.is_action_pressed("up") and Input.is_action_pressed("left"):
		rotation += Vector3(rotation.x, 0.025, rotation.z)

	# Handle rotation if using Q or E.
	if Input.is_action_pressed("turn_right"):
		rotation -= Vector3(rotation.x, 0.025, rotation.z)
	elif Input.is_action_pressed("turn_left"):
		rotation += Vector3(rotation.x, 0.025, rotation.z)
	
	# Handle sprint.
	if Input.is_action_pressed("run"):
		speed = 15.0
		if is_on_floor():
			$CPUParticles3D.visible = true
		else:
			$CPUParticles3D.visible = false
	if Input.is_action_just_released("run"):
		speed = 7.5
		$CPUParticles3D.visible = false
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
		$movementsound.play()
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)

	move_and_slide()
