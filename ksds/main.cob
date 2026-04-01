       IDENTIFICATION DIVISION.
       PROGRAM-ID. KSDS.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT KSDS-USERS-FILE ASSIGN TO "ksds-users"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS USER-ID.

       DATA DIVISION.
       FILE SECTION.
       FD KSDS-USERS-FILE.
       COPY KSDSUSER.

       WORKING-STORAGE SECTION.
       77 CHOICE PIC 9 VALUE 0.
       77 SEARCHED-USER-ID PIC 999.
       77 FILE-STATUS PIC X(2).
       77 EOF PIC X VALUE "N".

       PROCEDURE DIVISION.

       MAIN-PARA.
           PERFORM UNTIL CHOICE = 6
               DISPLAY "---------------MENU---------------"
               DISPLAY "ENTER 1 TO ADD NEW USER"
               DISPLAY "ENTER 2 TO SEARCH A USER"
               DISPLAY "ENTER 3 TO PRINT ALL USER"
               DISPLAY "ENTER 4 TO UPDATE A USER"
               DISPLAY "ENTER 5 TO DELETE A USER"
               DISPLAY "ENTER 6 TO EXIT THE PROGRAM"
               
               ACCEPT CHOICE

               EVALUATE CHOICE
                   WHEN 1 PERFORM ADD-USER
                   WHEN 2 PERFORM SEARCH-USER
                   WHEN 3 PERFORM PRINT-ALL-USERS
                   WHEN 4 PERFORM UPDATE-USER
                   WHEN 5 PERFORM DELETE-USER
                   WHEN 6 DISPLAY "EXITING THE PROGRAM...."
               END-EVALUATE
           END-PERFORM.
           STOP RUN.

           ADD-USER.
               OPEN I-O KSDS-USERS-FILE.

               MOVE SPACES TO KSDS-USER-REC.

               DISPLAY "ENTER USER-ID".
               ACCEPT USER-ID.
               
               WRITE KSDS-USER-REC
                   INVALID KEY
                       DISPLAY "USER ALREADY EXISTS WITH THE KEY"
                   NOT INVALID KEY
                   DISPLAY "ENTER USER-NAME"
                       ACCEPT USER-NAME
                       DISPLAY "ENTER USER-EMAIL"
                       ACCEPT USER-EMAIL
                       DISPLAY "ENTER USER-PASSWORD"
                       ACCEPT USER-PASSWORD
                       DISPLAY "USER ADDED SUCCESSFULLY"
               END-WRITE.

               CLOSE KSDS-USERS-FILE.

           SEARCH-USER.
               DISPLAY "ENTER USER ID".
               ACCEPT SEARCHED-USER-ID.

               OPEN INPUT KSDS-USERS-FILE.

               READ KSDS-USERS-FILE
                   INVALID KEY 
                       DISPLAY "USER NOT FOUND!"
                   NOT INVALID KEY 
                       DISPLAY KSDS-USER-REC
               END-READ.

               CLOSE KSDS-USERS-FILE.

           PRINT-ALL-USERS.
               OPEN INPUT KSDS-USERS-FILE.

               PERFORM UNTIL EOF = "Y"
                   READ KSDS-USERS-FILE NEXT RECORD
                       AT END
                           MOVE "Y" TO EOF
                       NOT AT END
                           DISPLAY KSDS-USER-REC
                   END-READ
               END-PERFORM.

               MOVE "N" TO EOF.
               CLOSE KSDS-USERS-FILE.
           
           UPDATE-USER.
               OPEN I-O KSDS-USERS-FILE.

               READ KSDS-USERS-FILE
                   INVALID KEY
                       DISPLAY "USER NOT FOUND!"
                   NOT INVALID KEY
                       DISPLAY "ENTER USER-ID"
                       ACCEPT USER-ID
                       DISPLAY "ENTER USER-NAME"
                       ACCEPT USER-NAME
                       DISPLAY "ENTER USER-EMAIL"
                       ACCEPT USER-EMAIL
                       DISPLAY "ENTER USER-PASSWORD"
                       ACCEPT USER-PASSWORD
                       
                       REWRITE KSDS-USER-REC
                       DISPLAY "USER UPDATED SUCCESSFULLY"
               END-READ.
           
               CLOSE KSDS-USERS-FILE.
           DELETE-USER.
               OPEN I-O KSDS-USERS-FILE.
               
               DISPLAY "ENTER USER ID".
               ACCEPT SEARCHED-USER-ID.

               READ KSDS-USERS-FILE
                   INVALID KEY
                       DISPLAY "USER NOT FOUND!"
                   NOT INVALID KEY
                       DELETE KSDS-USERS-FILE
                       DISPLAY "USER DELETED SUCCESSFULLY"
               END-READ.
               CLOSE KSDS-USERS-FILE.

