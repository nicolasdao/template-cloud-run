```
git clone https://github.com/nicolasdao/template-cloud-run.git yourprojectname
cd yourprojectname
npm i
```

# About this template

This template is preconfigured with the following config files so it's ready to be deployed to Google Cloud Run via a GitHub trigger:
- `Dockerfile`
- `.dockerignore`
- `cloudbuild.yaml`
- `.npmrc` to install private GitHub packages

What's left to be configured are:
- Creating a new Google Cloud project.
- Enabling the billing for that project.
- Enabling the following services with this single command:
	```
	gcloud services enable cloudbuild.googleapis.com run.googleapis.com secretmanager.googleapis.com
	```	
	> `secretmanager.googleapis.com` might not be needed, but it is usually need to store your secrets.
- Add new roles to Cloud Build so it is allowed to:
	- Deploy to Cloud Run.
	- Access Secret Manager (optional).
- Add a new GitHub trigger in Cloud Build so that pushes to certain branches or tags trigger a new deployment.

# Project conventions

The `cloudbuild.yaml` leverages `${PROJECT_ID}` combined with the following substitution variables that are accessible when GitHub push is configured to trigger Cloud Build:
- `${REPO_NAME}`
- `${SHORT_SHA}`
- `${BRANCH_NAME}`

Those variables are used to name the Docker image as well as the deployed service as follow:
- Cloud Run service name: `${REPO_NAME}-${BRANCH_NAME}` (e.g., prod should be `my-super-service-master` and test should be `my-super-service-test`).
- Container Registry Docker image: `gcr.io/${PROJECT_ID}/${REPO_NAME}:${SHORT_SHA}` (e.g., `gcr.io/my-super-project/my-super-service@sha256:3eda852`).
