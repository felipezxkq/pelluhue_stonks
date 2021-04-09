extends Node2D
var tilemap
var tilemap2

export var spawn_area : Rect2 = Rect2(0, 200, 100, 100)
export var max_clientes = 10
export var clientes_al_inicio = 5
var contador_clientes = 0
var cliente_scene = preload("res://Escenas/Cliente.tscn")
var rng = RandomNumberGenerator.new()


func _ready():
	tilemap = get_tree().root.get_children()[0].get_node("TileMap")
	tilemap = get_tree().root.get_children()[0].get_node("TileMap2")
	
	rng.randomize()
	for i in range(clientes_al_inicio):
		instanciar_cliente()
	contador_clientes = clientes_al_inicio
	
	
func instanciar_cliente():
	var cliente = cliente_scene.instance()
	add_child(cliente)
	
	var posicion_valida = false
	while not posicion_valida:
		cliente.position.x = spawn_area.position.x + rng.randf_range(0, spawn_area.size.x)
		cliente.position.y = spawn_area.position.y + rng.randf_range(0, spawn_area.size.y)
		posicion_valida = testea_posicion(cliente.position)
		

func testea_posicion(posicion : Vector2):
	return true
