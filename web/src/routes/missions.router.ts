import express, { Request, Response } from "express";
import { fetchMessions, getSingleMission, updateMissionExercise } from "../data/missions.database";
import { getExerciseEvents, getMissionEvents, getQuestionEvents, saveEvent } from "../data/events.database";
import { v6 as uuidv6 } from 'uuid';
import MissionExercise from "../models/MissionExercise";
var bodyParser = require('body-parser')
var jsonParser = bodyParser.json()

export const missionsRouter = express.Router();

missionsRouter.get("/", async (req: Request, res: Response) => {
  var missions = await fetchMessions();
  res.send(missions);
});

missionsRouter.get("/:missionId/user/:userId", async (req: Request, res: Response) => {
  var missionId = req.params.missionId;
  var userId = req.params.userId;

  var mission = await getSingleMission(Number(missionId));
  var missionEvents = await getMissionEvents(missionId, userId);
  var missionIsAccomplished = missionEvents.find((event) => event.isCompleted)?.isCompleted ?? false;
  mission.accomplished = missionIsAccomplished;

  for (let i = 0; i < mission.questions.length; i++) {
    const element = mission.questions[i];
    var answersToQuestion = await getQuestionEvents(element.questionId.toString(), userId);
    element.isAnswered = answersToQuestion.length > 0;
  }

  for (let i = 0; i < mission.exercises.length; i++) {
    const element = mission.exercises[i];
    var exerciseIsDone = await getExerciseEvents(element.exerciseId.toString(), userId);
    element.isDone = exerciseIsDone.length > 0;
  }

  res.send(mission);
});


missionsRouter.put("/exercises", jsonParser, async (req: Request, res: Response) => {
  var reqBody : MissionExercise = req.body;

  await updateMissionExercise(reqBody);

  res.status(201).send();
});

missionsRouter.post("/:missionId/user/:userId/accomplish", jsonParser, async (req: Request, res: Response) => {
  var missionId = req.params.missionId;
  var userId = req.params.userId;

  await saveEvent({
    id: uuidv6().toString(),
    type: "Mission",
    dateTime: new Date(Date.now()),
    reference: missionId,
    userId: userId,
    isCompleted: true,
    value: ""
  })

  res.status(201).send();
});

missionsRouter.post("/:missionId/question/:questionId/user/:userId/answer", jsonParser, async (req: Request, res: Response) => {
  var missionId = req.params.missionId;
  var questionId = req.params.questionId;
  var userId = req.params.userId;
  var answerBody = req.body;

  await saveEvent({
    id: uuidv6().toString(),
    type: "Question",
    dateTime: new Date(Date.now()),
    reference: questionId,
    userId: userId,
    isCompleted: answerBody.isCorrect,
    value: answerBody.answer
  })

  res.status(201).send();
});

missionsRouter.post("/:missionId/exercise/:exerciseId/user/:userId/done", jsonParser, async (req: Request, res: Response) => {
  var missionId = req.params.missionId;
  var userId = req.params.userId;
  var exerciseId = req.params.exerciseId;

  await saveEvent({
    id: uuidv6().toString(),
    type: "Exercise",
    dateTime: new Date(Date.now()),
    reference: exerciseId,
    userId: userId,
    isCompleted: true,
    value: ""
  })

  res.status(201).send();
});