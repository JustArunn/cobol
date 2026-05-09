# COBOL Learning Repository

This repository contains a collection of **COBOL programs and mini systems** created to practice and demonstrate fundamental COBOL programming concepts such as arithmetic operations, file handling, record structures, copybooks, and sequential/indexed file processing.

The programs simulate small **business-oriented applications** similar to those used in enterprise and legacy systems.

---

## Repository Structure

```text
COBOL
│
├── _basics
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
├── employees
│   ├── main.cob
│   └── employees.dat
│
├── ksds
│   ├── main.cob
│   ├── KSDSUSER.cpy
│   └── ksds-users
│
├── student
│   ├── main.cob
│   ├── students.dat
│   ├── temp.dat
│   └── README.md
│
├── user-details
│   ├── main.cob
│   └── users.dat
│
└── README.md
```

---

## Programs Included

### Basic COBOL Programs

Located in the **_basics** folder.

#### Arithmetic Operators

* Demonstrates basic COBOL arithmetic verbs such as `ADD`, `SUBTRACT`, `MULTIPLY`, and `DIVIDE`.

#### Salary Calculator

* Calculates employee salary using basic salary, allowances, and deductions.

#### Student Marks System

* Processes student marks and calculates totals and averages.

#### Basic Banking Simulation

* Demonstrates simple banking operations using COBOL variables and control structures.

---

## Mini Systems

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

### Employee Management System

A menu-driven COBOL program that manages employee records including:

* Adding new employees
* Searching for an employee
* Showing all employees

Demonstrates **sequential file processing** for employee data storage.

---

### KSDS User Management System

A comprehensive menu-driven COBOL program that demonstrates CRUD operations using Key-Sequenced Data Sets (Indexed Files):

* Adding new users
* Searching for a user
* Printing all users
* Updating a user
* Deleting a user

Demonstrates **Indexed File Organization**, **Dynamic Access Mode**, and **Copybooks**.

---

### Student Record Management System

A simple COBOL program that manages student records including:

* Student ID
* Name
* Age
* Marks

Uses **sequential files** to store and retrieve student data.

---

### User Details System

A basic file-based system to:

* Add new users with serial number, name, email, and password.

Demonstrates **sequential file handling** to store basic user data.

---

## COBOL Concepts Demonstrated

This repository demonstrates:

* COBOL program structure
* `IDENTIFICATION`, `DATA`, and `PROCEDURE` divisions
* Variables and `PIC` clause
* Arithmetic operations
* Control flow (`IF`, `EVALUATE`, `PERFORM`)
* File handling (`OPEN`, `READ`, `WRITE`, `REWRITE`, `DELETE`, `CLOSE`)
* Sequential file processing
* Indexed file processing (KSDS)
* Copybooks
* Record structures
* Menu-driven programs

---

## How to Compile

Make sure **GnuCOBOL** is installed.

Compile a program:

```bash
cobc -x program.cob
```

Example:

```bash
cobc -x _basics/arithmetic-operators.cob
```

---

## How to Run

Linux / Mac

```bash
./program
```

Windows

```bash
program.exe
```

---

## Author

Arun Kumar

GitHub: <https://github.com/JustArunn>
LinkedIn: <https://linkedin.com/in/just-arunn>
