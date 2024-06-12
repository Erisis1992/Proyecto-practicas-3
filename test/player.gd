extends CharacterBody3D



const JUMP_VELOCITY = 20
const accel = 10.0
const max_speed= 30.0
const deccel= 20
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravedad = 50 
@export var current_speed=0.0
signal count
signal max
signal decount

func _physics_process(delta):
	current_speed = velocity.length()
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravedad * delta

	# Handle jump.
	if Input.is_action_just_pressed("salto") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("izq", "der", "arr", "aba")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	print(get_floor_normal())
	if direction:
		print(current_speed)
		if current_speed<max_speed:
			velocity.x += direction.x * accel * delta
			velocity.z += direction.z * accel * delta
		elif current_speed==max_speed:
			velocity.x= direction.x * max_speed
			velocity.z= direction.z * max_speed
			
	else:
		velocity.x = move_toward(velocity.x, 0, deccel*delta*1.5)
		velocity.z = move_toward(velocity.z, 0, deccel*delta*1.5)
	if Input.is_anything_pressed() == false:
		decount.emit()

	move_and_slide()
