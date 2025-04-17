extends Node

@export var CardButtonScene: PackedScene

@onready var player_label = $'../PlayerStatsLabel'
@onready var monster_label = $'../MonsterStatsLabel'
@onready var hand_container = $'../HandContainer'


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

func draw_cards(n: int) -> void:
	hand.clear()
	hand_container.clear_children()
	
	for i in range(n):
		if deck.is_empty() and discard_pile.size() > 0:
			deck = discard_pile.duplicate()
			discard_pile.clear()
			deck.shuffle()
			
		if not deck.is_empty():
			var card = deck.pop_back()
			hand.append(card)
			
			#create card button
			var card_button = CardButtonScene.instantiate()
			card_button.card_type = card
			card_button.card_played.connect(_on_card_played)
			hand_container.add_child(card_button)
			
	print("Hand (%d): %s" % [hand.size(), hand])

func _on_card_played(card_type: String) -> void:
	print("Played card: ", card_type)


func update_stats():
	# %d is a placeholder that will get replace with player_health, mana
	player_label.text = "Player HP: %d | Mana: %d" % [player_health,mana]
	monster_label.text = "Monster HP: %d" % monster_health



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
