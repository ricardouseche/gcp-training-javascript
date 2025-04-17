# gcp-training-javascript

A toy application for very specific demo purposes.

## Local Prerequisites:

- NodeJS installed.
- Docker installed.
- Google Cloud SDK (gcloud) installed and configured (logged into your Google Cloud account).

## Remote Prerequisites:

- A Google Cloud Project with the Cloud Run API and Artifact Registry API enabled.
- An Artifact Registry Docker repository created.

## Development:

### Javascript Run

First install the dependencies:
```
npm install
```

Now run the application locally
```
npm start
```
Once it's running you can curl against localhost:8080 and see the response


### Javascript Tests
To run the unit tests:
```
npm test
```

### Javascript Linting
To run the linter:
```
npm run lint
```

To build the docker image locally run:
```
docker build -t gcp-training-javascript .
```

To test the local image run:
```
docker run --rm -p 9090:8080 --name local-gcp-training-javascript gcp-training-javascript
```
Once it's running you can curl against localhost:9090 and see the response

### GCP

Uploading to Artifact Registry (replace the capitals vars):
```
# authenticate
gcloud auth configure-docker YOUR_REGION-docker.pkg.dev

# build your image
docker buildx build --platform linux/amd64 -t YOUR_REGION-docker.pkg.dev/GCP_PROJECT_NAME/YOUR_REPO_NAME/gcp-training-javascript .

# push image
docker push YOUR_REGION-docker.pkg.dev/GCP_PROJECT_NAME/YOUR_REPO_NAME/gcp-training-javascript
```

Deploy to Cloud Run:
```
gcloud run deploy gcp-training-javascript \
  --image YOUR_REGION-docker.pkg.dev/YOUR_PROJECT_ID/YOUR_REPO_NAME/gcp-training-javascript:latest \
  --region YOUR_REGION \
  --allow-unauthenticated
```

Once deployed, gcloud will output the Service URL. You can access your running application at this URL.
