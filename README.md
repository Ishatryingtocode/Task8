# Task8 : Stored Procedures and Functions

## Objective
Learn how to create reusable SQL blocks by implementing stored procedures and functions to modularize SQL logic.

---

## Tools
- MySQL Workbench

---

## Deliverables
- At least one stored procedure  
- At least one function  

---

## Key Concepts
- Stored Procedures  
- Functions  
- Parameters  
- Conditional Logic  

---

## Description

This task demonstrates creating modular SQL components:

### Stored Procedure: `issue_book_to_member`

- Purpose: To issue a book to a library member.
- Checks if the requested book is available.
- If available, inserts a new loan record and updates the book's status to `'borrowed'`.
- Otherwise, raises an error indicating the book is not available.

### Function: `get_book_count_by_author`

- Purpose: Returns the total number of books written by a specific author.
- Accepts an `author_id` as input.
- Returns the count of books linked to that author.

---

