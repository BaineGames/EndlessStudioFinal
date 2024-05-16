extends Node2D

@onready var start= $Start

#@onready var player = $Player
var player = null  #new

func _ready():
	player = get_tree().get_first_node_in_group("player") #new
	if player!=null:   #new
		player.global_position= start.get_spawn_pos()  #new
	var traps = get_tree().get_nodes_in_group("traps")

	for trap in traps:
		#trap.connect("touched_player", _on_trap_touched_player)
		trap.touched_player.connect(_on_trap_touched_player)


func _process(delta):
	if Input.is_action_pressed("quit"):
		get_tree().quit()
	elif Input.is_action_pressed("reset"):
		get_tree().reload_current_scene()
	



func _on_deathzone_body_entered(body):
	reset_player()

func _on_trap_touched_player():
	reset_player() # Replace with function body.


func reset_player():
	player.velocity = Vector2.ZERO # Replace with function body.
	player.global_position= start.get_spawn_pos()
