extends RigidBody2D

export (int) var velocidad_min
export (int) var velocidad_max
var tipo_paco = ["viejo", "nuevo"]

func _ready():
#	$AnimatedSprite.animation = tipo_paco[randi() % tipo_paco.size()]
	pass
	
func _on_Visibilidad_screen_exited():
	queue_free() #eliminar personaje


