extends CharacterBody2D

const SPEED = 400
var rs_look = Vector2(0,0)
var deadzone = 0.3
var input = Vector2.ZERO
var friction = 500
var acceleration = 500 

func player_rotation():
	rs_look.y = -1 * Input.get_joy_axis(0, JOY_AXIS_RIGHT_X)
	rs_look.x = Input.get_joy_axis(0, JOY_AXIS_RIGHT_Y)
	if rs_look.length() >= deadzone:
		rotation = rs_look.angle()

func get_input():
	input.x = Input.get_joy_axis(0, JOY_AXIS_LEFT_X)
	input.y = Input.get_joy_axis(0, JOY_AXIS_LEFT_Y)
	if input.length() <= deadzone:
		input = Vector2.ZERO
	return input
	
func bajenLasArmas():
	if $GritoWrapper/grito.text == "":
		$GritoWrapper/grito.text = "¡BAJEN LAS ARMAS!"
		$GritoWrapper/grito.show()
		await get_tree().create_timer(5).timeout
		$GritoWrapper/grito.text = "¡QUE AQUI SOLO HAY\n PIBES COMIENDO!"
		$GritoWrapper/grito.show()
		await get_tree().create_timer(5).timeout
		$GritoWrapper/grito.text = ""
		$GritoWrapper/grito.show()
	

func player_movement(delta): 
	input = get_input()
	velocity = input * SPEED
	# Movimiento uniforme
	velocity += (input * acceleration * delta)
	
	# Movimiento con aceleracion
	#if input == Vector2.ZERO:
	#	if velocity.length() > (friction * delta):
	#		velocity -= velocity.normalized() * (friction * delta)
	#	else:
	#		velocity = Vector2.ZERO
	#else:
	#	velocity += (input * acceleration * delta)
	#	velocity = velocity.limit_length(SPEED)

func _physics_process(delta):
	player_movement(delta)
	player_rotation()
	move_and_slide()
