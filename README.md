# Docker AI Lab

Spin up a flexible AI lab in minutes with Docker!  
Easily try, upgrade, and clean up AI models so you can focus on experimentation, not maintenance.

---

## ⚠️ Prerequisites

- These scripts have been designed to run on **Ubuntu Server**.
  There may **not work correctly on other Linux distributions**.
  You can download Ubuntu Server here: [https://ubuntu.com/download/server](https://ubuntu.com/download/server)
- A supported **NVIDIA GPU** is recommended in order to run GPU-enabled models.

---

## 🚀 Getting Started

### 1 - Download the Git repo

```bash
sudo apt update && sudo apt install -y git && sudo apt autoremove -y
git clone https://github.com/Delovoa/docker-ai-lab ~/docker-ai-lab
```

## 2 - Run the setup script(s)

To install Docker:

```bash
cd ~/docker-ai-lab/script/setup
bash install_docker.sh
```

If you have an NVIDIA GPU:

```bash
bash install_nvidia_container_toolkit.sh
```

## 3 - Install any pre-configured containers you wish

```bash
cd ~/docker-ai-lab/script/update
bash [install-script-name].sh
```

Scripts automatically fetch and deploy the appropriate container using predefined defaults. They will also update any existing containers to the latest version.

## 💡 Tips & Recommendations

If you are unsure where to begin...

- Install Portainer to get a helpful Docker GUI:

```bash
bash update_portainer.sh
```

- Install Ollama and Open WebUI to get a ChatGPT equivalent:

```bash
bash update_ollama.sh
bash update_open-webui.sh
```
