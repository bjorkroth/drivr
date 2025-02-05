import express, { Request, Response } from "express";
import { Missions } from "./missions";
const cors = require("cors");

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
  });

  app.get("/", (req: Request, res: Response) => {
    res.send(Missions);
   });