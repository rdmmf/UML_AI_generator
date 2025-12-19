# Test de R1
import openai

# Configuration pour Ollama (API compatible OpenAI)
client = openai.OpenAI(
    base_url="http://deepseek_engine:11434/v1",
    api_key="not-needed"  # Ollama ne nécessite pas de clé API
)

print("Chat avec le modèle DeepSeek R1. Tapez 'quit' pour quitter.")

while True:
    user_input = input("Vous: ")
    if user_input.lower() == 'quit':
        print("Au revoir!")
        break
    
    try:
        response = client.chat.completions.create(
            model="deepseek-r1:1.5b",
            messages=[{"role": "user", "content": user_input}],
            stream=False
        )
        print("Modèle:", response.choices[0].message.content)
    except Exception as e:
        print("Erreur lors de la requête :", str(e))