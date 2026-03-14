# COBOL Bank Account Management System

A simple **Bank Account Management System** developed using **COBOL**.
This project demonstrates basic **file handling, record processing, and banking transaction logic** commonly used in legacy enterprise systems.

## Features

* Create a new bank account
* Deposit money into an account
* Withdraw money from an account
* Display all accounts and balances

## Technologies Used

* **COBOL (GnuCOBOL)**
* Sequential File Processing
* File-based Data Storage

## Project Structure

```
bank-account-system
│
├── main.cob        # COBOL source code
├── accounts.dat    # Account records (created automatically)
├── temp.dat        # Temporary file used during transactions
└── README.md
```

## How It Works

The system stores account information in a **sequential data file (`accounts.dat`)**.

Each account record contains:

* Account Number
* Account Holder Name
* Account Balance

For **deposit and withdrawal operations**, the program reads records from the main file, updates the balance if the account matches, and writes the updated records into a temporary file.

This technique simulates how **batch-style file updates are handled in traditional COBOL systems**.

## Compilation

Make sure **GnuCOBOL** is installed.

Compile the program using:

```
cobc -x main.cob
```

## Running the Program

Linux / Mac:

```
./bank
```

Windows:

```
bank.exe
```

## Example Menu

```
===== BANK SYSTEM =====
1. CREATE ACCOUNT
2. DEPOSIT
3. WITHDRAW
4. DISPLAY ACCOUNTS
5. EXIT
```

## Learning Objectives

This project demonstrates:

* Sequential file handling in COBOL
* Record reading and writing using `READ` and `WRITE`
* File update techniques using temporary files
* Basic banking transaction logic
* Structured COBOL programming

## Author

**Arun Kumar**

* GitHub: https://github.com/JustArunn
* LinkedIn: https://linkedin.com/in/just-arunn
