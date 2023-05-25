extends Area2D

export(String, FILE, "*.tscn") var cenas

func _on_Passagem_body_entered(body):
	$AudioStreamPlayer2D.play()	
	
func _ready():
	$AnimationPlayer.play("Portal")


func _on_Passagem_body_exited(body):
	$AudioStreamPlayer2D.stop()

func _on_AnimationPlayer_animation_finished(anim_name):
	$AnimationPlayer.play("Portal")


func _on_AudioStreamPlayer2D_finished():
	get_tree().change_scene(cenas)
