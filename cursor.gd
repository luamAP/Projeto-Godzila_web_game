extends Node2D

# Tamanho do nosso tile em pixels (50x50)
const TILE_SIZE = 50 

# Velocidade do movimento (para ele se mover de um tile para outro)
const SPEED = 250 

# Posição de destino (para onde o cursor deve ir)
var target_position = Vector2.ZERO

func _ready():
	# Inicializa a posição alvo na posição atual.
	target_position = global_position
	
func _unhandled_input(event):
	var moved = false # Variável para verificar se movemos
	
	if event.is_action_pressed("ui_right"):
		# Se a tecla direita foi pressionada, move 50px para a direita
		target_position.x += TILE_SIZE
	elif event.is_action_pressed("ui_left"):
		target_position.x -= TILE_SIZE
	elif event.is_action_pressed("ui_up"):
		target_position.y -= TILE_SIZE
	elif event.is_action_pressed("ui_down"):
		target_position.y += TILE_SIZE

	# Se movemos o cursor, marcamos o evento como tratado.
	if moved:
		get_viewport().set_input_as_handled() 
		# Alternativamente, apenas use: get_tree().set_input_as_handled()

func _process(delta):
	# Move o cursor suavemente em direção à posição alvo (target_position)
	global_position = global_position.move_toward(target_position, SPEED * delta)
	
	
