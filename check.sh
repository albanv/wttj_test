

# Je crée un job
curl -X "POST" "http://localhost:3000/api/jobs" \
	-H "Content-Type: application/json" \
	-d "{\"title\":\"test\",\"description\":\"je suis un test\"}"
