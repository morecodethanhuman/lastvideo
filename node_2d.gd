extends Node2D

var speed = 50

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Personajes/Character/AnimatedSprite2D.play("walking2")
	$Personajes/papa/AnimatedSprite2D.play("walking2")
	$Personajes/mama/AnimatedSprite2D.play("walking2")
	$Personajes/david/AnimatedSprite2D.play("walking2")
	$Personajes/yopeque/AnimatedSprite2D.play("walking2")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	$ScrollController.position+= Vector2.LEFT*speed*delta
	$Personajes/Character.position+= Vector2.LEFT*speed*delta
	$Personajes/papa.position+= Vector2.LEFT*speed*delta
	$Personajes/mama.position+= Vector2.LEFT*speed*delta
	$Personajes/david.position+= Vector2.LEFT*speed*delta
	$Personajes/yopeque.position+= Vector2.LEFT*speed*delta
	
