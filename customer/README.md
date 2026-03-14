# Customer Management System (COBOL)

A simple **menu-driven Customer Management System** built using **COBOL** to demonstrate core COBOL programming concepts such as file handling, records, copybooks, and sequential file processing.

This project simulates a basic customer database where users can add, display, and search customer records stored in a sequential data file.

---

## Features

* Add new customer records
* Display all customers
* Search customer by ID
* Sequential file handling
* Copybook usage
* Menu-driven program

---

## Technologies Used

* **COBOL (GnuCOBOL)**
* **Sequential File Handling**
* **Copybooks**
* **VS Code**
* **Linux / Windows Terminal**

---

## Project Structure

```
customer-management-system
│
├── customer.cob        # Main COBOL program
├── customer.cpy        # Copybook defining customer record structure
├── customers.dat       # Data file storing customer records
└── README.md
```

---

## Customer Record Structure

The customer record is defined in the copybook.

Fields:

* Customer ID
* Customer Name
* Customer Age

Example record format:

```
01 CUSTOMER-RECORD.
   05 CUST-ID     PIC 9(5).
   05 CUST-NAME   PIC A(20).
   05 CUST-AGE    PIC 9(2).
```

---

## How to Compile

Make sure **GnuCOBOL** is installed.

Compile the program:

```
cobc -x customer.cob
```

---

## How to Run

Linux / Mac:

```
./customer
```

Windows:

```
customer.exe
```

---

## Menu Options

```
===== CUSTOMER MANAGEMENT =====
1. Add Customer
2. Display Customers
3. Search Customer
4. Exit
```

---

## Learning Objectives

This project demonstrates:

* COBOL program structure
* `IDENTIFICATION`, `DATA`, and `PROCEDURE` divisions
* File handling (`OPEN`, `READ`, `WRITE`, `CLOSE`)
* Sequential file processing
* Use of **copybooks**
* Record and variable declarations
* Control structures (`PERFORM`, `EVALUATE`, `IF`)

---

## Author

Arun Kumar
GitHub: https://github.com/JustArunn
LinkedIn: https://linkedin.com/in/just-arunn

---
