extends Label

export var wt = .05
var timer


func _ready():
	set_visible_characters(0)
	timer = Timer.new()
	timer.set_wait_time(wt)
	add_child(timer)
	timer.connect("timeout", self, "on_timeout")
	get_parent().connect("mostrou", self, "on_mostrou")
	get_parent().connect("escondendo", self, "on_escondendo")


func on_timeout():
	set_visible_characters(get_visible_characters() + 1)
	if get_visible_characters() == get_total_character_count():
		timer.stop()


func on_mostrou():
	set_visible_characters(0)
	timer.start()


func on_escondendo():
	set_visible_characters(0)
