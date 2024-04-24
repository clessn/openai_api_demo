library(openai)

voice_sample_fr <- "data/audio/pee_wee_1962.mp3"

output <- create_transcription(file = voice_sample_fr, model = "whisper-1", language = "fr")

print(output)
