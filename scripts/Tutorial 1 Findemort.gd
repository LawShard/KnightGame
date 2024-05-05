extends Node

var cazuela = "cebolla" #String
var numero_entero = 5 #Numero Entero
var numero_real = 0.5 #Numero Real
var booleano = true #Booleano
var variable_vacia = null #Variable Null
var array = [1, 2, 3] #Lista
var coordenadas:Vector2 = Vector2(3, 7)

var daño = 1 + 3
const VIDA_INICIAL = 10 #Constante
var vida_actual = VIDA_INICIAL
# Called when the node enters the scene tree for the first time.
func _ready():
#region Variables. Ejemplo de regiones
	print(coordenadas.angle())
	
	print("\nvariables")
	print(cazuela)#Print muestra mensajes. 
	cazuela = "patatas"
	print(cazuela)
#endregion
	print(daño)
	vida_actual =vida_actual - daño
	print(vida_actual)
	
#ATTENTION ALERT INFO TEST BUG WARNING TODO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



	var inventario = {
		madera = 15,
		espada = 1,
		"pociones de vida" = 2, #Se necesitan comillas
		}
	print(inventario["pociones de vida"]) #Cuando la clave tiene comillas se la llama así
	print(inventario.madera) #Si no tiene comillas se puede hacer así
