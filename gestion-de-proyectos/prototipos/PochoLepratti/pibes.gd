extends CharacterBody2D

signal salvados

var SPEED = 50.0
var initial_position = Vector2.ZERO
var direction = Vector2.ZERO
var rng = RandomNumberGenerator.new()

func escapar(Inicial, Salida):
	initial_position = Inicial
	position = initial_position
	direction = position.direction_to(Salida)

func volver():
	position = initial_position
	
func llegar():
	SPEED = 0
	position = initial_position
	SPEED = 50

func _process(delta):
	position += direction * SPEED * delta

func _on_llegada_body_entered(body):
	print("LLEGAMOS!!!")
	salvados.emit()
	llegar()


func _on_walk_speed_timer_timeout():
	SPEED = rng.randf_range(30, 100)
	$WalkSpeedTimer.wait_time = randf_range(0.1, 1.5)
	$WalkSpeedTimer.start()	
