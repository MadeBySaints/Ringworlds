extends CanvasModulate

var c_norm = {
    day = Color(1, 1, 1, 1),
    dusk = Color(0.407843, 0.407843, 0.407843, 1),
    dawn = Color(0.54902, 0.54902, 0.54902, 1),
    dark = Color(0.307843, 0.307843, 0.307843, 1)
}
var c_spec = {
    purp_moon = Color(0.376471, 0.247059, 1, 1)
}
var weather = {
    clear = 0,
    rain = 1,
    heavy_rain = 2,
    lightning = 3,
    snow = 4
}

onready var current_cycle = c_norm.day#returns Color(n,n,n,n)
onready var current_weather = weather.clear


func _process(_delta):
    if current_cycle == c_norm.day:
        pass
    else:
        pass



func _ready():
    pass


func update_cycle():
    if current_cycle == c_norm.day:
        current_cycle = c_norm.dusk
        
    elif current_cycle == c_norm.dusk:
        current_cycle = c_norm.dark
    elif current_cycle == c_norm.dark:
        current_cycle = c_norm.dawn
    elif current_cycle == c_norm.dawn:
        current_cycle = c_norm.day
    else:
        return(current_cycle)

func _on_Timer_timeout():
    $Timer.set_wait_time(6)
    update_cycle()
    self.color = current_cycle
