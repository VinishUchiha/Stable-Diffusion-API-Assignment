from fastapi import FastAPI
from bark import generate_audio, preload_models

app = FastAPI()

# download and load all models
preload_models()

# generate audio from text
@app.get('/generate')
def bark_generate(prompt: str):
    audio_array = generate_audio(prompt)
    return {"response" : audio_array.tolist()}