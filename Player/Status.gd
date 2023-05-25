extends Control

var currentScore = SaveScore.last_score
var BestScore = SaveScore.best_score
var vida = SaveScore.vida_full


var game
func _ready():
	game = get_tree().current_scene
	$best_score.hide()
	$score.text = "Score: " + str(currentScore)
	$best_score.text = "Max Score: " +str(BestScore)
	$ProgressBar.value = vida 


func dano(dano):
	if vida == $ProgressBar.value:
		SaveScore.vida()
		$ProgressBar.value -= dano
		vida = $ProgressBar.value 
	else:
		SaveScore.vida()
		$ProgressBar.value -= dano
		$ProgressBar.value = vida 
	
func score(score):
		SaveScore.last_score = score
		game.count_score()
		currentScore += score
		$score.text = "Score: " + str(currentScore)
		$best_score.text = "Max Score: " +str(BestScore)
	

