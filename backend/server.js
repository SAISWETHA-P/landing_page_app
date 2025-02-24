require("dotenv").config();
const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");

const app = express();
app.use(express.json());
app.use(cors());

// MongoDB Connection
mongoose
  .connect(process.env.MONGO_URI, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => console.log("MongoDB Connected"))
  .catch((err) => console.log("Error:", err));

// User Schema
const userSchema = new mongoose.Schema({
  googleId: String,
  name: String,
  email: String,
  profilePic: String,
});

const User = mongoose.model("User", userSchema);

// API to store user data
app.post("/api/auth/google", async (req, res) => {
  const { googleId, name, email, profilePic } = req.body;

  try {
    let user = await User.findOne({ googleId });

    if (!user) {
      user = new User({ googleId, name, email, profilePic });
      await user.save();
    }

    res.json({ message: "User stored successfully", user });
  } catch (error) {
    res.status(500).json({ error: "Internal Server Error" });
  }
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
