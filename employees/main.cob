       IDENTIFICATION DIVISION.
       PROGRAM-ID. EMPLOYEES.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT EMP-FILE ASSIGN TO "employees.dat"
       ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD EMP-FILE.
       01 EMP-REC.
           05 EMP-ID PIC 999.
           05 FILLER PIC X(2).
           05 EMP-NAME PIC X(10).
           05 FILLER PIC X(2).
           05 EMAIL PIC X(25).
           05 FILLER PIC X(2).
           05 PASSWORD PIC X(15).
           05 FILLER PIC X(2).
           05 SALARY PIC 9(6).
           05 FILLER PIC X(2).
           05 ROLE PIC X(20).

       WORKING-STORAGE SECTION.
           01 CHOICE PIC 9 VALUE 0.
           01 EOF-FLAG PIC X VALUE "N".
           01 REC-FOUND PIC X VALUE "N".
           01 WS-EMP-ID PIC 999.

       PROCEDURE DIVISION.

       MAIN-PARA.
           PERFORM UNTIL CHOICE = 4
               DISPLAY "ENTER 1 TO ADD NEW EMPLOYEE."
               DISPLAY "ENTER 2 TO SEARCH AN EMPLOYEE."
               DISPLAY "ENTER 3 TO SHOW ALL EMPLOYEES."
               DISPLAY "ENTER 4 TO EXIT FROM PROGRAM"

               ACCEPT CHOICE

               EVALUATE CHOICE 
                   WHEN 1 PERFORM ADD-EMP
                   WHEN 2 PERFORM SEARCH-EMP
                   WHEN 3 PERFORM SHOW-ALL-EMPLOYEES
                   WHEN 4 DISPLAY "EXITING THE PROGRAM...."
                   WHEN 5 DISPLAY "EXITING THE PROGRAM...."
               END-EVALUATE

           END-PERFORM.
       STOP RUN.
       
       ADD-EMP.
           OPEN EXTEND EMP-FILE.

           MOVE SPACES TO EMP-REC.

           DISPLAY "ENTER THE EMP-ID".
           ACCEPT EMP-ID.
           DISPLAY "ENTER YOUR EMP-NAME".
           ACCEPT EMP-NAME.
           DISPLAY "ENTER THE EMAIL".
           ACCEPT EMAIL.
           DISPLAY "ENTER YOUR PASSWORD".
           ACCEPT PASSWORD.
           DISPLAY "ENTER THE SALARY".
           ACCEPT SALARY.
           DISPLAY "ENTER YOUR ROLE".
           ACCEPT ROLE.

           WRITE EMP-REC.
           CLOSE EMP-FILE.
           DISPLAY "EMPLOYEE ADDED SUCCESSFULLY.".
       
       SEARCH-EMP.
           DISPLAY "ENTER THE EMP-ID".
           ACCEPT WS-EMP-ID.

           OPEN INPUT EMP-FILE.

           MOVE "N" TO EOF-FLAG.
           MOVE "N" TO REC-FOUND.
           
           PERFORM UNTIL EOF-FLAG = "Y"
               READ EMP-FILE 
                   AT END
                       MOVE "Y" TO EOF-FLAG
                   NOT AT END
                       IF WS-EMP-ID = EMP-ID
                           DISPLAY SPACES
                           DISPLAY EMP-REC
                           DISPLAY SPACES
                           MOVE "Y" TO EOF-FLAG
                           MOVE "Y" TO REC-FOUND
                       END-IF
                END-READ
           END-PERFORM

           IF REC-FOUND = "N"
               DISPLAY "EMPLOYEE NOT FOUND!"
           END-IF

           CLOSE EMP-FILE.
       SHOW-ALL-EMPLOYEES.
           OPEN INPUT EMP-FILE.
           MOVE "N" TO  EOF-FLAG.

           DISPLAY SPACES.

           PERFORM UNTIL EOF-FLAG = "Y"
               READ EMP-FILE
                   AT END 
                       MOVE "Y" TO EOF-FLAG
                   NOT AT END
                       DISPLAY EMP-REC
               END-READ
           END-PERFORM

           DISPLAY SPACES.

           CLOSE EMP-FILE.
