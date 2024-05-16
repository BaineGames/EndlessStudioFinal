extends ParallaxBackground

@export var bg_texture: CompressedTexture2D = preload("res://assets/assets/textures/bg/Blue.png")

@export var scroll_speed= 15
# Called when the node enters the scene tree for the first time.
@onready var sprite = $Sprite2D

func _ready():
	sprite.texture = bg_texture

func _process(delta):
	sprite.region_rect.position += delta * Vector2(scroll_speed, 
	scroll_speed)
	
	if sprite.region_rect.position >= Vector2(64,64):
		sprite.region_rect.position = Vector2.ZERO
