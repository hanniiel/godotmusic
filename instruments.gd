extends Node2D

signal on_next
signal on_exit

var container : GridContainer
# Called when the node enters the scene tree for the first time.
func _ready():
	container = $GridContainer
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_buttonExit_pressed():
	emit_signal("on_exit")


func _on_buttonNext_pressed():
	emit_signal("on_next")