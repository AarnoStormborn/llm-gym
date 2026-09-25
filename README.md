# LLM Gym

Hands-on exercises for learning LLM fine-tuning and post-training, from small supervised tasks to preference optimization and reinforcement learning.

## Environment

This project uses Python 3.12 and [`uv`](https://docs.astral.sh/uv/).

```bash
uv sync
uv run python -c 'import torch; print(torch.__version__, "MPS:", torch.backends.mps.is_available())'
```

On Apple Silicon, PyTorch can use Apple's MPS backend for suitable workloads. Larger model training will typically need a CUDA GPU, such as a Runpod GPU. The local environment is not a CUDA environment.

Launch JupyterLab with:

```bash
uv run jupyter lab
```

## Included toolkit

- **PyTorch** for model training and tensor operations
- **Transformers**, **Datasets**, and **Evaluate** for model and data workflows
- **PEFT** for parameter-efficient fine-tuning such as LoRA
- **TRL** for SFT, preference optimization, and RL algorithms (including DPO and GRPO)
- **Accelerate** for training across available hardware
- JupyterLab, pandas, scikit-learn, matplotlib, and seaborn for exploration and evaluation
- pytest and Ruff for tests and linting

Dependency versions are captured in `uv.lock`. After changing `pyproject.toml`, run `uv lock` and `uv sync`.

## Runpod

Runpod's project-local agent setup is in place:

- Skills are installed under `.agents/skills/` and registered for this repository's agent integrations.
- The hosted Runpod MCP server is configured in the repository-level `.mcp.json`.
- OAuth was completed in the agent runtime, and the connection was verified by listing Pods (the account currently has none).

OAuth credentials are handled by the agent runtime and are not stored in this repository. Other agents may need to reload/reopen the project and complete their own MCP sign-in before using Runpod tools. The official setup guide is <https://docs.runpod.io/agent-setup.md>.
