FROM ubuntu:24.04
# Copy uv into the Docker image
COPY --from=ghcr.io/astral-sh/uv:0.13.7 /uv /uvx /usr/local/bin/

# Set the working directory
WORKDIR /workspace

# Set the location of the Python environment
ENV UV_PROJECT_ENVIRONMENT=/opt/venv

# Copy the project configuration files
COPY pyproject.toml uv.lock .python-version ./

# Install Python and the required packages
RUN uv sync --locked
