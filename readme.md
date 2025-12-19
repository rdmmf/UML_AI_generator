Pour build :
```bash
docker compose up --build
```
Pour télécharger deepseek :
```bash
docker exec -it deepseek_engine ollama pull deepseek-r1:1.5b
```
Pour tester r1 :
```bash
curl http://localhost:11434/v1/chat/completions -d '{
  "model": "deepseek-r1:1.5b",
  "messages": [{"role": "user", "content": "Hello!"}],
  "stream": false
}'
```

Pour avoir le chat avec r1:

```bash
docker exec -it uml_app python app.py
```