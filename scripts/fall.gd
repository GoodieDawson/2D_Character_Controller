extends CharacterState

const SPEED = 130.0

func physics_update(delta: float) -> void:

	if character_body_2d.is_on_floor():
		character_state_machine.change_state("idle")

	character_body_2d.velocity += character_body_2d.get_gravity() * delta
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "mover_right")

	# Flip Sprite
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
		
	if direction:
		character_body_2d.velocity.x = direction * SPEED

	character_body_2d.move_and_slide()
