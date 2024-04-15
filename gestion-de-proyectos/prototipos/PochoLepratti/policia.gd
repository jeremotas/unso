extends CharacterBody2D
var bStartedShooting = false
var bullet = preload("res://bullet.tscn")
signal balaDisparada

func _on_shoot_timer_timeout():
	if !bStartedShooting: 
		bStartedShooting = true
	else: 
		var b = bullet.instantiate()
		add_child(b)
		b.start($InitOfGun.position, $EndOfGun.position)
		$AudioDisparo.play()
		balaDisparada.emit()
		
	$ShootTimer.wait_time = randf_range(0.4, 3)
	$ShootTimer.start()	
