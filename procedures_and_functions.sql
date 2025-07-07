-- Stored Procedure: Issue a Book to a Member
-- This stored procedure checks: If the book is available. If so, inserts a new loan record and updates the book status to 'borrowed'.
DELIMITER $$

CREATE PROCEDURE issue_book_to_member (
    IN p_book_id INT,
    IN p_member_id INT,
    IN p_loan_date DATE
)
BEGIN
    DECLARE book_status VARCHAR(20);

    -- Get current status of the book
    SELECT status INTO book_status
    FROM book
    WHERE book_id = p_book_id;

    -- Check if available
    IF book_status = 'available' THEN
        -- Insert loan
        INSERT INTO loan (book_id, member_id, loan_date)
        VALUES (p_book_id, p_member_id, p_loan_date);

        -- Update book status
        UPDATE book
        SET status = 'borrowed'
        WHERE book_id = p_book_id;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Book is not available for loan.';
    END IF;
END$$

DELIMITER ;

CALL issue_book_to_member(1, 3, '2025-07-07');

SELECT * FROM loan
WHERE book_id = 1 AND member_id = 3;

SELECT title, status FROM book
WHERE book_id = 1;

-- Function: Get Total Books by an Author
-- This function returns the number of books written by a specific author using their author_id.

DELIMITER $$

CREATE FUNCTION get_book_count_by_author (
    p_author_id INT
) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE book_count INT;

    SELECT COUNT(*) INTO book_count
    FROM book_author
    WHERE author_id = p_author_id;

    RETURN book_count;
END$$

DELIMITER ;

SELECT get_book_count_by_author(1);  -- Example: Books by J.K. Rowling


