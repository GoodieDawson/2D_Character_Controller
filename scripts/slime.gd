extends Node2D

const SPEED: int = 60

var direction: int = 1

@onready var ray_right: RayCast2D = $RayRight
@onready var ray_left: RayCast2D = $RayLeft
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
	if ray_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
	position.x +=  direction * SPEED * delta
