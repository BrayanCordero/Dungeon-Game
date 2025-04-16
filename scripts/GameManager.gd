extends Node

@onready var player_label = $'../PlayerStatsLabel'
@onready var monster_label = $'../MonsterStatsLabel'


var player_health = 20
var monster_health = 15
var mana = 3
var deck =[]
var hand = []
var discard_pile = []



# Called when the node enters the scene tree for the first time.
func _ready():
	initialize_deck()
	start_player_turn()

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
	update_stats()
	print("Player's turn")

func draw_cards(n):
	hand.clear()
	for i in range(n):
		if deck.size() == 0 and discard_pile.size() > 0:
			deck = discard_pile
			discard_pile = []
			deck.shuffle()
		if deck.size() > 0:
			var card = deck.pop_back()
			hand.append(card)
	print("Hand: ", hand)


func update_stats():
	# %d is a placeholder that will get replace with player_health, mana
	player_label.text = "Player HP: %d | Mana: %d" % [player_health,mana]
	monster_label.text = "Monster HP: %d" % monster_health

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
