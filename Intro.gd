extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("New Anim")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass






func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://Telas/Cena2_Tutorial.tscn")


func _on_Switch_pressed():
	get_tree().change_scene("res://Telas/Cena2_Tutorial.tscn")
