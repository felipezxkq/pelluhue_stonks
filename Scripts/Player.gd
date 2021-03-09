extends Area2D
export (int) var Velocidad
var Movimiento = Vector2()
var Limite
signal golpe

func _ready():
	hide()
	Limite = get_viewport_rect().size

func _process(delta):
	Movimiento = Vector2() #Reiniciar el valor
	if Input.is_action_pressed("ui_right"):
		$Sprite.flip_h = true
		$AnimationPlayer.play("Camina_derecha")
		Movimiento.x += 1
	if Input.is_action_pressed("ui_left"):
		$Sprite.flip_h = false
		$AnimationPlayer.play("Camina_izquierda")
		Movimiento.x -= 1
	if Input.is_action_pressed("ui_down"):
		$AnimationPlayer.play("Camina_abajo")
		Movimiento.y += 1
	if Input.is_action_pressed("ui_up"):
		$AnimationPlayer.play("Camina_arriba")
		Movimiento.y -= 1
		
	if Input.is_action_just_released("ui_right"):
		$Sprite.flip_h = true
		$AnimationPlayer.play("Quieto_derecha")
	if Input.is_action_just_released("ui_left"):
		$Sprite.flip_h = false
		$AnimationPlayer.play("Quieto_izquierda")
	if Input.is_action_just_released("ui_down"):
		$AnimationPlayer.play("Quieto_abajo")
	if Input.is_action_just_released("ui_up"):
		$AnimationPlayer.play("Quieto_arriba")

	if Movimiento.length() > 0: #Verificar si hay movimiento
		Movimiento = Movimiento.normalized() * Velocidad #Normalizar velocidad
		
	position += Movimiento * delta #Actualizar posiciones x,y de Player
	position.x = clamp(position.x, 0, Limite.x)
	position.y = clamp(position.y, 0, Limite.y)
	
	
#	if Movimiento.x != 0:
#		$Sprite_player.animation = "lado"
#		$Sprite_player.flip.h = Movimiento.x < 0
#		$Sprite_player.flip.v = false
#	elif Movimiento.y != 0:
#		$Sprite_player.animation = "espalda"
#		$Sprite_player.flip_v = Movimiento.y > 0
#	else:
#		$Sprite_player.animation = "frente"

func _on_Player_body_entered(body):
	emit_signal("golpea")
	$CollisionShape2D.disabled = true
	
func inicio(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false;

