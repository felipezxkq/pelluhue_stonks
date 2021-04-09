extends KinematicBody2D

export (int) var velocidad_min
export (int) var velocidad_max
var tipo_cliente = ["1", "2"]
var player
var rng = RandomNumberGenerator.new()

export var speed = 40
var direccion : Vector2
var ultima_direccion = Vector2(0, 1)
var tiempo_recalculando_ruta = 0
var en_fogata

var tilemap2


func _ready():
	player = get_tree().root.get_child(0).get_child(3)
	$ClienteTimer.start()
	rng.randomize()
	tilemap2 = get_tree().root.get_children()[0].get_node("TileMap2")
	en_fogata = false
	
	
func _on_Visibilidad_screen_exited():
	#print("NO TOI EN la pantalla")
	pass
	#queue_free() #eliminar personaje


func _on_ClienteTimer_timeout():
	var posicion_relativa_jugador = player.position - position
	#print(posicion_relativa_jugador)
	#print(position)
	
	if tiempo_recalculando_ruta == 0 and !en_fogata:
		var numero_random = rng.randf()
		speed = 45
		if numero_random < 0.1:  # un 10% de quedarse quieto
			direccion = Vector2.ZERO
		elif numero_random < 0.2:  # un 10% de moverse en cualquier dirección
			direccion = Vector2.DOWN.rotated(rng.randf() * 2 * PI)
			
	if tiempo_recalculando_ruta > 0:
		tiempo_recalculando_ruta = tiempo_recalculando_ruta - 1
		

func _physics_process(delta):
	var movimiento = direccion * speed * delta
	var collision = move_and_collide(movimiento)
	
	# Si choca con el juegador, aquí hay que poner la animación de cliente sacando parte
	# , resta puntaje y el cliente desaparece (?)
	if collision != null and collision.collider.name != "Player":
		direccion = direccion.rotated(rng.randf_range(PI/4, PI/2))
		tiempo_recalculando_ruta = rng.randi_range(2, 5)
