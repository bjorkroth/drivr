import express from "express";
require('dotenv').config({path: "./"})
import { usersRouter } from "./routes/users.router";
import { missionsRouter } from "./routes/missions.router";
const cors = require("cors");

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());

app.use("/users", usersRouter);
app.use("/missions", missionsRouter)

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});