extends RigidBody2D

var tipo
var tipo_bebida = ["Heineken", "Corona", "Cristal"]
export (int) var precio_compra
export (int) var precio_venta

func _ready():
	tipo = tipo_bebida[randi() % tipo_bebida.size()]
	$AnimatedSprite.animation = tipo_bebida[randi() % tipo_bebida.size()]
	
	if tipo == tipo_bebida[0]:
		precio_compra = 3
		precio_venta = 7
	if tipo == tipo_bebida[1]:
		precio_compra = 1
		precio_venta = 2
	if tipo == tipo_bebida[2]:
		precio_compra = 2
		precio_venta = 4
		
	
func inicio(x, y):
	position.x = x
	position.y = y
	show()
	$CollisionShape2D.disabled = false;
