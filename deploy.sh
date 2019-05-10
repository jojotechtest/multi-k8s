docker build -t jojotechtest/multi-client:latest -t jojotechtest/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t jojotechtest/multi-server:latest -t jojotechtest/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t jojotechtest/multi-worker:latest -t jojotechtest/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push jojotechtest/multi-client:latest
docker push jojotechtest/multi-server:latest
docker push jojotechtest/multi-worker:latest

docker push jojotechtest/multi-client:$SHA
docker push jojotechtest/multi-server:$SHA
docker push jojotechtest/multi-worker:$SHA

#kubectl apply -f k8s
#kubectl set image deployments/client-deployment client=jojotechtest/multi-client:$SHA
#kubectl set image deployments/server-deployment server=jojotechtest/multi-server:$SHA
#kubectl set image deployments/worker-deployment worker=jojotechtest/multi-worker:$SHA