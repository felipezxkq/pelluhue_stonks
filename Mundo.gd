extends Node
export (PackedScene) var Paco
export (PackedScene) var Bebida
export (int) var Stonks

func _ready():
	randomize()


func nuevo_juego():
	Stonks = 5;
	$Player.inicio($PosicionDeInicio.position)
	$InicioTimer.start()
	$Interfaz.mostrar_mensaje("Listo!")
	$Interfaz.update_stonks(Stonks)
	iniciar_bebidas()
	

func iniciar_bebidas():
	var Bebida1 = Bebida.instance()
	var Bebida2 = Bebida.instance()
	var Bebida3 = Bebida.instance()
	add_child(Bebida1)
	add_child(Bebida2)
	add_child(Bebida3)
	Bebida1.inicio(100, 230)
	Bebida2.inicio(100, 380)
	Bebida3.inicio(100, 530)
	


func recibe_parte():
	Stonks = Stonks - 1
	$Interfaz.update_stonks(Stonks)	
	# código para restar stonks
	pass
	
	
func game_over():
	$ScoreTimer.stop()
	$PacoTimer.stop()
	$Interfaz.game_over()
	

func _on_InicioTimer_timeout():
	$PacoTimer.start()
	$ScoreTimer.start()


func _on_PacoTimer_timeout():
	$Camino/PacoPosicion.set_offset(randi())
	
	var P = Paco.instance()
	add_child(P)
# warning-ignore:unused_variable
	var d = $Camino/PacoPosicion.rotation  # Selecciona una direccion
	P.position = $Camino/PacoPosicion.position
	P.set_linear_velocity(Vector2(rand_range(P.velocidad_min, P.velocidad_max), 0))
	