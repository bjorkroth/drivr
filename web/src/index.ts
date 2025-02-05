import express, { Request, Response } from "express";
import { Missions } from "./missions";

const app = express();
const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
  });

  app.get("/", (req: Request, res: Response) => {
    res.send(Missions);
   });