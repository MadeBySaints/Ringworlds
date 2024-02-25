extends Node2D

var i: int = 0
var anim

onready var v = $AnimatedSprite.is_visible()

export (int) var max_i = 3
# pseudo timer for anim. change max_i var to change the length
# of the anim. Lower numbers = shorter animation. Floats not supported.

func _ready():
    $AnimatedSprite.set_visible(false)
    # necessary to keep the sprite visible in editor
    pass


func _physics_process(_delta):
    v = $AnimatedSprite.is_visible()
    # update v continuously so emotes are not spammable
    get_input()


func get_input():
    # future update - emotes reassignable
    if Input.is_action_just_pressed("emote1"):
        anim = "happy"
        play_emote()
    elif Input.is_action_just_pressed("emote2"):
        anim = "angry"
        play_emote()
    elif Input.is_action_just_pressed("emote3"):
        anim = "love"
        play_emote()
    elif Input.is_action_just_pressed("emote4"):
        anim = "hate"
        play_emote()


func play_emote():
    if v:
        return
    else:
        $AnimatedSprite.set_visible(true)
        $AnimatedSprite.play(anim)


func _on_AnimatedSprite_animation_finished():
    i += 1
    if i >= max_i:
        i = 0
        $AnimatedSprite.stop()
        $AnimatedSprite.set_visible(false)
