
# Je crée un job
curl -X "POST" "http://localhost:3000/api/jobs" \
	-H "Content-Type: application/json" \
	-d "{\"title\":\"test\",\"description\":\"je suis un test\"}"

# J'update ce job
curl -X "PUT" "http://localhost:3000/api/jobs/1" \
	-H "Content-Type: application/json" \
	-d "{\"title\":\"test2\"}"

# Je récupère ce job, il n'y a pas de candidats
curl -X "GET" "http://localhost:3000/api/jobs/1"

# Je candidate à ce job
curl -X "POST" "http://localhost:3000/api/candidates" \
	-H "Content-Type: application/json" \
	-d "{\"firstname\":\"alban\",\"lastname\":\"vitale\",\"headline\":\"dev\",\"coverletter\":\"coucou\",\"resume\":\"http://cv.alban.io\",\"job_id\":\"1\"}"

# Je récupère ce job, il y a bien une candidature
curl -X "GET" "http://localhost:3000/api/jobs/1"

# À partir de l'ID du candidatm je récupère d'avantage d'informations
curl -X "GET" "http://localhost:3000/api/candidates/1"

# Je supprime ce job
curl -X "DELETE" "http://localhost:3000/api/jobs/1"

# Je veux vérifier que le job et les candidatures associées n'existent plus
curl -X "GET" "http://localhost:3000/api/jobs/1"
curl -X "GET" "http://localhost:3000/api/candidates/1"
