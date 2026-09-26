# NVIDIA CUDA runtime image for Runpod GPU exercises.
# PyTorch's Linux wheels bring their matching CUDA user-space libraries; the host
# Runpod driver is provided by the GPU runtime. Pin this image tag for reproducible builds.
FROM nvidia/cuda:13.0.2-cudnn-runtime-ubuntu24.04

ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    UV_PROJECT_ENVIRONMENT=/opt/venv \
    PATH="/opt/venv/bin:/root/.local/bin:${PATH}"

RUN apt-get update && apt-get install -y --no-install-recommends \
      ca-certificates \
      curl \
      python3.12 \
      python3.12-venv \
    && rm -rf /var/lib/apt/lists/* \
    && curl -LsSf https://astral.sh/uv/install.sh | sh

WORKDIR /workspace

# Install the exact dependencies resolved in uv.lock, including CUDA-enabled
# PyTorch wheels selected for Linux by the lockfile.
COPY pyproject.toml uv.lock README.md ./
COPY src/ ./src/
RUN uv sync --locked --no-dev

# Keep data, configs, exercises, and scripts available in the image.
COPY configs/ ./configs/
COPY datasets/ ./datasets/
COPY experiments/ ./experiments/
COPY environments/ ./environments/
COPY scripts/ ./scripts/

CMD ["python", "-m", "model_gym"]
