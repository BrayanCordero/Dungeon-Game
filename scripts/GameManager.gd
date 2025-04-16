extends Node

var player_health = 20
var monster_health = 15
var mana = 3
var deck =[]
var hand = []
var discard_pile = []



# Called when the node enters the scene tree for the first time.
func _ready():
	

func initialize_deck():
	deck = [
		"attack","attack","attack","attack","attack",
		"shield","shield","shield",
		"potion","potion"
	]
	deck.shuffle()


func start_player_turn():
	mana = 3
	draw_cards(5)

func draw_cards(n):
	for i in range(n):
		if deck.size() == 0:
			deck = discard_pile
			discard_pile = []
			deck.shuffle()
		var card = deck.pop_back()
		hand.append(card)
	print("Hand: ", hand)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
