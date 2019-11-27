extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func setTextures(tx1,tx2):
	texture_normal = load("res://sprites/instruments/"+tx1+".png")
	texture_pressed = load("res://sprites/instruments/"+tx2+".png")
	
	
func setStream(st):
	$AudioStreamPlayer2D.stream = load("res://sound/"+st)
	


func _on_Control_pressed():
	$AudioStreamPlayer2D.play()
