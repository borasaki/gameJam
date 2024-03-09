extends Node


@export var zeroState: State
@export var runState: State

func init(entity: CharacterBody2D, animations: AnimatedSprite2D) -> void:
		for state in get_children():
			state.entity = entity
			state.animations = animations
			
		change_state(zeroState)

func change_state(toState: State) -> void:
	if runState:
		runState.exit()	
	runState = toState
	toState.enter()

func process_physics(delta: float) -> void:
	var toState = runState.process_physics(delta)
	if toState:
		change_state(toState)

func process_input(event: InputEvent) -> void:
	var toState = runState.process_input(event)
	if toState:
		change_state(toState)

func process_frame(delta: float) -> void:
	var toState = runState.process_frame(delta)
	if toState:
		change_state(toState)
