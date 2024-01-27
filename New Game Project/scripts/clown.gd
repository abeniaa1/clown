extends KinematicBody2D

var speed = 500
var velocity = Vector2.ZERO
var dialogue
var talk


func _ready():
	$talk.hide()
	talk = false

func _physics_process(delta):
	if talk:
		talk()
	velocity = Vector2.ZERO
	if Input.is_action_pressed('ui_up'):
		velocity.y -= speed
	if Input.is_action_pressed('ui_down'):
		velocity.y += speed
	if Input.is_action_pressed('ui_left'):
		velocity.x -= speed
	if Input.is_action_pressed('ui_right'):
		velocity.x += speed

	velocity = move_and_slide(velocity)


func _on_eye_area_entered(area):
	$talk.show()
	talk = true

func _on_eye_area_exited(area):
	$talk.hide()
	talk = false
	
	
	
func talk():
	if Input.is_action_just_pressed("ui_accept"):
		get_parent().get_node("dialogue").talk()
