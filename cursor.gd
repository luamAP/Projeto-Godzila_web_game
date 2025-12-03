extends Node2D

# Tamanho do nosso tile em pixels (50x50)
const TILE_SIZE = 50 

## Velocidade do movimento (para ele se mover de um tile para outro)
#const SPEED = 250

# Velocidade visual do movimento (pixels por segundo)
const SPEED = 400

# Referência ao nó do mapa (precisamos disso para saber os limites e converter posições)
# O "../TileMapLayer" significa "volte um nível acima e pegue o irmão chamado TileMapLayer"
@onready var tile_map = $"../TileMapLayer"

## Posição de destino (para onde o cursor deve ir)
#var target_position = Vector2.ZERO

# Posição atual do cursor NO GRID (ex: coluna 2, linha 3)
var grid_position: Vector2i = Vector2i.ZERO

# Posição visual alvo em PIXELS (para onde o sprite deve deslizar)
var target_pixel_position: Vector2 = Vector2.ZERO

func _ready():
	# --- INICIALIZAÇÃO ---
	# 1. Pega a posição inicial onde colocamos o cursor na cena
	var start_pixel_pos = global_position
	
	# 2. Converte essa posição de pixel para a coordenada de grid correspondente
	# O TileMap sabe fazer essa matemática pra gente.
	grid_position = tile_map.local_to_map(start_pixel_pos)
	
	# 3. Alinha o alvo visual exatamente no centro desse tile inicial
	target_pixel_position = tile_map.map_to_local(grid_position)
	# Força a posição inicial imediata (sem deslizar no primeiro frame)
	global_position = target_pixel_position
	
func _unhandled_input(event):
	# --- LÓGICA DE MOVIMENTO ---
	
	# Variável temporária para calcular onde QUEREMOS ir
	var new_grid_pos = grid_position

	if event.is_action_pressed("ui_right"):
		new_grid_pos.x += 1
	elif event.is_action_pressed("ui_left"):
		new_grid_pos.x -= 1
	elif event.is_action_pressed("ui_up"):
		new_grid_pos.y -= 1
	elif event.is_action_pressed("ui_down"):
		new_grid_pos.y += 1
		
	# --- A CERCA ELÉTRICA (Verificação de Limites) ---
	# Se a posição nova é diferente da atual (ou seja, apertamos alguma tecla)...
	if new_grid_pos != grid_position:
		# ...perguntamos ao mapa: "O retângulo que contém as células usadas (pintadas) contém este ponto?"
		if tile_map.get_used_rect().has_point(new_grid_pos):
			# SIM, está dentro! Atualizamos nossa posição de grid.
			grid_position = new_grid_pos
			# Calculamos a nova posição visual em pixels para o centro desse tile.
			target_pixel_position = tile_map.map_to_local(grid_position)
			# Marcamos o input como tratado.
			get_viewport().set_input_as_handled()
		else:
			# NÃO, está fora! Não fazemos nada (o cursor bate na parede invisível).
			pass

func _process(delta):
	# --- ATUALIZAÇÃO VISUAL ---
	# Move o sprite suavemente em direção ao alvo em pixels
	global_position = global_position.move_toward(target_pixel_position, SPEED * delta)
	
