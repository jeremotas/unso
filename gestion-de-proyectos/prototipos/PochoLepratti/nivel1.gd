extends Node2D

var iPibesSalvados = 0
var iBalasDisparadas = 0 
var music_time_begin
var music_time_delay

var aBajenLasArmas = [77, 156, 235, 314]

# Called when the node enters the scene tree for the first time.
func _ready():
	$pibes.escapar($marker_inicio.position, $marker_llegada.position)
	music_time_begin = Time.get_ticks_usec()
	music_time_delay = AudioServer.get_time_to_next_mix() + AudioServer.get_output_latency()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("reload_scene"):
		get_tree().reload_current_scene()
	
	var time = (Time.get_ticks_usec() - music_time_begin) / 1000000.0
	time -= music_time_delay
	
	time = max(0, time)
	#print(aBajenLasArmas, int(floor(time)))
	if int(floor(time)) in aBajenLasArmas:
		$PochoLepratti.bajenLasArmas()
		#print("Bajen las armas")
	#$HUD/Policia.text = str(int(floor(time))) + " secs"
	#$HUD/Policia.show()
	# print(floor(time))


func _on_pibes_salvados():
	iPibesSalvados += 3
	$HUD/PibesSalvados.text = str(iPibesSalvados) + " pibes del comedor salvados"
	$HUD/PibesSalvados.show()

func balaDisparada():
	iBalasDisparadas +=1
	$HUD/BalasDisparadas.text = str(iBalasDisparadas) + " balas disparadas"
	$HUD/BalasDisparadas.show()

func _on_policia_bala_disparada():
	balaDisparada()

func _on_policia_2_bala_disparada():
	balaDisparada()

func _on_policia_3_bala_disparada():
	balaDisparada()

func _on_policia_4_bala_disparada():
	balaDisparada()
