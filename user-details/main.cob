       IDENTIFICATION DIVISION.
       PROGRAM-ID. USERDETAILS.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT USER-DETAILS-FILE ASSIGN TO "users.dat"
           ORGANIZATION IS LINE SEQUENTIAL.
       
       DATA DIVISION.
       FILE SECTION.
       FD USER-DETAILS-FILE.
       01 USER-REC.
           05 SERIAL-NO PIC 999.
           05 FILLER PIC X(2).
           05 FIRST-NAME PIC X(10).
           05 FILLER PIC X(2).
           05 LAST-NAME PIC X(10).
           05 FILLER PIC X(2).
           05 EMAIL PIC X(25).
           05 FILLER PIC X(2).
           05 PASSWORD PIC X(20).
       
       WORKING-STORAGE SECTION.
           01 CHOICE PIC 9 VALUE 0.

       PROCEDURE DIVISION.
       
       MAIN-PARA.
           PERFORM UNTIL CHOICE = 2
               DISPLAY "------------------MENU------------------"
               DISPLAY "ENTER 1 TO ADD NEW USER"
               DISPLAY "ENTER 2 FOR EXIT"
               ACCEPT CHOICE

               EVALUATE CHOICE
                   WHEN 1 PERFORM ADD-USER
                   WHEN 2 DISPLAY "EXITING THE PROGRAM."
               END-EVALUATE

           END-PERFORM.

           STOP RUN.

       ADD-USER.
           OPEN EXTEND USER-DETAILS-FILE.

           MOVE SPACES TO USER-REC.
           
           DISPLAY "ENTER SERIAL NO".
           ACCEPT SERIAL-NO.
           DISPLAY "ENTER YOUR FIRST NAME".
           ACCEPT FIRST-NAME.
           DISPLAY "ENTER YOUR LAST NAME".
           ACCEPT LAST-NAME.
           DISPLAY "ENTER YOUR EMAIL".
           ACCEPT EMAIL.
           DISPLAY "ENTER YOUR PASSWORD".
           ACCEPT PASSWORD.

           WRITE USER-REC.
           CLOSE USER-DETAILS-FILE.
           DISPLAY "USER ADDED SUCCESSFULLY.".
       