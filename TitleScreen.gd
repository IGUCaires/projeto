extends Node



#func _ready():
	#$MarginContainer/VBoxContainer/VBoxContainer/TextureButton.grab_focus()
	
	
#func _physics_process(delta):
	#if $MarginContainer/VBoxContainer/VBoxContainer/TextureButton.is_hovered() == true:
	#	$MarginContainer/VBoxContainer/VBoxContainer/TextureButton.grab_focus()
	#if $MarginContainer/VBoxContainer/VBoxContainer/TextureButton2.is_hovered() == true:
	#	$MarginContainer/VBoxContainer/VBoxContainer/TextureButton2.grab_focus()

func _on_Button_pressed():
	get_tree().change_scene("res://World.tscn")


func _on_Button2_pressed():
	get_tree().quit()
