import time
import sys

# Simulation du démarrage
print("--- Démarrage de l'Application UML ---")
print("Initialisation des agents...")
# Ici viendra votre code CrewAI plus tard
# BOUCLE INFINIE : Indispensable pour que Docker ne s'arrête pas
try:
    while True:
        # On dort pour ne pas consommer 100% du CPU
        time.sleep(10)
        # On peut ajouter un log heartbeat si on veut
        # print("En attente de tâches...")
except KeyboardInterrupt:
    print("Arrêt de l'application.")
    sys.exit(0)






