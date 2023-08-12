import requests

api_url = 'http://127.0.0.1:8000/diarization/asr'


def diarize(file):
    resp = requests.post(api_url, files={"audio_file": file})
    return resp.json()