-- Create a stored procedure AddBonus that adds a new correction for a student.
-- If the project name does not exist, it creates it.
DELIMITER //

CREATE PROCEDURE AddBonus(
    IN user_id INT,
    IN project_name VARCHAR(255),
    IN score INT
)
BEGIN
    DECLARE project_id INT;

    -- Look for the project_id associated with the project_name
    SELECT id INTO project_id
    FROM projects
    WHERE name = project_name;

    -- If the project doesn't exist (project_id is NULL), create it
    IF project_id IS NULL THEN
        INSERT INTO projects (name) VALUES (project_name);
        SET project_id = LAST_INSERT_ID();
    END IF;

    -- Insert the new correction
    INSERT INTO corrections (user_id, project_id, score)
    VALUES (user_id, project_id, score);
END //

DELIMITER ;
