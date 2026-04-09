# esta webada hace que cuando detecta que el jugador se mueve, salte o haga slam, automaticamente cambiara a un estado diferente

# costo hacer esto, entendia como funciona pero no sabia como ejecutarlo y que funcione bien hasta ahora

extends Node

var current_state
var player

func init(p):
	player = p
	change_state($IdleState)

func change_state(new_state):
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
