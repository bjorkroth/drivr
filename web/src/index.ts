import express, { Request, Response } from "express";
import { fetchMessions } from "./data/fetchMissions";
const cors = require("cors");

const app = express();
const PORT = process.env.PORT || 3000;


app.use(cors());

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

app.get("/", async (req: Request, res: Response) => {
    var missions = await fetchMessions();
    res.send(missions);
});