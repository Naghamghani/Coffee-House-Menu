const express = require("express");
const cors = require("cors");
require("dotenv").config();

const adminRoutes = require("./routes/admin.routes");
const itemsRoutes = require("./routes/items.routes");

const app = express();

app.use(cors());
app.use(express.json());

app.get("/", (req, res) => res.send("Coffee House API running ✅"));

app.use("/api/admin", adminRoutes);
app.use("/api/items", itemsRoutes);

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`✅ Server running on http://localhost:${PORT}`));
