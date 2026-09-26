# Projets DevOps & Cloud (DIC2 - 2026)

Ce dépôt regroupe deux projets distincts d'évaluation pratique en DevOps et Cloud Computing :

---

## 📁 1. Déploiement LLM avec Kubernetes & Docker (`Devops-Project-deploy-LLM/`)
Projet axé sur le déploiement conteneurisé et orchestré de grands modèles de langage (LLM) :
- **Stack :** Docker Compose, Kubernetes (Minikube), Ollama, Open WebUI, Kustomize.
- **Fonctionnalités :** PVC persistant, Ingress, NetworkPolicy, Autoscaling horizontal (HPA), Load Generator.
- **Accès au projet :** Voir le dossier [`Devops-Project-deploy-LLM/`](./Devops-Project-deploy-LLM) et son [`REPORT.md`](./Devops-Project-deploy-LLM/REPORT.md).

---

## ☁️ 2. Émulation Cloud avec Floci & Terraform (`Projet-Cloud/`)
Projet d'évaluation Cloud conforme au barème et aux bonus du sujet `projet_evaluation_Cloud_floci_terraform.md` :
- **Stack :** Floci (émulateur local AWS), Floci UI (console web locale sur le port 4500), Terraform 1.10.
- **Services AWS déployés :** Amazon S3 (stockage objet) et Amazon DynamoDB (base NoSQL).
- **Architecture IaC :** Modules réutilisables, variables avec validation avancée, `locals`, `outputs`, multi-environnements (`dev` / `prod`), suite de tests natifs HCL (`terraform test`) et documentation automatique avec `terraform-docs`.
- **Accès au projet :** Voir le dossier [`Projet-Cloud/`](./Projet-Cloud), son [`README.md`](./Projet-Cloud/README.md) et son [`REPORT.md`](./Projet-Cloud/REPORT.md).
