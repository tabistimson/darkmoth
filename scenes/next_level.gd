extends Area2D



func _on_body_entered(_body) -> void:
	var current_scene_file = get_tree().current_scene.scene_file_path # Replace with function body.
	var nextlvl = current_scene_file.to_int() + 1
	
	var nextlvlpath = "res://levels/level" + str(nextlvl) + ".tscn"
	get_tree().change_scene_to_file(nextlvlpath)
