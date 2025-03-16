extends StaticBody3D

@export var dialogue_resource: DialogueResource = load("res://Talky_Talky_Dialogue/dialogue1.dialogue")
@export var dialogue_start: String = "start"


func action() -> void:
	DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_dialogue_trigger_body_entered(body: Node3D) -> void:
	if body.name == "Player": 
		DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)
	
