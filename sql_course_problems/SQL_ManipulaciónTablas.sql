-- Crear una tabla
CREATE TABLE job_applied (
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
);
-- Insertar Registros en una tabla
INSERT INTO job_applied (
            job_id, 
            application_sent_date, 
            custom_resume, 
            resume_file_name, 
            cover_letter_sent, 
            cover_letter_file_name, 
            status)
VALUES (1, '2024-01-15', TRUE, 'resume_software_engineer.pdf', TRUE, 'cover_letter_software_engineer.pdf', 'Applied'),
(2, '2024-02-10', FALSE, 'resume_generic.pdf', FALSE, NULL, 'Applied'),
(3, '2024-03-05', TRUE, 'resume_data_scientist.pdf', TRUE, 'cover_letter_data_scientist.pdf', 'Interview Scheduled'),
(4, '2024-04-20', FALSE, 'resume_generic.pdf', FALSE, NULL, 'Rejected'),
(5, '2024-05-01', TRUE, 'resume_product_manager.pdf', TRUE, 'cover_letter_product_manager.pdf', 'Offer Received');

-- Agregar columnas a una tabla existente
ALTER TABLE job_applied
ADD COLUMN contact VARCHAR(50);

-- Actualizar registros en una tabla
UPDATE job_applied
SET contact = 'John Doe'
WHERE job_id = 1;

update job_applied
SET contact = 'Jane Smith'
WHERE job_id = 2;

update job_applied
SET contact = 'Emily Davis' 
WHERE job_id = 3;

update job_applied
SET contact = 'Michael Brown'
WHERE job_id = 4;  

update job_applied
SET contact = 'Sarah Johnson'
WHERE job_id = 5;

-- Renombrar una columna
ALTER TABLE job_applied
RENAME COLUMN contact TO contact_name;

-- Cambiar el tipo de datos de una columna
ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE TEXT;

-- Eliminar una columna
ALTER TABLE job_applied
DROP COLUMN contact_name;

-- Eliminar una tabla
DROP TABLE job_applied;