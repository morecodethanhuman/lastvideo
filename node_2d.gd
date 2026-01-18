extends Node2D

var speed = 50

@onready var music := $AudioStreamPlayer

var cues = [
	{"time": 0, "action":_inicial},
	{"time": 11.440, "action":ari_david_corren},
	{"time": 1000.440, "action":"ari_david_corren"},
]

var current_cue = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Personajes/Character/AnimatedSprite2D.play("walking2")
	$Personajes/papa/AnimatedSprite2D.play("walking2")
	$Personajes/mama/AnimatedSprite2D.play("walking2")
	$Personajes/david/AnimatedSprite2D.play("walking2")
	$Personajes/yopeque/AnimatedSprite2D.play("walking2")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var time = get_time()
	if(time>=cues[current_cue+1].time):
		current_cue+=1
	cues[current_cue]["action"].call(delta)


func get_time() -> float:
	return music.get_playback_position()
	
	
func _inicial(delta):
	$ScrollController.position+= Vector2.LEFT*speed*delta
	$Personajes/Character.position+= Vector2.LEFT*speed*delta
	$Personajes/papa.position+= Vector2.LEFT*speed*delta
	$Personajes/mama.position+= Vector2.LEFT*speed*delta
	$Personajes/david.position+= Vector2.LEFT*speed*delta
	$Personajes/yopeque.position+= Vector2.LEFT*speed*delta

func ari_david_corren(delta):
	$ScrollController.position+= Vector2.LEFT*speed*delta
	$Personajes/Character.position+= Vector2.LEFT*speed*delta
	$Personajes/papa.position+= Vector2.LEFT*speed*delta
	$Personajes/mama.position+= Vector2.LEFT*speed*delta
	$Personajes/david.position+= Vector2.LEFT*(speed*1.5)*delta
	$Personajes/yopeque.position+= Vector2.LEFT*(speed*1.5)*delta
