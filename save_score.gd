extends Node

const FILE_PATH = "user://gamedata.dat"


var vida_full = 100
var last_score = 0
var best_score = 0 setget set_score


func _ready():
	load_score()


func vida():
	vida_full -= 10
	print(vida_full)
	
	
func save_score():
	var file = File.new()
	file.open(FILE_PATH, file.WRITE)
	file.store_var(best_score)
	file.close()


func load_score():
	var file = File.new()
	if file.file_exists(FILE_PATH):
		file.open(FILE_PATH, file.READ)
		best_score = file.get_var()
		file.close()

func set_score(new_score):
	best_score = new_score
	save_score()
	pass
