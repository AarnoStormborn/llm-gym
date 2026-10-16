# Project instructions for coding agents

## Project purpose

LLM Gym (`llm-gym`; sometimes described as `model-gym`) is a personal, hands-on educational project for learning the end-to-end practice of LLM fine-tuning and post-training. Exercises should progressively build understanding of data preparation, training objectives, optimization, reward design, reinforcement learning, and rigorous evaluation—not merely produce a leaderboard result.

## User's working preferences and boundaries

- **Do not write or modify application, training, evaluation, data-processing, or helper code unless the user explicitly asks for code.** This includes shared data loaders, runners, benchmark adapters, reward functions, environments, and tests. The user wants to implement these by hand as part of the learning process.
- Work on infrastructure, dependency, repository, and agent configuration only when the user explicitly requests that work. Do not infer permission to change project structure or install packages from a research or discussion request.
- Never push to GitHub unless the user explicitly authorizes a push. Regular local commits are encouraged.
- Do not create cloud resources, incur GPU/storage charges, upload datasets or model artifacts, or change Runpod account resources without explicit authorization.
- Prefer small, open-weight models and experiments feasible on a personal machine or modest rented GPU. State when a proposed method is unlikely to be educationally or practically feasible at that scale.

## Documentation format

- Keep documentation under `docs/` unless an existing project convention calls for another location.
- Research deliverables requested by the user belong in `docs/research/` and must be self-contained HTML: concise, interactive where useful, with expandable `<details>` sections for supporting depth.
- All other documentation should be Markdown (`.md`). Do not create research deliverables as Markdown unless the user explicitly requests that format.
- Research files should remain readable without a build step and should use semantic HTML, accessible controls, and source links/citations.

## Research and project planning

When asked to research or propose exercises:

- Frame each idea as a learning exercise: state the concept it teaches, why it belongs at that stage, and a concrete observable outcome.
- Organize ideas as a progression from simpler baselines and supervised fine-tuning toward parameter-efficient tuning, preference optimization, reward-based tuning, and more involved RL (including GRPO/RLVR where suitable). Do not force every algorithm into the plan if the task or compute budget does not justify it.
- Propose datasets that are legally and practically accessible, sufficiently documented, and neither overused nor so obscure that setup becomes the project. Consider lightweight synthetic-data generation when it is transparent, reproducible, inexpensive, and useful for the learning objective.
- For every proposed task, identify an appropriate benchmark or evaluation protocol. Distinguish public benchmark data from training data; avoid train/test contamination; prefer held-out splits, private/generated test cases, or reproducible task-specific tests where appropriate.
- Cover behavior and capability changes, not only training loss. Include a base-model baseline and suitable post-training comparisons (for example, SFT vs. preference optimization vs. reward-based/RL approaches when the task supports a fair comparison).
- Report relevant resource needs, likely limitations, data/model licensing considerations, and evaluation caveats. Clearly distinguish verified facts from recommendations.
- Use reliable, current sources for research. Provide links/citations for dataset availability, licenses, benchmark definitions, and relevant model/framework claims; do not invent citations or imply a benchmark measures more than it does.
- Keep planning artifacts separate from runnable code unless the user asks to implement them.

## Evaluation principles

- Establish a baseline before training and preserve the exact model, tokenizer, data split, and evaluation configuration for comparisons.
- Use task-appropriate metrics and report more than one metric when a single score could hide important failure modes (for example, exact-match plus schema validity for structured extraction; success rate, attempts, and invalid actions for games/tool use).
- Include qualitative examples and error analysis alongside aggregate scores.
- Track seeds, data provenance, configuration, package/model versions, hardware, training time, and relevant cost so results can be interpreted and reproduced.
- Keep evaluation data isolated from training and tuning. Record contamination risks and limitations, especially when using popular public benchmarks.
- Treat results as educational evidence, not proof of general capability improvement.

## Repository and environment conventions

- Repository root is `llm-gym`. The existing layout and `README.md` are the first references for current structure; propose structural changes before making them unless explicitly instructed.
- `pyproject.toml` and `uv.lock` are the authoritative Python dependency configuration. `requirements.txt` is generated from them; do not edit it independently. When explicitly changing dependencies, regenerate it with `scripts/export-requirements.sh` and keep the lockfile consistent.
- Respect the existing Python 3.12 environment and distinguish local Apple Silicon/MPS support from CUDA-only Runpod/container workflows.
- Keep large model weights, generated datasets, checkpoints, and run outputs out of Git unless the user explicitly requests otherwise. Follow `.gitignore` and prefer documenting provenance and regeneration steps over committing bulky artifacts.
- Avoid running Docker builds, training jobs, benchmark suites, or other expensive/long-running workloads unless the user explicitly requests them. Never provision a Runpod resource without explicit permission.

## Change and communication discipline

- For a request limited to discussion or research, do not modify files.
- For an explicitly requested file/configuration change, make the smallest relevant change and report exactly what changed and what was verified.
- Ask before resolving material ambiguities about scope, datasets, licenses, compute, dependency strategy, or repository layout.
- Be concise, educational, and explicit about uncertainty, tradeoffs, and any work left for the user.
