# testfront OLD

docker build -t  $REGION-docker.pkg.dev/$PROJECT/$DOCKER_REPO_NAME/$IMAGE:prod .

docker run -e PORT=8000 -p 8000:8000 --env-file .env $REGION-docker.pkg.dev/$PROJECT/$DOCKER_REPO_NAME/$IMAGE:prod

docker push $REGION-docker.pkg.dev/$PROJECT/$DOCKER_REPO_NAME/$IMAGE:prod


gcloud run deploy --image $REGION-docker.pkg.dev/$PROJECT/$DOCKER_REPO_NAME/$IMAGE:prod --region $REGION --env-vars-file .env.yaml


# Procedure déploiement OK:

# build
docker build -t  $REGION-docker.pkg.dev/$PROJECT/$DOCKER_REPO_NAME/$IMAGE:prod .

# test en local :
docker run -p 8080:8080 europe-west1-docker.pkg.dev/ia-trail-wagon/frontiatrail/front:prod

# push sur gcp
docker push $REGION-docker.pkg.dev/$PROJECT/$DOCKER_REPO_NAME/$IMAGE:prod

# Deploy
gcloud run deploy --image $REGION-docker.pkg.dev/$PROJECT/$DOCKER_REPO_NAME/$IMAGE:prod --region $REGION --env-vars-file .env.yaml
