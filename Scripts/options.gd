extends Control
@onready var cecil: AudioStreamPlayer2D = $cecil
@onready var r_u_sure: AudioStreamPlayer2D = $"r u sure"
@onready var timer_4_funzies: Timer = $Timer_4_funzies

func _ready() -> void:
	cecil.play()
	
func _on_button_pressed() -> void:
	timer_4_funzies.start()
	$CanvasLayer/Sprite2D2.show()
	r_u_sure.play()

func _on_timer_4_funzies_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
