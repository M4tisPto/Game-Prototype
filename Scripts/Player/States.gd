extends Node
class_name State

var player: CharacterBody2D
var state_machine: StateMachine


# metodos que los child states puedan anular
func enter(): pass
func exit(): pass
func update(delta: float): pass
func physics_update(delta: float): pass
func handle_input(event: InputEvent): pass
