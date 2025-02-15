import express, { Request, Response } from "express";
import { fetchMessions, getSingleMission } from "../data/missions.database";
import { getMissionEvents, saveEvent } from "../data/events.database";
import { v6 as uuidv6 } from 'uuid';
var bodyParser = require('body-parser')
var jsonParser = bodyParser.json()

export const missionsRouter = express.Router();

missionsRouter.get("/", async (req: Request, res: Response) => {
  var missions = await fetchMessions();
  res.send(missions);
});

missionsRouter.get("/:missionId", async (req: Request, res: Response) => {
  var missionId = req.params.missionId;
  var mission = await getSingleMission(Number(missionId));
  res.send(mission);
});

missionsRouter.post("/:missionId/accomplish", jsonParser, async (req: Request, res: Response) => {
  var missionId = req.params.missionId;
  var body = req.body;

  if(body.userId === undefined){
    res.status(400).send();
  }
  
  await saveEvent({
    id: uuidv6().toString(),
    type: "Mission",
    dateTime: new Date(Date.now()),
    reference: missionId,
    userId: body.userId,
    isCompleted: true,
    value: ""
  })

  res.status(201).send();
});

missionsRouter.post("/:missionId/question/:questionId/answer", jsonParser, async (req: Request, res: Response) => {
  var missionId = req.params.missionId;
  var questionId = req.params.questionId;
  var answerBody = req.body;

  await saveEvent({
    id: uuidv6().toString(),
    type: "Question",
    dateTime: new Date(Date.now()),
    reference: questionId,
    userId: answerBody.userId,
    isCompleted: answerBody.isCorrect,
    value: answerBody.answer
  })

  res.status(201).send();
});