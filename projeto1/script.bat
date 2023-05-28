echo "Criando as imagens docker ..."

::Utilizarei as imagens docker do professor pois não instalei o Docker Desktop em meu notebook para não atrapalhar o minikube
::docker build -t denilsonbonatti/projeto-backend:1.0 backend/.
::docker build -t denilsonbonatti/projeto-database:1.0 database/.

echo "Realizando o push das imagens ..."

::docker push denilsonbonatti/projeto-backend:1.0
::docker push denilsonbonatti/projeto-database:1.0

echo "Criando serviços no cluster k8s ..."
kubectl apply -f ./services.yaml

echo "Criando PV, PvC e deploys ..."
kubectl apply -f ./deployment.yaml