# DevOps Project: LLM Deployment with Docker Compose & Kubernetes

Ce projet contient la solution complète pour le déploiement et l'orchestration d'un Grand Modèle de Langage (LLM) avec **Ollama** et **Open WebUI**, d'abord en local avec **Docker Compose**, puis sous **Kubernetes**.

---

## 📁 Structure du Projet

```text
LLM_Deployment_Devops_Project/
├── docker-compose.yaml          # Fichier Docker Compose (Partie 1)
├── .env                         # Variables d'environnement Docker Compose
├── k8s/                         # Manifestes Kubernetes (Partie 2)
│   ├── 00-namespace.yaml        # Namespace dédié 'llm'
│   ├── 01-configmap.yaml        # Variables de configuration
│   ├── 02-pvc.yaml              # Volumes persistants pour Ollama et WebUI
│   ├── 03-ollama-deployment.yaml# Déploiement Ollama (avec sondes & limites)
│   ├── 04-ollama-service.yaml   # Service ClusterIP interne pour Ollama
│   ├── 05-openwebui-deployment.yaml # Déploiement Open WebUI
│   ├── 06-openwebui-service.yaml# Service NodePort externe (port 30080)
│   ├── 07-ingress.yaml          # Ingress HTTP
│   ├── 08-networkpolicy.yaml    # [Bonus] Sécurité réseau entre pods
│   ├── 09-hpa.yaml              # [Bonus] Autoscaler horizontal (HPA)
│   └── kustomization.yaml       # [Bonus] Déploiement unifié avec Kustomize
├── docs/                        # Captures d'écran et illustrations
│   └── screenshots/
├── REPORT.md                    # Rapport technique complet (2-3 pages)
└── README.md                    # Guide d'exécution et documentation
```

---

## 🚀 Guide d'Exécution Rapide

### Partie 1 : Déploiement Local avec Docker Compose

1. **Démarrer les conteneurs :**
   ```bash
   docker compose up -d
   ```

2. **Vérifier l'état des conteneurs :**
   ```bash
   docker compose ps
   ```

3. **Accéder à l'interface Open WebUI :**
   - URL : [http://localhost:3000](http://localhost:3000)

4. **Télécharger les modèles requis dans Ollama :**
   ```bash
   docker exec -it ollama ollama pull llama3.2:3b
   docker exec -it ollama ollama pull mistral:7b
   ```

5. **Tester les modèles :**
   - Se connecter sur l'interface, sélectionner le modèle téléchargé et envoyer un prompt de test.
   - Prendre les captures d'écran requises.

6. **Arrêter Docker Compose avant de passer à Kubernetes :**
   ```bash
   docker compose down
   ```

---

### Partie 2 : Déploiement avec Kubernetes (Minikube)

1. **Démarrer Minikube :**
   ```bash
   minikube start --driver=docker --cpus=4 --memory=8192
   ```

2. **Déployer tous les manifestes :**
   ```bash
   kubectl apply -k k8s/
   ```

3. **Vérifier le statut des ressources :**
   ```bash
   kubectl get pods,svc,pvc -n llm
   ```

4. **Télécharger les modèles dans le Pod Ollama de Kubernetes :**
   ```bash
   # Récupérer le nom du pod Ollama
   OLLAMA_POD=$(kubectl get pod -n llm -l app=ollama -o jsonpath='{.items[0].metadata.name}')
   
   # Télécharger les modèles
   kubectl exec -it -n llm $OLLAMA_POD -- ollama pull llama3.2:3b
   kubectl exec -it -n llm $OLLAMA_POD -- ollama pull mistral:7b
   ```

5. **Accéder à Open WebUI :**
   ```bash
   minikube service openwebui-service -n llm
   # Ou via port-forward direct :
   kubectl port-forward svc/openwebui-service 8080:8080 -n llm
   ```

6. **Effectuer les captures d'écran de validation :**
   - `kubectl get pods -n llm` (tous les pods en état `Running`)
   - `kubectl get svc -n llm` (services actifs)
   - Interface d'accueil Open WebUI
   - Prompt et réponse réussis avec chaque modèle

---

### ⭐ Bonus : Démonstration du Horizontal Pod Autoscaler (HPA)

1. **Vérifier l'état de l'HPA au repos :**
   ```bash
   kubectl get hpa -n llm
   ```

2. **Ouvrir la surveillance continue (Terminal 1) :**
   ```bash
   kubectl get hpa -n llm -w
   ```
   *(Capture disponible : `capture_Lab/record_hpa_1.png`)*

3. **Générer un pic de trafic HTTP (Terminal 2) :**
   ```bash
   kubectl run load-test --rm -it --image=busybox --restart=Never -n llm -- /bin/sh -c "while true; do wget -q -O- http://openwebui-service:8080/health > /dev/null; done"
   ```
   *(Capture disponible : `capture_Lab/record_hpa_2.png`)*

4. **Résultat observé :**
   - La charge CPU grimpe à plus de 150%.
   - L'HPA déclenche automatiquement le scale-up de 1 à 3 réplicas.
   - À l'arrêt du trafic (`Ctrl + C`), après la période de stabilisation (5 minutes), l'HPA redescend automatiquement à 1 réplica (*scale-down*).

---

## 📄 Rapport Technique

Consultez le fichier [REPORT.md](REPORT.md) pour l'analyse théorique approfondie, les diagrammes d'architecture et les 9 figures de démonstration.
