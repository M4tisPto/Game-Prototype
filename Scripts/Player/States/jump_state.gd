# todavia no doble salto, estoy manteniendo las cosas simple por el momento para entender esto de nuevo xd

extends State

class_name JumpState

var JUMP_SPEED = -400

func enter():
	print("Entrando al state de saltar")
	var character = state_machine.get_parent()
	character.velocity.y = JUMP_SPEED



func physics_process(delta: float) -> void:
	var character = state_machine.get_parent()
	
	# Aplicar gravedad
	character.velocity.y += 900 * delta
	
	var direction := Input.get_axis("move_left", "move_right")

	character.velocity.x = direction * 200
	character.move_and_slide()
	# Volver a cualquier estado al caer
	if character.is_on_floor():
		if direction != 0:
			state_machine.change_state("walkstate")
		else:
			state_machine.change_state("idlestate")
