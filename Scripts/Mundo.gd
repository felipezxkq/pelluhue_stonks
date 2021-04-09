extends Node
export (PackedScene) var Paco
export (PackedScene) var Bebida
export (int) var Stonks

func _ready():
	randomize()


func nuevo_juego():
	Stonks = 7;
	$Player.inicio($PosicionDeInicio.position)
	$InicioTimer.start()
	iniciar_bebidas()
	$Interfaz.mostrar_mensaje("Listo!")
	$Interfaz.update_stonks(Stonks)
	
	

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
	pass
	
	
func game_over():
	$ScoreTimer.stop()
	$PacoTimer.stop()
	$Interfaz.game_over()
	

func _on_InicioTimer_timeout():
	$PacoTimer.start()
	$ScoreTimer.start()


func _on_PacoTimer_timeout():
	#var P = Paco.instance()
	#add_child(P)
	pass

	
