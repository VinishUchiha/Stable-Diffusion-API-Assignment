# Pull the Pytorch 2.0.1 image as base image
FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime

# Set working directory
WORKDIR /code

# Copy all the code to the working directory
COPY . /code/

# Install git
RUN apt-get update && apt-get install -y git

# Install requirements.txt (Not Needed, We are not going to use svdiff-pytorch for the endpoint)
RUN pip install -r requirements.txt

# Install bark
RUN pip install git+https://github.com/suno-ai/bark.git

# Expose port 8000
EXPOSE 8000

# Set the env variable to use the small model, large model requires more memory. if you have more VRAM, then ignore
ENV SUNO_USE_SMALL_MODELS=True

# Download the model when building the image, it saves time when running the image
RUN python3 -c "from bark import preload_models;preload_models()"

# Run the unicorn server
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
