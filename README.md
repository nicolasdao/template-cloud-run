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