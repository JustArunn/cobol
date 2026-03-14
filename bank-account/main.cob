       IDENTIFICATION DIVISION.
       PROGRAM-ID. BANKSYS.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ACCOUNT-FILE ASSIGN TO "accounts.dat"
           ORGANIZATION IS LINE SEQUENTIAL.

           SELECT TEMP-FILE ASSIGN TO "temp.dat"
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.

       FILE SECTION.

       FD ACCOUNT-FILE.
       01 ACCOUNT-REC.
           05 ACC-NUMBER PIC 9(5).
           05 ACC-NAME   PIC A(20).
           05 BALANCE    PIC 9(6).

       FD TEMP-FILE.
       01 TEMP-REC.
           05 T-ACC-NUMBER PIC 9(5).
           05 T-ACC-NAME   PIC A(20).
           05 T-BALANCE    PIC 9(6).

       WORKING-STORAGE SECTION.

       01 CHOICE        PIC 9 VALUE 0.
       01 SEARCH-ACC    PIC 9(5).
       01 AMOUNT        PIC 9(5).
       01 EOF-FLAG      PIC X VALUE "N".

       PROCEDURE DIVISION.

       MAIN-MENU.
           PERFORM UNTIL CHOICE = 5

               DISPLAY " "
               DISPLAY "===== BANK SYSTEM ====="
               DISPLAY "1. CREATE ACCOUNT"
               DISPLAY "2. DEPOSIT"
               DISPLAY "3. WITHDRAW"
               DISPLAY "4. DISPLAY ACCOUNTS"
               DISPLAY "5. EXIT"

               DISPLAY "ENTER CHOICE:"
               ACCEPT CHOICE

               EVALUATE CHOICE
                   WHEN 1 PERFORM CREATE-ACCOUNT
                   WHEN 2 PERFORM DEPOSIT
                   WHEN 3 PERFORM WITHDRAW
                   WHEN 4 PERFORM DISPLAY-ACCOUNTS
               END-EVALUATE

           END-PERFORM

           STOP RUN.

       CREATE-ACCOUNT.
           OPEN EXTEND ACCOUNT-FILE

           DISPLAY "ACCOUNT NUMBER:"
           ACCEPT ACC-NUMBER

           DISPLAY "ACCOUNT NAME:"
           ACCEPT ACC-NAME

           DISPLAY "INITIAL BALANCE:"
           ACCEPT BALANCE

           WRITE ACCOUNT-REC

           CLOSE ACCOUNT-FILE

           DISPLAY "ACCOUNT CREATED".

       DISPLAY-ACCOUNTS.
           OPEN INPUT ACCOUNT-FILE
           MOVE "N" TO EOF-FLAG

           PERFORM UNTIL EOF-FLAG = "Y"

               READ ACCOUNT-FILE
                   AT END
                       MOVE "Y" TO EOF-FLAG
                   NOT AT END
                       DISPLAY "ACCOUNT: " ACC-NUMBER
                       DISPLAY "NAME   : " ACC-NAME
                       DISPLAY "BALANCE: " BALANCE
                       DISPLAY "----------------"
               END-READ

           END-PERFORM

           CLOSE ACCOUNT-FILE.

       DEPOSIT.
           DISPLAY "ENTER ACCOUNT NUMBER:"
           ACCEPT SEARCH-ACC

           DISPLAY "ENTER AMOUNT:"
           ACCEPT AMOUNT

           OPEN INPUT ACCOUNT-FILE
           OPEN OUTPUT TEMP-FILE

           MOVE "N" TO EOF-FLAG

           PERFORM UNTIL EOF-FLAG = "Y"

               READ ACCOUNT-FILE
                   AT END
                       MOVE "Y" TO EOF-FLAG
                   NOT AT END

                       IF ACC-NUMBER = SEARCH-ACC
                           ADD AMOUNT TO BALANCE
                           DISPLAY "DEPOSIT SUCCESSFUL"
                       END-IF

                       MOVE ACC-NUMBER TO T-ACC-NUMBER
                       MOVE ACC-NAME   TO T-ACC-NAME
                       MOVE BALANCE    TO T-BALANCE

                       WRITE TEMP-REC
               END-READ

           END-PERFORM

           CLOSE ACCOUNT-FILE
           CLOSE TEMP-FILE.

       WITHDRAW.
           DISPLAY "ENTER ACCOUNT NUMBER:"
           ACCEPT SEARCH-ACC

           DISPLAY "ENTER AMOUNT:"
           ACCEPT AMOUNT

           OPEN INPUT ACCOUNT-FILE
           OPEN OUTPUT TEMP-FILE

           MOVE "N" TO EOF-FLAG

           PERFORM UNTIL EOF-FLAG = "Y"

               READ ACCOUNT-FILE
                   AT END
                       MOVE "Y" TO EOF-FLAG
                   NOT AT END

                       IF ACC-NUMBER = SEARCH-ACC
                           IF BALANCE >= AMOUNT
                               SUBTRACT AMOUNT FROM BALANCE
                               DISPLAY "WITHDRAW SUCCESSFUL"
                           ELSE
                               DISPLAY "INSUFFICIENT BALANCE"
                           END-IF
                       END-IF

                       MOVE ACC-NUMBER TO T-ACC-NUMBER
                       MOVE ACC-NAME   TO T-ACC-NAME
                       MOVE BALANCE    TO T-BALANCE

                       WRITE TEMP-REC
               END-READ

           END-PERFORM

           CLOSE ACCOUNT-FILE
           CLOSE TEMP-FILE.