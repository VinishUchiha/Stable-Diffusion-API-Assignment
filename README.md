# Stable-Diffusion-API-Assignment

**Task:**

For this assignment, we want you to make a Docker container for a Github repository called "**svdiff-pytorch**". However, there's a catch: you won't be making any ML code. That's right, no fancy models or algorithms. Instead, we want you to use FastAPI to create an API endpoint that receives a prompt as a request and passes it on to the Bark repository for processing. Then, the API should return the result as a response.

## Step 1

The first step is to clone the [svdiff-pytorch](https://github.com/mkshing/svdiff-pytorch) repo.

## Step 2

Write a FastAPI code [main.py](main.py) to create an API endpoint that receives a prompt as a request and passes it on to the Bark repository for processing. Then, the API should return the result as a response.

## Step 3

Create the [Dockerfile](Dockerfile) to containerize the API.
