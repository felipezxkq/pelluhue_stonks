extends KinematicBody2D

export (int) var velocidad_min
export (int) var velocidad_max
var tipo_paco = ["viejo", "nuevo"]
var player
var rng = RandomNumberGenerator.new()

export var speed = 100
var direccion : Vector2
var ultima_direccion = Vector2(0, 1)
var tiempo_recalculando_ruta = 0


func _ready():
	player = get_tree().root.get_child(0).get_child(3)
	$PacoTimer.start()
	print("fui creado")
	rng.randomize()
	
	
func _on_Visibilidad_screen_exited():
	queue_free() #eliminar personaje


func _on_PacoTimer_timeout():
	var posicion_relativa_jugador = player.position - position
	print(posicion_relativa_jugador)
	
	if posicion_relativa_jugador.length() <= 16:
		direccion = Vector2.ZERO
		ultima_direccion = posicion_relativa_jugador.normalized()
	elif posicion_relativa_jugador.length() <= 100 and tiempo_recalculando_ruta == 0:
		direccion = posicion_relativa_jugador.normalized()
	elif tiempo_recalculando_ruta == 0:
		var numero_random = rng.randf()
		if numero_random < 0.05:
			direccion = Vector2.ZERO
		elif numero_random < 0.1:
			direccion = Vector2.DOWN.rotated(rng.randf() * 2 * PI)
			
	if tiempo_recalculando_ruta > 0:
		tiempo_recalculando_ruta = tiempo_recalculando_ruta - 1
		

func _physics_process(delta):
	var movimiento = direccion * speed * delta
	var collision = move_and_collide(movimiento)
	
	if collision != null and collision.collider.name != "Player":
		direccion = direccion.rotated(rng.randf_range(PI/4, PI/2))
		tiempo_recalculando_ruta = rng.randi_range(2, 5)
