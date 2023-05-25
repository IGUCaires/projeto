extends Node2D

const SPEED = 150
var velocity = Vector2()
var direction = 1


func set_fireball_direction(dir):
	direction = dir
	if dir == -1:
		$Bullet.flip_h = true


func _physics_process(delta):
	velocity.x = SPEED * delta *direction
	translate(velocity)
	$Bullet.play("Tiro")

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Area2D_area_entered(area,body):
	
	queue_free()


func _on_BulletRoot_body_entered(body):
	if "Enemy" in body.name:
		body.dead()
	queue_free()
