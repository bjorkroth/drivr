interface MissionQuestion{
    questionId:number;
    question:string;
    answer:string;
    alternatives:string[]
}

interface Mission{
    id:number;
    name:string;
    level:number;
    accomplished:boolean;
    description:string;
    experienceEarned:number;
    canBeDoneMultipleTimes:boolean;
    type:string;
    questions: MissionQuestion[];
}

export const Missions : Mission[] = 
    [
        {
          "id": 0,
          "name": "Intro-övning",
          "level": 1,
          "accomplished": false,
          "description": "Vägen till körkort",
          "experienceEarned": 20,
          "canBeDoneMultipleTimes": true,
          "type": "theoretical",
          "questions": [
            {
              "questionId": 0,
              "question": "Vad heter körkortsboken?",
              "answer": "Körkortsboken",
              "alternatives": [
                "Körkortsboken",
                "Körkortsboken - best of",
                "Körkortsboken 2"
              ]
            }
          ]
        },
        {
          "id": 1,
          "name": "Övning 1",
          "level": 1,
          "accomplished": false,
          "description": "Inlärning",
          "experienceEarned": 20,
          "canBeDoneMultipleTimes": true,
          "type": "theoretical",
          "questions": [
            {
              "questionId": 10,
              "question": "Vad heter körkortsboken?",
              "answer": "Körkortsboken",
              "alternatives": [
                "Körkortsboken",
                "Körkortsboken - best of",
                "Körkortsboken 2"
              ]
            }
          ]
        },
        {
          "id": 2,
          "name": "Övning 2",
          "level": 1,
          "accomplished": false,
          "description": "Trafikens grundregler & begrepp",
          "experienceEarned": 25,
          "canBeDoneMultipleTimes": true,
          "type": "theoretical",
          "questions": [
            {
              "questionId": 21,
              "question": "Vad heter körkortsboken?",
              "answer": "Körkortsboken",
              "alternatives": [
                "Körkortsboken",
                "Körkortsboken - best of",
                "Körkortsboken 2"
              ]
            }
          ]
        },
        {
          "id": 3,
          "name": "Övning 3",
          "level": 1,
          "accomplished": false,
          "description": "Väjningsregler & väjningsplikt",
          "experienceEarned": 15,
          "canBeDoneMultipleTimes": true,
          "type": "practical",
          "questions": [
            {
              "questionId": 31,
              "question": "Har bilen på huvudled eller korsande väg väkningsplikt?",
              "answer": "Korsande väg",
              "alternatives": [
                "Huvudleden",
                "Korsande väg"
              ]
            },{
              "questionId": 32,
              "question": "Vilken väjningsregel gäller om det inte är några skyltar?",
              "answer": "Högerregelen",
              "alternatives": [
                "Högerregeln",
                "Den som är är först fram kör först"
              ]
            }
          ]
        },
        {
          "id": 4,
          "name": "Övning 4",
          "level": 1,
          "accomplished": false,
          "description": "Trafiksignaler",
          "experienceEarned": 10,
          "canBeDoneMultipleTimes": true,
          "type": "theoretical",
          "questions": [
            {
              "questionId": 41,
              "question": "Vad gäller om inte trafiksignalen i bruk?",
              "answer": "Högerregeln",
              "alternatives": [
                "Högerregeln",
                "Fri väg",
                "Vänsterregeln"
              ]
            },
            {
              "questionId": 42,
              "question": "Vad gäller över varandra? Trafikljus eller polisens instruktioner?",
              "answer": "Polisen",
              "alternatives": [
                "Trafikljuset",
                "Polisen"
              ]
            }
          ]
        },
        {
          "id": 5,
          "name": "Övning 5",
          "level": 2,
          "accomplished": false,
          "description": "Stanna & parkera",
          "experienceEarned": 15,
          "canBeDoneMultipleTimes": true,
          "type": "theoretical",
          "questions": [
            {
              "questionId": 51,
              "question": "Hur nära en korsning får du parkera?",
              "answer": "10 meter",
              "alternatives": [
                "Hur nära du vill",
                "5 meter",
                "10 meter"
              ]
            },
            {
              "questionId": 52,
              "question": "Vad betyder förbudsmärket med enbart ett rött streck tvärs över?",
              "answer": "Parkeringsförbud",
              "alternatives": [
                "Parkeringsförbud",
                "Högertrafik",
                "Stoppförbud"
              ]
            },
            {
              "questionId": 53,
              "question": "Vad betyder förbudsmärket med enbart ett rött kors över?",
              "answer": "Stoppförbud",
              "alternatives": [
                "Parkeringsförbud",
                "Högertrafik",
                "Stoppförbud"
              ]
            }
          ]
        },
        {
          "id": 6,
          "name": "Övning 6",
          "level": 2,
          "accomplished": false,
          "description": "Övergångsställe",
          "experienceEarned": 10,
          "canBeDoneMultipleTimes": true,
          "type": "theoretical",
          "questions": [
            {
              "questionId": 61,
              "question": "Vad heter körkortsboken?",
              "answer": "Körkortsboken",
              "alternatives": [
                "Körkortsboken",
                "Körkortsboken - best of",
                "Körkortsboken 2"
              ]
            }
          ]
        },
        {
          "id": 7,
          "name": "Övning 7",
          "level": 2,
          "accomplished": false,
          "description": "Cykelöverfart & cykelbana",
          "experienceEarned": 10,
          "canBeDoneMultipleTimes": true,
          "type": "theoretical",
          "questions": [
            {
              "questionId": 71,
              "question": "Vad heter körkortsboken?",
              "answer": "Körkortsboken",
              "alternatives": [
                "Körkortsboken",
                "Körkortsboken - best of",
                "Körkortsboken 2"
              ]
            }
          ]
        },
        {
          "id": 8,
          "name": "Övning 8",
          "level": 2,
          "accomplished": false,
          "description": "Cirkulationsplats & placering vid sväng",
          "experienceEarned": 20,
          "canBeDoneMultipleTimes": true,
          "type": "theoretical",
          "questions": [
            {
              "questionId": 81,
              "question": "Vad heter körkortsboken?",
              "answer": "Körkortsboken",
              "alternatives": [
                "Körkortsboken",
                "Körkortsboken - best of",
                "Körkortsboken 2"
              ]
            }
          ]
        },
        {
          "id": 9,
          "name": "Övning 9",
          "level": 2,
          "accomplished": false,
          "description": "Motorväg och motortrafikled",
          "experienceEarned": 20,
          "canBeDoneMultipleTimes": true,
          "type": "theoretical",
          "questions": [
            {
              "questionId": 91,
              "question": "Vad heter körkortsboken?",
              "answer": "Körkortsboken",
              "alternatives": [
                "Körkortsboken",
                "Körkortsboken - best of",
                "Körkortsboken 2"
              ]
            }
          ]
        },
        {
          "id": 10,
          "name": "Övning 10",
          "level": 2,
          "accomplished": false,
          "description": "Landsväg",
          "experienceEarned": 20,
          "canBeDoneMultipleTimes": true,
          "type": "practical",
          "questions": [
            {
              "questionId": 101,
              "question": "Vad är standardhastigheten på landsväg om inget anges?",
              "answer": "70 km/h",
              "alternatives": [
                "50 km/h",
                "70 km/h",
                "90 km/h"
              ]
            },
            {
              "questionId": 102,
              "question": "Vad menas med dubbel heldragen mittlinje?",
              "answer": "Omkörningsförbud i båda riktningar",
              "alternatives": [
                "Omkörningsförbud i båda riktningar",
                "Betyder ingenting, är bara en annan väglinje",
                "Dålig vägbana"
              ]
            },
            {
              "questionId": 103,
              "question": "Vad är en vanlig olycksorsak vid vänstersväng på landsväg?",
              "answer": "Omkörningsförbud i båda riktningar",
              "alternatives": [
                "Alternativ 1",
                "Alternativ 2",
                "Bil bakom som kommer som inte uppfattat att man stannat"
              ]
            }
          ]
        },
        {
          "id": 11,
          "name": "Övning 11",
          "level": 2,
          "accomplished": false,
          "description": "Vägarbete",
          "experienceEarned": 20,
          "canBeDoneMultipleTimes": true,
          "type": "theoretical",
          "questions": [
            {
              "questionId": 111,
              "question": "Vad innebär en hastighetsskylt med svart bakgrund?",
              "answer": "Temporär hastighetssänkning",
              "alternatives": [
                "Temporär hastighetssänkning",
                "Alternativ 2",
                "Alternativ 3"
              ]
            }
          ]
        },
        {
          "id": 12,
          "name": "Övning 12",
          "level": 2,
          "accomplished": false,
          "description": "Järnvägskorsning",
          "experienceEarned": 20,
          "canBeDoneMultipleTimes": true,
          "type": "practical",
          "questions": [
            {
              "questionId": 121,
              "question": "Vad ska du göra om du fastnar mellan bommarna?",
              "answer": "Gasa igenom",
              "alternatives": [
                "Ring polisen",
                "Gasa igenom",
                "Lägg upp det på TikTok"
              ]
            },{
              "questionId": 122,
              "question": "Vad betyder det om det är två streck på nedre delen av skylten?",
              "answer": "Gasa igenom",
              "alternatives": [
                "Det är flera spår på järvägen",
                "Det är en trafikerad järnvägskorsning",
                "Det är en sk. säker järnvägskorsning"
              ]
            }
          ]
        }
      ];
    
