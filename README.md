# Docker AI Lab

Spin up a flexible AI lab in minutes with Docker!  
Easily try, upgrade, and clean up AI models so you can focus on experimentation, not maintenance.

---

## ⚠️ Prerequisites

- This repository is designed for **Ubuntu Server**.  
  It may **not work correctly on other Linux distributions**.  
  Download Ubuntu Server here: [https://ubuntu.com/download/server](https://ubuntu.com/download/server)
- A supported **NVIDIA GPU** is recommended if you want to run GPU-enabled models.

---

## 🚀 Getting Started

### 1 - Download the repository

```bash
sudo apt update && sudo apt install -y git && sudo apt autoremove -y
git clone https://github.com/Delovoa/docker-ai-lab
```

## 2 - Run the setup script(s)

To install docker:

```bash
cd docker-ai-lab/script/setup
bash install_docker.sh
```

If you have an NVIDIA GPU:

```bash
bash install_nvidia_container_toolkit.sh
```

## 3 - Install pre-configured containers (optional)

```bash
cd ../update
bash [install-script-name].sh
```

Each script automatically download and deploy the appropriate container with sane defaults.  You can also use these scripts to update the containers.

## 💡 Tips & Recommendations

If you are unsure where to begin...

- Portainer provides a nice GUI for Docker:

```bash
bash update_portainer.sh
```

- Ollama and Open WebUI provide a ChatGPT equivalent:

```bash
bash update_ollama.sh
bash update_open-webui.sh
```
