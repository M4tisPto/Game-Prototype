extends State

class_name WalkState

func enter():
	print("Entrando al state de caminar")
func physics_process(delta: float) -> void:

	var direction := Input.get_axis("move_left", "move_right")
	var character = state_machine.get_parent()

	character.velocity.x = direction * 200
	character.move_and_slide()

func handle_input(event):
	if Input.is_action_just_pressed("jump"):
		state_machine.change_state("jumpstate")


func exit():
	# también que haya como una animacion de volver al idle state todo fluido (ya me estoy imaginando cosas xd)
	pass
