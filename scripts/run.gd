extends CharacterState

const SPEED = 130.0

func enter() -> void:
	animated_sprite_2d.play("run")

func physics_update(_delta: float) -> void:
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "mover_right")
	
	if !direction:
		character_state_machine.change_state("idle")

	# Flip Sprite
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
		
	if direction:
		character_body_2d.velocity.x = direction * SPEED

	character_body_2d.move_and_slide()
	
func exit() -> void:
	character_body_2d.velocity.x = move_toward(character_body_2d.velocity.x, 0, SPEED)
