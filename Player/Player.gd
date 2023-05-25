extends KinematicBody2D


const UP = Vector2(0, -1)
const GRAVITY = 10
const SPEED = 150
const JUMP_HEIGHT = -200



var motion = Vector2()


var is_attacking = false
var is_attacking2 = false
var jump = false


var is_dead = false

var vida = 100



const FIREBALL = preload("res://Player/BulletRoot.tscn")


signal levarDano
signal aumentarScore



func _physics_process(_delta):

	if is_dead == false:
		if is_attacking == false:
			motion.y += GRAVITY
			
			if Input.is_action_just_pressed("Attack1"):
				$Sprite.play("Attack1")
				is_attacking2 = true
				$AttackArea/CollisionShape2D.call_deferred("set_disabled", false)
			if Input.is_action_just_pressed("Attack2"):
				$Sprite.play("Attack2")
				is_attacking2 = true
				$AttackArea/CollisionShape2D.call_deferred("set_disabled", false)
				
			if Input.is_action_pressed("ui_right") && is_attacking2 == false:
				motion.x = SPEED
				$Sprite.play("Run")
				$Sprite.flip_h = false
				if sign($Position2D.position.x) == -1:
					$Position2D.position.x *= -1
				if sign($AttackArea.position.x) == -1:
					$AttackArea.position.x *= -1
			elif Input.is_action_pressed("ui_left") && is_attacking2 == false:
				motion.x = -SPEED
				$Sprite.play("Run")
				$Sprite.flip_h = true
				if sign($Position2D.position.x) == 1:
					$Position2D.position.x *= -1
				if sign($AttackArea.position.x) == 1:
					$AttackArea.position.x *= -1
			elif Input.is_action_pressed("ui_down") && is_attacking == false:
				motion.x = 0
				is_attacking == false
				$Sprite.play("Down")
			elif Input.is_action_just_pressed("PLAYER_SHOOT") && is_attacking == false && is_on_floor():
				if is_on_floor():
					motion.x= 0
				is_attacking = true
				var fireball = FIREBALL.instance()
				$Sprite.play("Attack")
				if sign($Position2D.position.x) == 1:
					fireball.set_fireball_direction(1)
				else:
					fireball.set_fireball_direction(-1)
				get_parent().add_child(fireball)
				fireball.position = $Position2D.global_position
			else:
				motion.x = 0
				if is_attacking2 == false :
					$Sprite.play("Idle")

			if Input.is_action_pressed("ui_up"):
				if is_on_floor() == true:
					$Sprite.play("jump")
					$Pulo.play()
					motion.y = JUMP_HEIGHT

	motion = move_and_slide(motion, UP)
	
	if get_slide_count() > 0:
		for i in range(get_slide_count()):
			if "Enemy" in get_slide_collision(i).collider.name:
				dead()



func dead():
		emit_signal("levarDano", 10)
		if SaveScore.vida_full == 0:
			is_dead = true
			motion = Vector2(0,0)
			$Sprite.play("dead")
			$CollisionShape2D.call_deferred("set_disabled", true)
			$Timer.start()

func _on_Sprite_animation_finished():
	if $Sprite.animation == "Attack":
		is_attacking = false
	if $Sprite.animation == "Attack1":
		$AttackArea/CollisionShape2D.call_deferred("set_disabled", true)
		is_attacking2 = false
	if $Sprite.animation == "Attack2":
		$AttackArea/CollisionShape2D.call_deferred("set_disabled", true)
		is_attacking2 = false

func _on_Timer_timeout():
	get_tree().change_scene("res://Telas/Rescursos/_GameOver.tscn")


func _on_AttackArea_body_entered(body):
	if "Enemy" in body.name:
		body.dead()
		emit_signal("aumentarScore", 25)
		
