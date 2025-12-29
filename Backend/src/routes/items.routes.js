const router = require("express").Router();
const db = require("../db");
const requireAdmin = require("../middleware/auth");

// PUBLIC: user يشوف items
router.get("/", async (req, res) => {
  try {
    const { menu_type } = req.query; // coffee | dessert

    let sql = "SELECT * FROM items WHERE is_available = TRUE ORDER BY id DESC";
    let params = [];

    if (menu_type) {
      sql = "SELECT * FROM items WHERE is_available = TRUE AND menu_type = ? ORDER BY id DESC";
      params = [menu_type];
    }

    const [rows] = await db.query(sql, params);
    res.json(rows);
  } catch (err) {
    res.status(500).json({ message: "DB error", error: err.message });
  }
});

// ADMIN: CREATE
router.post("/", requireAdmin, async (req, res) => {
  try {
    const { menu_type, name, price, image_key, is_available } = req.body;

    if (!menu_type || !name || price === undefined) {
      return res.status(400).json({ message: "menu_type, name, price are required" });
    }

    if (!["coffee", "dessert"].includes(menu_type)) {
      return res.status(400).json({ message: "menu_type must be coffee or dessert" });
    }

    const [result] = await db.query(
      `INSERT INTO items (menu_type, name, price, image_key, is_available)
       VALUES (?, ?, ?, ?, ?)`,
      [menu_type, name, price, image_key ?? null, is_available ?? true]
    );

    const [rows] = await db.query("SELECT * FROM items WHERE id = ?", [result.insertId]);
    res.status(201).json(rows[0]);
  } catch (err) {
    res.status(500).json({ message: "DB error", error: err.message });
  }
});

// ADMIN: UPDATE
router.put("/:id", requireAdmin, async (req, res) => {
  try {
    const id = req.params.id;
    const { menu_type, name, price, image_key, is_available } = req.body;

    const [existing] = await db.query("SELECT * FROM items WHERE id = ?", [id]);
    if (!existing.length) return res.status(404).json({ message: "Item not found" });

    const cur = existing[0];
    const next = {
      menu_type: menu_type ?? cur.menu_type,
      name: name ?? cur.name,
      price: price ?? cur.price,
      image_key: image_key ?? cur.image_key,
      is_available: is_available ?? cur.is_available
    };

    await db.query(
      `UPDATE items
       SET menu_type=?, name=?, price=?, image_key=?, is_available=?
       WHERE id=?`,
      [next.menu_type, next.name, next.price, next.image_key, next.is_available, id]
    );

    const [rows] = await db.query("SELECT * FROM items WHERE id = ?", [id]);
    res.json(rows[0]);
  } catch (err) {
    res.status(500).json({ message: "DB error", error: err.message });
  }
});

// ADMIN: DELETE
router.delete("/:id", requireAdmin, async (req, res) => {
  try {
    const id = req.params.id;

    const [existing] = await db.query("SELECT * FROM items WHERE id = ?", [id]);
    if (!existing.length) return res.status(404).json({ message: "Item not found" });

    await db.query("DELETE FROM items WHERE id = ?", [id]);
    res.json({ message: "Deleted successfully" });
  } catch (err) {
    res.status(500).json({ message: "DB error", error: err.message });
  }
});

module.exports = router;
