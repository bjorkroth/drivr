import express, { Request, Response } from "express";
import { addExperienceById, getUserById, getUserByProfileName, saveNewUser, setUserProgressLevel } from "../data/users.database";
import { getUserEvents } from "../data/events.database";
var bodyParser = require('body-parser')
var jsonParser = bodyParser.json()

export const usersRouter = express.Router();

usersRouter.post("/", jsonParser, async (req: Request, res: Response) => {
    var inputUser = req.body;
    await saveNewUser(inputUser)
    res.status(201).send(inputUser);
});

usersRouter.get("/:userId", async (req: Request, res: Response) => {
    var userId = req.params.userId;
    var userFromDb = await getUserById(userId)
    res.send(userFromDb);
});

usersRouter.get("/profileName/:profileName", async (req: Request, res: Response) => {
    var userId = req.params.profileName;
    var userFromDb = await getUserByProfileName(userId)
    res.send(userFromDb);
});


usersRouter.put("/:userId/experience", jsonParser, async (req: Request, res: Response) => {
    var userId = req.params.userId;
    var experience = req.body.progressExperience;
    var numberOfUpdated = await addExperienceById(userId, experience)

    if (numberOfUpdated === 1) {
        res.status(200).send()
        return
    }

    res.status(400).send()
});

usersRouter.put("/:userId/level", jsonParser, async (req: Request, res: Response) => {
    var userId = req.params.userId;
    var experience = req.body.progressLevel;
    var numberOfUpdated = await setUserProgressLevel(userId, experience)

    if (numberOfUpdated === 1) {
        res.status(200).send()
        return
    }

    res.status(400).send()
});

usersRouter.get("/:userId/events", async (req: Request, res: Response) => {
    var userId = req.params.userId;
    var userFromDb = await getUserEvents(userId)
    res.send(userFromDb);
});