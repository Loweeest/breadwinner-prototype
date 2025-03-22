extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	$buttonsfx.play()
	await $buttonsfx.finished
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://scenes/game.tscn")




func _on_ranking_pressed() -> void:
	$buttonsfx.play()
	await $buttonsfx.finished
	get_tree().change_scene_to_file("res://scenes/rankings.tscn")


func _on_credits_pressed() -> void:
	$buttonsfx.play()
	await $buttonsfx.finished
	print("credits")


func _on_exit_pressed() -> void:
	$buttonsfx.play()
	await $buttonsfx.finished
	get_tree().quit()
