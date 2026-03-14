# COBOL Student Record Management System

A simple **Student Record Management System** written in **COBOL**.
This project demonstrates basic **file handling, sequential record processing, and business logic implementation** commonly used in legacy enterprise systems.

## Features

* Add new student records
* Display all students
* Search student by roll number
* Update student information
* Delete student records
* Generate report (total students and average marks)

## Technologies Used

* **COBOL (GnuCOBOL)**
* Sequential File Processing
* Batch-style Data Processing

## Project Structure

```
student-record-system
│
├── main.cob        # COBOL source code
├── students.dat    # Data file created during execution
├── temp.dat        # Temporary file used for update/delete operations
└── README.md
```

## How It Works

The system stores student data in a **sequential file (`students.dat`)**.
Each record contains:

* Roll Number
* Student Name
* Marks

For **update and delete operations**, the program reads records from the main file and writes updated records into a temporary file.

## Compilation

Make sure **GnuCOBOL** is installed.

Compile the program:

```
cobc -x main.cob
```

## Run the Program

Linux / Mac:

```
./main
```

Windows:

```
main.exe
```

## Example Menu

```
===== STUDENT MANAGEMENT SYSTEM =====
1. Add Student
2. Display Students
3. Search Student
4. Update Student
5. Delete Student
6. Generate Report
7. Exit
```

## Learning Objectives

This project demonstrates:

* Sequential file handling in COBOL
* Record processing using `READ` and `WRITE`
* File updates using temporary files
* Business rule implementation
* Report generation

## Author

**Arun Kumar**

* GitHub: https://github.com/JustArunn
* LinkedIn: https://linkedin.com/in/just-arunn
