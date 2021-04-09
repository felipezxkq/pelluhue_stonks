extends Node2D
var tilemap
var tilemap2

export var spawn_area : Rect2 = Rect2(250, 250, 100, 100)
export var max_pacos = 10
export var pacos_al_inicio = 2
var contador_pacos = 0
var paco_scene = preload("res://Escenas/Paco.tscn")
var rng = RandomNumberGenerator.new()


func _ready():
	tilemap = get_tree().root.get_children()[0].get_node("TileMap")
	print(tilemap)
	
	rng.randomize()
	for i in range(pacos_al_inicio):
		instanciar_paco()
	contador_pacos = pacos_al_inicio
	
	
func instanciar_paco():
	var paco = paco_scene.instance()
	add_child(paco)
	
	var posicion_valida = false
	while not posicion_valida:
		paco.position.x = spawn_area.position.x + rng.randf_range(0, spawn_area.size.x)
		paco.position.y = spawn_area.position.y + rng.randf_range(0, spawn_area.size.y)
		posicion_valida = testea_posicion(paco.position)
		

func testea_posicion(posicion : Vector2):
	return true


