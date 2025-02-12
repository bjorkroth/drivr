import express, { Request, Response } from "express";
import { fetchMessions, getSingleMission } from "../data/fetchMissions";

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

missionsRouter.get("/:missionId/accomplish", async (req: Request, res: Response) => {
  var missionId = req.params.missionId;
  console.log('accomplish ' + missionId)
  res.send();
});
