extends Area2D
@onready var timer: Timer = $Timer


func _on_body_entered(body) -> void:
	if body.has_method("death"):
		body.death()
	timer.start()

func _on_timer_timeout():
	print("reload")
	get_tree().reload_current_scene()
