extends KinematicBody2D

var nme = "alex"
onready var dia = get_parent().get_node("dialogue")

func _on_eye_area_entered(area):
	dia.set_file(nme)
