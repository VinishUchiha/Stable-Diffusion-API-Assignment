FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime

WORKDIR /code

COPY . /code/

RUN apt-get update && apt-get install -y git

RUN pip install -r requirements.txt

RUN pip install git+https://github.com/suno-ai/bark.git

EXPOSE 8000

ENV SUNO_USE_SMALL_MODELS=True

RUN python3 -c "from bark import preload_models;preload_models()"

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]