extends Button


var card_type: String = ""
signal card_played(card_type: String)


# Called when the node enters the scene tree for the first time.
func _ready():
	text = card_type.capitalize()


func _pressed():
	emit_signal("card_played", card_type)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
