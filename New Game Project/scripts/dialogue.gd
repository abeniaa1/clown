extends CanvasLayer

var speed
onready var file
var names
var dial = []

func _ready():
	hide()

func load_file(file):
	var f = File.new()
	f.open(file, File.READ)
	var index = 1
	while not f.eof_reached(): # iterate through all lines until the end of file is reached
		var line = f.get_line()
		line += " "
		if index == 1:
			names = line
		else:
			dial.append(line)
		index += 1
	f.close()
	return


func set_file(nme):
	file = "res://data/" + nme + ".txt"
	load_file(file)

func talk():
	show()
	$speech.text = dial[1]
	print(dial[2])
