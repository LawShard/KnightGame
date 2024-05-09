extends Area2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var shinning_timer = $ShinningTimer

var shinning_time = 10



func _on_shinning_timer_timeout(shinning_time	):
	animated_sprite_2d.play("Shinning")
	shinning_timer.start()
	
	
