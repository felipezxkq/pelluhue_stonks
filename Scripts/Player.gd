extends KinematicBody2D
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
		
		
	var colision = move_and_collide(Movimiento * delta)
	if colision != null and "Paco" in colision.collider.name:
		emit_signal("golpe")

	position.x = clamp(position.x, 0, Limite.x)
	position.y = clamp(position.y, 0, Limite.y)
	

func _on_Player_body_entered(body):
	print("golpe")
	emit_signal("golpe")
	$CollisionShape2D.disabled = false
	
func inicio(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false;

