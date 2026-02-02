# ASM-Credential-Validator

A lightweight, low-level authentication module written in **x86 Assembly (16-bit)**. This project demonstrates direct hardware interaction using DOS interrupts, memory segmentation, and string manipulation in the 8086 architecture.

## 🛠 Project Description
A low-level 16-bit authentication system written in x86 Assembly. Features direct hardware interaction via DOS interrupts, memory-segment management, and register-level string validation.

---

## 📸 Preview

### Access Granted
![Access Granted Screenshot](./Screenshots/granted.png)

### Access Denied
![Access Denied Screenshot](./Screenshots/denied.png)

---

## 🚀 Technical Workflow

1. **Segment Setup**: Initializes `DS` and `ES` registers to point to the data segment, enabling string operations.
2. **Keyboard Interrupts**: Uses `INT 21h` (Function `01h`) to capture user keystrokes into a memory buffer.
3. **Validation Engine**: Employs `REPE CMPSB` for an efficient character-by-character comparison between the stored password and user input.
4. **Conditional Branching**: Evaluates the **Zero Flag (ZF)** to jump to the `granted` or `denied` memory labels.

---

## 💻 How to Run

1. Download and install **emu8086** or **DOSBox**.
2. Clone the repository:
   ```bash
   git clone [https://github.com/RazaJavaid2004/ASM-Credential-Validator.git](https://github.com/RazaJavaid2004/ASM-Credential-Validator.git)
   ```


3. Load the `.asm` file into your emulator.
4. Emulate and run the program.

## 📝 Future Improvements

* [ ] **Password Masking**: Implement a routine to display asterisks (`*`) instead of plain text.
* [ ] **Attempt Limiter**: Add a counter to lock out the system after multiple failed attempts.

## 📜 License

This project is licensed under the MIT License.

---
