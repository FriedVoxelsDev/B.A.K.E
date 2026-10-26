

#  B.A.K.E. — Inspirational Quotes

An automated typographic quote cycler designed for E-Ink displays. This application cycles 50 curated inspirational gaming-based quotes on random.

## Project Demo
Half - Working - Demo: **[YouTube Video Demo](https://youtu.be/LSil2HtAHSY)**

---

## 🛠 Prerequisites

To run or test this application locally, ensure you have the following packages installed:

*   **Bash** (Terminal environment)
*   **Lua** (Runtime engine)
*   **GTK 3.0** (Windowing toolkit)
*   **LuaGObject** (GObject introspection bindings for Lua)

---

## 💻Local Testing & Execution

1. Clone or navigate into the target workspace directory:
   ```bash
   cd ~/FOLDER_IT_S_IN/B.A.K.E/E-Apps/bake-inspirationalquotes
   ```
2. Grant executable permissions to the control script:
   ```bash
   chmod +x run.sh
   ```
3. Execute the initializer file:
   ```bash
   ./run.sh
   ```

---

##  Hardware Deployment (KUAL Setup)

For deployment directly onto a jailbroken Kindle or alternative E-Reader running **KUAL**:

1. Transfer this application folder layout into your Kindle's device-side storage path:
   ```text
   /extensions/bake-inspirationalquotes/
   ```
2. The folder structure relies on the embedded `config.xml` and `menu.json` files to properly hook into the KUAL subsystem launcher.
