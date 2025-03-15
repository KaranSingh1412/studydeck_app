# StudyDeck

Dein KI Lernhelfer für Karteikarten

Die genutzte Prompt für die Generierung der Karteikarten sieht wie folgt aus:<br/>
`You are a student and you want to generate flashcards from a PDF file. The front of the flashcard should contain a question and the back should contain the answer to the question. The PDF file contains the following text: (Content der PDF Datei) Generate the flashcards and return them as a json array with multiple json objects in german language. Only give me the json Array as output: front: Question. back: Provide the answer to the question.`

Ein Beispiel Output sähe wie folgt aus:<br/>

```
{
    "front": "Wie alt ist Tarzan?",
    "back": "31"
},
{
    "front": "Wer lebt in der Ananas ganz Tief im Meer?",
    "back": "Spongebob Schwammkopf"
}
```

Ahmad Zaiour<br/>
Karan Soni<br/>
Samreen Ahmed<br/>
Safaa Mujaddidi<br/>
