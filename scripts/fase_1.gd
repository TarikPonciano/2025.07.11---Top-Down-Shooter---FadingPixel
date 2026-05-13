extends Node2D

@export var inimigo_cena: PackedScene
@onready var spawners = $Spawners


func spawn_inimigo():
	var lista_spawns = spawners.get_children()
	var spawn = lista_spawns.pick_random()
	
	
	var novo_inimigo = inimigo_cena.instantiate()
	
	novo_inimigo.global_position = spawn.global_position
	novo_inimigo.jogador = %Jogador
	
	get_tree().current_scene.add_child(novo_inimigo)

	

#VERSÃO DESCONTINUADA DE SPAWN DO INIMIGO
func spawn_inimigo_antigo():
	
	#Cria uma cópia do inimigo(Cena)
	var novo_inimigo = inimigo_cena.instantiate()
	
	# Gera a posição que o inimigo deverá spawnar
	
	# Distancia horizontal em relação ao jogador
	var rand_posX = randi_range(-400, 400)
	# Distancia vertical em relação ao jogador 
	var rand_posY = randi_range(-250, 250)
	
	# Cálculo da posição que ele vai aparecer no jogo
	var posX = %Jogador.global_position.x + rand_posX
	var posY = %Jogador.global_position.y + rand_posY
	
	# Verificação se a posição gerada foi válida
	while true:
		# Verificar se o inimigo está longe o suficiente do jogador
		if %Jogador.global_position.distance_to(Vector2(posX, posY)) > 100:
		
		
		# Verificar se o inimigo está spawnando dentro da fase verticalmente
			if posY >= 0 and posY <= 648:
				
		# Verificar se o inimigo está spawnando dentro da fase horizontalmente
				if posX >= 0 and posX <= 1152:
					break
			
		#Gera todas as informações de posição de novo
		rand_posX = randi_range(-400, 400)
		rand_posY = randi_range(-250, 250)
		posX = %Jogador.global_position.x + rand_posX
		posY = %Jogador.global_position.y + rand_posY
	
	novo_inimigo.global_position = Vector2(posX, posY)
	
	# Versão Fácil Porém Problemática
	#novo_inimigo.global_position = Vector2(%Jogador.global_position.x + 100, %Jogador.global_position.y + 100)
	
	get_tree().current_scene.add_child(novo_inimigo)
	
	novo_inimigo.jogador = %Jogador
	
func _on_timer_timeout() -> void:
	spawn_inimigo()
