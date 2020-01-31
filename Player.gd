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
		Movimiento.x += 1
	if Input.is_action_pressed("ui_left"):
		Movimiento.x -= 1
	if Input.is_action_pressed("ui_down"):
		Movimiento.y += 1
	if Input.is_action_pressed("ui_up"):
		Movimiento.y -= 1

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
	#hide()
	emit_signal("golpe")
	$CollisionShape2D.disabled = true
	
func inicio(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false;

