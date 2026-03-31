# COBOL Learning Repository

This repository contains a collection of **COBOL programs and mini systems** created to practice and demonstrate fundamental COBOL programming concepts such as arithmetic operations, file handling, record structures, copybooks, and sequential file processing

The programs simulate small **business-oriented applications** similar to those used in enterprise and legacy systems.

---

# Repository Structure

```
COBOL
│
├── basics
│   ├── arithmetic-operators.cob
│   ├── cobol-banking-system.cob
│   ├── cobol-salary-calculator.cob
│   └── cobol-student-marks-system.cob
│
├── bank-account
│   ├── main.cob
│   ├── accounts.dat
│   ├── temp.dat
│   └── README.md
│
├── customer
│   ├── customer.cob
│   ├── CUSTOMER.cpy
│   ├── customers.dat
│   └── README.md
│
├── student
│   ├── main.cob
│   ├── students.dat
│   ├── temp.dat
│   └── README.md
│
└── README.md
```

---

# Programs Included

### Basic COBOL Programs

Located in the **basics** folder.

**Arithmetic Operators**

* Demonstrates basic COBOL arithmetic verbs such as `ADD`, `SUBTRACT`, `MULTIPLY`, and `DIVIDE`.

**Salary Calculator**

* Calculates employee salary using basic salary, allowances, and deductions.

**Student Marks System**

* Processes student marks and calculates totals and averages.

**Basic Banking Simulation**

* Demonstrates simple banking operations using COBOL variables and control structures.

---

# Mini Systems

### Bank Account Management System

A menu-driven COBOL program that simulates basic banking operations such as:

* Account creation
* Deposits
* Withdrawals
* Account listing

Uses **sequential file handling** to store account data.

---

### Customer Management System

A file-based system that allows:

* Adding new customers
* Displaying customer records
* Searching customer information

Demonstrates **copybooks, record structures, and sequential file processing**.

---

### Student Record Management System

A simple COBOL program that manages student records including:

* Student ID
* Name
* Age
* Marks

Uses **sequential files** to store and retrieve student data.

---

# COBOL Concepts Demonstrated

This repository demonstrates:

* COBOL program structure
* `IDENTIFICATION`, `DATA`, and `PROCEDURE` divisions
* Variables and `PIC` clause
* Arithmetic operations
* Control flow (`IF`, `EVALUATE`, `PERFORM`)
* File handling (`OPEN`, `READ`, `WRITE`, `CLOSE`)
* Sequential file processing
* Copybooks
* Record structures
* Menu-driven programs

---

# How to Compile

Make sure **GnuCOBOL** is installed.

Compile a program:

```
cobc -x program.cob
```

Example:

```
cobc -x arithmetic-operators.cob
```

---

# How to Run

Linux / Mac

```
./program
```

Windows

```
program.exe
```

---

# Author

Arun Kumar

GitHub: https://github.com/JustArunn
LinkedIn: https://linkedin.com/in/just-arunn
