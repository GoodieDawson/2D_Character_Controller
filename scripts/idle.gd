extends CharacterState

func enter() -> void:
	animated_sprite_2d.play("idle")

func physics_update(_delta: float) -> void:
	
	var direction := Input.get_axis("move_left", "mover_right")
	
	if Input.is_action_just_pressed("jump") and character_body_2d.is_on_floor():
		character_state_machine.change_state("jump")

	if direction != 0 and character_body_2d.is_on_floor():
		character_state_machine.change_state("run")

	if !character_body_2d.is_on_floor():
		character_state_machine.change_state("fall")
