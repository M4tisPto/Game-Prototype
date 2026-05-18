extends Node

var current_state
var player

func init(p):
	player = p
	
	for child in get_children():
		if child is State:
			child.player = player
			child.state_machine = self
	
	change_state($IdleState)

func change_state(new_state):
	if new_state == null:
		push_error("nope eso no es un estado")
		return

	if current_state == new_state:
		return

	if current_state:
		current_state.exit()

	current_state = new_state
	current_state.player = player
	
	current_state.state_machine = self

	if player.state_label:
		player.state_label.text = "State: " + current_state.name

	current_state.enter()

func physics_update(delta):
	if current_state:
		current_state.physics_update(delta)
