extends Area2D

@export var velocidade := 300
var direcao = Vector2.ZERO

 
func _process(delta: float) -> void:
	
	position += velocidade * delta * direcao
	

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Inimigos"):
		#Faz o inimigo morrer
		body.tomar_dano()
		#Destrói a bala depois de dar dano no inimigo
		self.queue_free()
