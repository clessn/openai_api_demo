# Tutoriel OpenAI avec R

Ce repo GitHub est un guide sur comment utiliser l'API d'OpenAI en R.

## Prérequis

Avant de commencer, assurez-vous d'avoir R et RStudio installés sur votre ordinateur.

## Étape 1 : Obtenir la clé API d'OpenAI

Pour utiliser l'API d'OpenAI, vous devez d'abord obtenir une clé API. Voici les étapes pour la créer :

1. Allez sur le site web d'OpenAI : [OpenAI Website](https://www.openai.com/)
2. Créez un compte en suivant les instructions fournies.
3. Ajoutez des fonds à votre compte pour pouvoir utiliser les services d'API.
4. Créez une clé API et sauvegardez-la dans un endroit sûr.

## Étape 2 : Configuration de votre environnement R

Une fois que vous avez votre clé API, la prochaine étape est de configurer votre environnement R pour pouvoir utiliser cette clé.

1. Ouvrez RStudio.
2. Installez les packages nécessaires en exécutant les commandes suivantes dans la console R :

```R
install.packages("openai")
install.packages("usethis")
install.packages("devtools") # Sert à installer des packages depuis GitHub

# Quand les trois packages précédents sont installés vous pouvez installer le package clellm

devtools::install_github("clessn/clellm")
```

3. Configurez votre clé API dans R. 

Utilisez la fonction `usethis::edit_r_environ()` pour ouvrir le fichier .Renviron :

`usethis::edit_r_environ()`

4. Dans le fichier .Renviron qui s'ouvre, ajoutez la ligne suivante pour enregistrer votre clé API :

`OPENAI_API_KEY=votre_cle_api`

Remplacez votre_cle_api par la clé API que vous avez créée auparavant. Sauvegardez et fermez le fichier et redémarrez RStudio pour que les modifications prennent effet.

## Étape 3 : Utiliser l'API

Maintenant que tout est configuré, vous pouvez commencer à utiliser l'API d'OpenAI dans R. La fonction principale que nous utiliserons est create_chat_completion().

Pour voir la liste des modèles disponibles et leurs fonctionnalités: [Liste des modèles](https://platform.openai.com/docs/models)


Pour voir la liste des prix des modèles: [Liste des prix](https://openai.com/pricing)

```R

library(openai)

system <- "You are a helpful assistant" # Donne un role au modèle. Doit être clair et concis

prompt <- "What is the capital of France?" # Le prompt

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

print(output)

```

Ce code vous permettra d'interagir avec l'API pour obtenir des réponses basées sur le modèle GPT-3.5 Turbo.
Conclusion

Ce guide vous a montré comment obtenir une clé API d'OpenAI, configurer votre environnement R et commencer à utiliser l'API pour générer des textes automatisés. Bonne exploration !
