       IDENTIFICATION DIVISION.
       PROGRAM-ID. STUDENTSYS.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT STUDENT-FILE ASSIGN TO "students.dat"
           ORGANIZATION IS LINE SEQUENTIAL.

           SELECT TEMP-FILE ASSIGN TO "temp.dat"
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.

       FILE SECTION.

       FD STUDENT-FILE.
       01 STUDENT-REC.
           05 S-ROLL    PIC 9(5).
           05 S-NAME    PIC A(20).
           05 S-MARKS   PIC 9(3).

       FD TEMP-FILE.
       01 TEMP-REC.
           05 T-ROLL    PIC 9(5).
           05 T-NAME    PIC A(20).
           05 T-MARKS   PIC 9(3).

       WORKING-STORAGE SECTION.

       01 CHOICE            PIC 9 VALUE 0.
       01 SEARCH-ROLL       PIC 9(5).
       01 EOF-FLAG          PIC X VALUE "N".
       01 FOUND-FLAG        PIC X VALUE "N".

       01 TOTAL-MARKS       PIC 9(6) VALUE 0.
       01 STUDENT-COUNT     PIC 9(5) VALUE 0.
       01 AVG-MARKS         PIC 9(3)V9(2).

       PROCEDURE DIVISION.

       MAIN-PARA.
           PERFORM UNTIL CHOICE = 7

               DISPLAY " "
               DISPLAY "===== STUDENT MANAGEMENT SYSTEM ====="
               DISPLAY "1. ADD STUDENT"
               DISPLAY "2. DISPLAY STUDENTS"
               DISPLAY "3. SEARCH STUDENT"
               DISPLAY "4. UPDATE STUDENT"
               DISPLAY "5. DELETE STUDENT"
               DISPLAY "6. GENERATE REPORT"
               DISPLAY "7. EXIT"
               DISPLAY "ENTER CHOICE: "

               ACCEPT CHOICE

               EVALUATE CHOICE
                   WHEN 1 PERFORM ADD-STUDENT
                   WHEN 2 PERFORM DISPLAY-STUDENTS
                   WHEN 3 PERFORM SEARCH-STUDENT
                   WHEN 4 PERFORM UPDATE-STUDENT
                   WHEN 5 PERFORM DELETE-STUDENT
                   WHEN 6 PERFORM REPORT-STUDENTS
                   WHEN 7 DISPLAY "EXITING PROGRAM..."
                   WHEN OTHER DISPLAY "INVALID CHOICE"
               END-EVALUATE

           END-PERFORM

           STOP RUN.

       ADD-STUDENT.
           OPEN EXTEND STUDENT-FILE

           DISPLAY "ENTER ROLL NUMBER: "
           ACCEPT S-ROLL

           DISPLAY "ENTER NAME: "
           ACCEPT S-NAME

           DISPLAY "ENTER MARKS: "
           ACCEPT S-MARKS

           WRITE STUDENT-REC

           CLOSE STUDENT-FILE

           DISPLAY "STUDENT ADDED SUCCESSFULLY".

       DISPLAY-STUDENTS.
           OPEN INPUT STUDENT-FILE

           MOVE "N" TO EOF-FLAG

           PERFORM UNTIL EOF-FLAG = "Y"

               READ STUDENT-FILE
                   AT END
                       MOVE "Y" TO EOF-FLAG
                   NOT AT END
                       DISPLAY "ROLL : " S-ROLL
                       DISPLAY "NAME : " S-NAME
                       DISPLAY "MARKS: " S-MARKS
                       DISPLAY "----------------------"
               END-READ

           END-PERFORM

           CLOSE STUDENT-FILE.

       SEARCH-STUDENT.
           DISPLAY "ENTER ROLL NUMBER TO SEARCH: "
           ACCEPT SEARCH-ROLL

           OPEN INPUT STUDENT-FILE

           MOVE "N" TO EOF-FLAG
           MOVE "N" TO FOUND-FLAG

           PERFORM UNTIL EOF-FLAG = "Y"

               READ STUDENT-FILE
                   AT END
                       MOVE "Y" TO EOF-FLAG
                   NOT AT END
                       IF S-ROLL = SEARCH-ROLL
                           DISPLAY "STUDENT FOUND"
                           DISPLAY "NAME : " S-NAME
                           DISPLAY "MARKS: " S-MARKS
                           MOVE "Y" TO FOUND-FLAG
                           MOVE "Y" TO EOF-FLAG
                       END-IF
               END-READ

           END-PERFORM

           IF FOUND-FLAG = "N"
               DISPLAY "STUDENT NOT FOUND"
           END-IF

           CLOSE STUDENT-FILE.

       UPDATE-STUDENT.
           DISPLAY "ENTER ROLL NUMBER TO UPDATE: "
           ACCEPT SEARCH-ROLL

           OPEN INPUT STUDENT-FILE
           OPEN OUTPUT TEMP-FILE

           MOVE "N" TO EOF-FLAG

           PERFORM UNTIL EOF-FLAG = "Y"

               READ STUDENT-FILE
                   AT END
                       MOVE "Y" TO EOF-FLAG
                   NOT AT END

                       IF S-ROLL = SEARCH-ROLL
                           DISPLAY "ENTER NEW NAME: "
                           ACCEPT S-NAME
                           DISPLAY "ENTER NEW MARKS: "
                           ACCEPT S-MARKS
                       END-IF

                       MOVE S-ROLL  TO T-ROLL
                       MOVE S-NAME  TO T-NAME
                       MOVE S-MARKS TO T-MARKS

                       WRITE TEMP-REC
               END-READ

           END-PERFORM

           CLOSE STUDENT-FILE
           CLOSE TEMP-FILE

           DISPLAY "UPDATE COMPLETED".

       DELETE-STUDENT.
           DISPLAY "ENTER ROLL NUMBER TO DELETE: "
           ACCEPT SEARCH-ROLL

           OPEN INPUT STUDENT-FILE
           OPEN OUTPUT TEMP-FILE

           MOVE "N" TO EOF-FLAG

           PERFORM UNTIL EOF-FLAG = "Y"

               READ STUDENT-FILE
                   AT END
                       MOVE "Y" TO EOF-FLAG
                   NOT AT END
                       IF S-ROLL NOT = SEARCH-ROLL
                           MOVE S-ROLL  TO T-ROLL
                           MOVE S-NAME  TO T-NAME
                           MOVE S-MARKS TO T-MARKS
                           WRITE TEMP-REC
                       END-IF
               END-READ

           END-PERFORM

           CLOSE STUDENT-FILE
           CLOSE TEMP-FILE

           DISPLAY "DELETE COMPLETED".

       REPORT-STUDENTS.
           OPEN INPUT STUDENT-FILE

           MOVE 0 TO TOTAL-MARKS
           MOVE 0 TO STUDENT-COUNT
           MOVE "N" TO EOF-FLAG

           PERFORM UNTIL EOF-FLAG = "Y"

               READ STUDENT-FILE
                   AT END
                       MOVE "Y" TO EOF-FLAG
                   NOT AT END
                       ADD S-MARKS TO TOTAL-MARKS
                       ADD 1 TO STUDENT-COUNT
               END-READ

           END-PERFORM

           IF STUDENT-COUNT > 0
               COMPUTE AVG-MARKS = TOTAL-MARKS / STUDENT-COUNT
               DISPLAY "TOTAL STUDENTS : " STUDENT-COUNT
               DISPLAY "AVERAGE MARKS  : " AVG-MARKS
           ELSE
               DISPLAY "NO STUDENT RECORDS FOUND"
           END-IF

           CLOSE STUDENT-FILE.