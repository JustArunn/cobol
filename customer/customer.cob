       IDENTIFICATION DIVISION.
       PROGRAM-ID. CUSTOMERMGMT.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CUSTOMER-FILE ASSIGN TO "customers.dat"
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.

       FILE SECTION.

       FD CUSTOMER-FILE.
       COPY CUSTOMER.

       WORKING-STORAGE SECTION.

       01 CHOICE PIC 9 VALUE 0.
       01 EOF-FLAG PIC X VALUE "N".
       01 SEARCH-ID PIC 9(5).

       PROCEDURE DIVISION.

       MAIN-MENU.
           PERFORM UNTIL CHOICE = 4

               DISPLAY " "
               DISPLAY "===== CUSTOMER MANAGEMENT ====="
               DISPLAY "1. ADD CUSTOMER"
               DISPLAY "2. DISPLAY CUSTOMERS"
               DISPLAY "3. SEARCH CUSTOMER"
               DISPLAY "4. EXIT"

               DISPLAY "ENTER CHOICE:"
               ACCEPT CHOICE

               EVALUATE CHOICE
                   WHEN 1 PERFORM ADD-CUSTOMER
                   WHEN 2 PERFORM DISPLAY-CUSTOMERS
                   WHEN 3 PERFORM SEARCH-CUSTOMER
               END-EVALUATE

           END-PERFORM

           STOP RUN.

       ADD-CUSTOMER.
           OPEN EXTEND CUSTOMER-FILE

           DISPLAY "ENTER CUSTOMER ID:"
           ACCEPT CUST-ID

           DISPLAY "ENTER CUSTOMER NAME:"
           ACCEPT CUST-NAME

           DISPLAY "ENTER CUSTOMER AGE:"
           ACCEPT CUST-AGE

           WRITE CUSTOMER-RECORD

           CLOSE CUSTOMER-FILE

           DISPLAY "CUSTOMER ADDED".

       DISPLAY-CUSTOMERS.
           OPEN INPUT CUSTOMER-FILE
           MOVE "N" TO EOF-FLAG

           PERFORM UNTIL EOF-FLAG = "Y"

               READ CUSTOMER-FILE
                   AT END
                       MOVE "Y" TO EOF-FLAG
                   NOT AT END
                       DISPLAY "ID   : " CUST-ID
                       DISPLAY "NAME : " CUST-NAME
                       DISPLAY "AGE  : " CUST-AGE
                       DISPLAY "-------------------"
               END-READ

           END-PERFORM

           CLOSE CUSTOMER-FILE.

       SEARCH-CUSTOMER.
           DISPLAY "ENTER CUSTOMER ID:"
           ACCEPT SEARCH-ID

           OPEN INPUT CUSTOMER-FILE
           MOVE "N" TO EOF-FLAG

           PERFORM UNTIL EOF-FLAG = "Y"

               READ CUSTOMER-FILE
                   AT END
                       MOVE "Y" TO EOF-FLAG
                       DISPLAY "CUSTOMER NOT FOUND"
                   NOT AT END
                       IF CUST-ID = SEARCH-ID
                           DISPLAY "CUSTOMER FOUND"
                           DISPLAY "NAME: " CUST-NAME
                           DISPLAY "AGE : " CUST-AGE
                           MOVE "Y" TO EOF-FLAG
                       END-IF
               END-READ

           END-PERFORM

           CLOSE CUSTOMER-FILE.