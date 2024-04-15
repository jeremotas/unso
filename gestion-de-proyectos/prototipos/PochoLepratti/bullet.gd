extends Area2D

@export var speed = 400 #1200
var direction = Vector2.ZERO
var rng = RandomNumberGenerator.new()


func start(GunStart, GunEnd):
	position = GunEnd
	GunEnd.x += rng.randf_range(-4, 4)
	direction = GunStart.direction_to(GunEnd)
	
func _process(delta):
	position += direction * speed * delta

func _ready():
	pass

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_area_entered(area):
	pass


func _on_body_entered(body):
	if body.name == "PochoLepratti":
		queue_free()
	if body.name == "pibes":
		body.volver()
		queue_free()
	pass # Replace with function body.
