data <- readRDS("data/survey/survey.rds")

library(openai)

data$question_french <- NA

for (i in 1:nrow(data)) {

system <- "You are a helpful translator" # Donne un role au modèle. Doit être clair et concis

prompt <- paste0("Please translate the following survey question from english to french. Output only the translated question and nothing else. Here is the question: ", data$question[i])# Le prompt

chat_prompt <- openai::create_chat_completion(
        model = "gpt-3.5-turbo-0125",
        messages = list(
            list("role" = "system",
                 "content" = system
            ),
            list(
                "role" = "user",
                "content" = prompt)
            )
    )

output <- chat_prompt$choices$message.content

data$question_french[i] <- output

print(paste0("Pour la ligne ", i , ", La question en anglais: ", data$question[i], ". La question en français: ", output))

Sys.sleep(5)

}
