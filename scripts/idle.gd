extends CharacterState

func enter() -> void:
	animated_sprite_2d.play("idle")

func physics_update(_delta: float) -> void:
	
	var direction := Input.get_axis("move_left", "mover_right")
	
	if direction != 0:
		character_state_machine.change_state("run")
