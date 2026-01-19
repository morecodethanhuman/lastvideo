extends Node2D

var speed = 50

@onready var music := $AudioStreamPlayer

var cues = [
	{"time": 0, "action":_inicial},
	{"time": 5.941, "action":david_corre},
	{"time": 7.7, "action":ari_david_corren},
	{"time": 10.748, "action":ari_cae},
	{"time": 10.749, "action":null},
	{"time": 11.860+(1.0/8), "action":ari_llora},
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
	if(cues[current_cue]["action"]):
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

func david_corre(delta):
	$ScrollController.position+= Vector2.LEFT*speed*delta
	$Personajes/Character.position+= Vector2.LEFT*speed*delta
	$Personajes/papa.position+= Vector2.LEFT*speed*delta
	$Personajes/mama.position+= Vector2.LEFT*speed*delta
	$Personajes/david.position+= Vector2.LEFT*(speed*2)*delta
	$Personajes/yopeque.position+= Vector2.LEFT*(speed)*delta


func ari_david_corren(delta):
	$ScrollController.position+= Vector2.LEFT*speed*delta
	$Personajes/Character.position+= Vector2.LEFT*speed*delta
	$Personajes/papa.position+= Vector2.LEFT*speed*delta
	$Personajes/mama.position+= Vector2.LEFT*speed*delta
	$Personajes/david.position+= Vector2.LEFT*(speed*2)*delta
	$Personajes/yopeque.position+= Vector2.LEFT*(speed*2)*delta

func ari_cae(delta):
	$Personajes/yopeque.scale=Vector2(0.30,0.30)
	$Personajes/yopeque.position+= Vector2.LEFT*(speed/2)*delta
	$Personajes/yopeque/AnimatedSprite2D.play("cae")
	$Personajes/Character/AnimatedSprite2D.stop()
	$Personajes/papa/AnimatedSprite2D.stop()
	$Personajes/mama/AnimatedSprite2D.stop()
	$Personajes/david/AnimatedSprite2D.stop()
	$Personajes/david/Gotas.visible=true
	$Personajes/david/Gotas.play()
	$Personajes/mama/Gotas.visible=true
	$Personajes/mama/Gotas.play()
	$Personajes/papa/Gotas.visible=true
	$Personajes/papa/Gotas.play()

func ari_llora(delta):
	$Personajes/yopeque/AnimatedSprite2D.play("llora")
