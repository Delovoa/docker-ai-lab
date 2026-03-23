# Docker AI Lab

A Docker-based AI lab for experimenting with multiple AI models in isolated environments. Run, test, and compare models without dependency conflicts, system breakage, or messy setups.  Everything is reproducible and easy to clean up.

🚧 **The Problem**

Experimenting with multiple AI models can quickly become painful. Each model often requires different libraries, system dependencies, or even conflicting runtime versions. This can lead to unexpected breakages, where installing one model interferes with another.

Even when a model finally works, reproducing that exact setup later can be difficult. Over time, unmanaged installations can also lead to uncontrolled disk usage and a cluttered system environment.

💡 **The Solution**

Docker AI Lab solves these issues by isolating each AI model inside its own Docker container. Instead of managing fragile system-wide installations, you can simply:
- Run each model in its own isolated environment
- Switch between models without reinstalling or reconfiguring your system
- Cleanly upgrade, rebuild, or remove models when needed
- Reproduce setups exactly, every time
- Keep your host system clean, minimal, and stable

📌 **Summary**

Docker AI Lab provides a controlled, repeatable sandbox for AI experimentation. It is intentionally simple. No new frameworks. No complex tooling. Just Bash scripts and Docker.

---

## ⚠️ Prerequisites

- A fresh installation of [Ubuntu Server](https://ubuntu.com/download/server)
- A supported NVIDIA video card is highly recommended (for GPU-enabled models)

---

## 🚀 Getting Started

**1 - Clone the repository**

```bash
git clone https://github.com/Delovoa/docker-ai-lab ~/docker-ai-lab
```

**2 - Run the setup script(s)**

To install Docker (Required):

```bash
cd ~/docker-ai-lab/script/setup
bash install_docker.sh
```

To enable NVIDIA GPU support (Optional):

```bash
bash install_nvidia_container_toolkit.sh
```

**3 - Install some pre-configured containers (Optional)**

```bash
cd ~/docker-ai-lab/script/update
bash [install-script-name].sh
```

These scripts automatically fetch and deploy commonly used applications as preconfigured Docker containers. These scripts can also be used to update those containers after installation.

## 💡 Tips & Recommendations

If you are unsure where to begin:

Install Portainer (Docker GUI)

```bash
bash update_portainer.sh
```

Install Ollama + Open WebUI (ChatGPT-like setup)

```bash
bash update_ollama.sh
bash update_open-webui.sh
```
