extends TextureRect

#export (PoolStringArray) var typos
var tipo = ""
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func  isChecked():
	return $CheckBox.pressed
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func setTexture(tx):
	tipo = tx
	texture = load("res://sprites/nivel/"+tx+".png")
	#texture = load("res://Graphics/%s.png" %tx)