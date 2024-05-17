extends Node

var hurt = preload("res://assets/assets/audio/hurt.wav")
var jump = preload("res://assets/assets/audio/jump.wav")



func play_sfx(sfx_name: String): #asp=audio stream player
	var stream = null
	if sfx_name == "hurt":
		stream = hurt
	elif sfx_name == "jump":
		stream = jump	
	else:
		return
	

	var asp = AudioStreamPlayer.new()
	
	asp.stream = stream
	asp.name= "SFX"
	
	add_child(asp)
	asp.play()
	
	await asp.finished
	asp.queue_free()
