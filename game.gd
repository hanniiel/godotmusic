extends Node2D

export (PackedScene) var Item
export (PackedScene) var Select

var state = State.BANDA

enum State {BANDA, SON, HUAPANGO}

var son = {
	"instruments":["son1","son2","son3","son4"],#path
	"music":"son/track.ogg",
	"son1":{
		"animation": ["s1a1","s1a2"], #path
		"sfx":"son/_hit_claves.wav"
	},
	"son2":{
		"animation": ["s2a1","s2a2"], #path
		"sfx":"son/_hit_congas.wav"
	},
	"son3":{
		"animation": ["s3a1","s3a2"], #path
		"sfx":"son/_hit_wiro.wav"
	},
	"son4":{
		"animation": ["s4a1","s4a2"], #path
		"sfx":"son/_hit_maracas.wav"
	}
}
var banda = {
	"instruments":["banda1","banda2","banda3","banda4"],#path
	"music":"banda/track.ogg",
	"banda1":{
		"animation": ["b1a1","b1a2"], #path
		"sfx":"banda/_hit_tambor.wav"
	},
	"banda2":{
		"animation": ["b2a1","b2a2"], #path
		"sfx":"banda/_hit_tarola.wav"
	},
	"banda3":{
		"animation": ["b3a1","b3a2"], #path
		"sfx":"banda/_hit_platillos.wav"
	},
	"banda4":{
		"animation": ["b4a1","b4a2"], #path
		"sfx":"banda/_hit_pandero.wav"
	}
}

var huapango = {
	"instruments":["huapa1","huapa2","huapa3","huapa4"],#path
	"music":"huapango/track.ogg",
	"huapa1":{
		"animation": ["h1a1","h1a2"], #path
		"sfx":"huapango/_hit_tarola.wav"
	},
	"huapa2":{
		"animation": ["h2a1","h2a2"], #path
		"sfx":"huapango/_hit_tambor.wav"
	},
	"huapa3":{
		"animation": ["h3a1","h3a2"], #path
		"sfx":"huapango/_hit_maracas.wav"
	},
	"huapa4":{
		"animation": ["h4a1","h4a2"], #path
		"sfx":"huapango/_hit_pandero.wav"
	}
}


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	



func _on_intro_click():
	print("hol")
	$intro.visible = false
	$select.visible = true


func _on_select_music_Selected(typo):
	#hide previous view
	$select.visible = false
	#clena childs on container
	for ch in $instruments.container.get_children():
		$instruments.container.remove_child(ch)
	
	match typo:
		"son":
			state = State.SON
			for s in son.instruments:
				var item = Select.instance()
				item.setTexture(s)
				$instruments.container.add_child(item)
		"banda":
			state = State.BANDA
			for b in banda.instruments:
				var item = Select.instance()
				item.setTexture(b)
				$instruments.container.add_child(item)
		"huapango":
			state = State.HUAPANGO
			for h in huapango.instruments:
				var item = Select.instance()
				item.setTexture(h)
				$instruments.container.add_child(item)
	
	$instruments.visible = true


func setGame():
	print("setting all..")
	var obj = null
	match state:
				State.SON:
					obj = son
				State.BANDA:
					obj = banda
				State.HUAPANGO:
					obj = huapango
					
	$AudioStreamPlayer2D.stream = load("res://sound/"+obj.music)
	$AudioStreamPlayer2D.play()
	#clean
	for item in $PanelContainer/GridContainer.get_children():
		$PanelContainer/GridContainer.remove_child(item)
	#
	var count = $instruments.container.get_child_count()
	#set columns 4 playing
	if count > 3:
		$PanelContainer/GridContainer.columns = 2
	else:
		$PanelContainer/GridContainer.colums = count
	
	for i in $instruments.container.get_children():
		if(i.isChecked()):
			var c = Item.instance()
			c.setTextures(obj[i.tipo].animation[0],obj[i.tipo].animation[1])
			c.setStream(obj[i.tipo].sfx)
			$PanelContainer/GridContainer.add_child(c)
	

	
func _on_instruments_on_exit():
	$instruments.visible = false
	$select.visible = true
	
func _on_instruments_on_next():
	#start game music instruments etc
	$instruments.visible = false
	$PanelContainer.visible = true
	setGame()


func _on_btngameexit_pressed():
	$AudioStreamPlayer2D.stop()
	$PanelContainer.visible = false
	$instruments.visible = true
