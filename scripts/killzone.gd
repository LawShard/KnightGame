extends Area2D

@onready var audio_stream_player_2d = $AudioStreamPlayer2D

@onready var timer = $Timer

func _on_body_entered(body): #Señal detecta colision con Killzone
	print("You Died!")
	audio_stream_player_2d.play()
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	timer.start() #Inicia un contador


func _on_timer_timeout(): #Contador se acaba
	Engine.time_scale = 1
	get_tree().reload_current_scene() #Se reincia la escena
