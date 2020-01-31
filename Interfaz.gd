extends CanvasLayer

signal iniciar_juego

func mostrar_mensaje(texto):
	$Mensaje.text = texto
	$Mensaje.show()
	$MensajeTimer.start()
	
func game_over():
	mostrar_mensaje("Game Over")
	yield($MensajeTimer, "timeout") #yield hace que el codigo de abajo no ocurra hasta que se emita la señal timeout
	$BotonJugar.show()
	$Mensaje.text = "Pelluhue Stonks"
	$Mensaje.show()

func update_stonks(Dinero):
	$StonksLabel.text = str(Dinero)

func _on_MensajeTimer_timeout():
	$Mensaje.hide()


func _on_BotonJugar_pressed():
	$BotonJugar.hide()
	emit_signal("iniciar_juego")
