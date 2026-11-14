
extends Control

@onready var engine_option = $CenterContainer/VBoxContainer/OptionButton
@onready var fuel_option = $CenterContainer/VBoxContainer/OptionButton2
@onready var distance_input = $CenterContainer/VBoxContainer/SpinBox
@onready var result_label = $CenterContainer/VBoxContainer/Label5
@onready var calculate_button = $CenterContainer/VBoxContainer/Button

var engines = {
	"Chemical Engine": 9.0,
	"ION Drive": 5.0,
	"Fusion Engine": 3.0
}

var fuels = {
	"Standard Fuel": 1.0,
	"Hydrogen Fuel": 0.8,
	"Advanced Fuel": 0.65
}

func _ready():
	calculate_button.pressed.connect(calculate_fuel)

func calculate_fuel():
	var engine = engine_option.get_item_text(
		engine_option.selected
	)

	var fuel = fuel_option.get_item_text(
		fuel_option.selected
	)

	var distance = distance_input.value

	var consumption = engines[engine]
	var efficiency = fuels[fuel]

	var required_fuel = (
		distance / 100.0
	) * consumption * efficiency

	result_label.text = (
        "MISSION ANALYSIS\n"
		+ "Engine: " + engine + "\n"
		+ "Fuel: " + fuel + "\n"
		+ "Distance: " + str(distance) + " km\n"
		+ "Required Fuel: "
		+ str(snappedf(required_fuel, 0.1))
		+ " litres"
	)
func _process(_delta):
	$AnimatedSprite2D.global_position = get_global_mouse_position()

	if not $AnimatedSprite2D.is_playing():
		$AnimatedSprite2D.play("flame")
