       IDENTIFICATION DIVISION.
       PROGRAM-ID. SALARYCALC.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 EMP-NAME        PIC A(20).
       01 BASIC-SALARY    PIC 9(5).
       01 BONUS           PIC 9(5).
       01 TOTAL-SALARY    PIC 9(6).

       PROCEDURE DIVISION.

           DISPLAY "ENTER EMPLOYEE NAME: ".
           ACCEPT EMP-NAME.

           DISPLAY "ENTER BASIC SALARY: ".
           ACCEPT BASIC-SALARY.

           DISPLAY "ENTER BONUS: ".
           ACCEPT BONUS.

           ADD BASIC-SALARY BONUS
               GIVING TOTAL-SALARY.

           DISPLAY "-----------------------".
           DISPLAY "EMPLOYEE: " EMP-NAME.
           DISPLAY "TOTAL SALARY: " TOTAL-SALARY.
           DISPLAY "-----------------------".

           STOP RUN.