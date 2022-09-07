-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `degrees`.`id` AS `Codice laurea in economia`, `students`.`name` AS `Nome`, `students`.`surname` AS `Cognome` 
FROM `degrees` 
JOIN `students` 
ON `degrees`.`id` = `students`.`degree_id` 
WHERE `degrees`.`id` = 53;

SELECT `degrees`.`name` AS `Corso di Laurea`, `students`.`name` AS `Nome`, `students`.`surname` AS `Cognome` 
FROM `degrees` 
JOIN `students` 
ON `degrees`.`id` = `students`.`degree_id` 
WHERE `degrees`.`name` LIKE 'Corso di Laurea in Economia';

-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT `departments`.`name` AS `Nome Dipartimento`, `degrees`.`name` AS `Corso di Laurea` 
FROM `departments` 
JOIN `degrees` 
ON `departments`.`id` = `degrees`.`department_id` 
WHERE `departments`.`name` LIKE 'Dipartimento di Neuroscienze';

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT `teachers`.`id` AS `Codice docente`, `teachers`.`name` AS `Nome`, `teachers`.`surname` AS `Cognome`, `courses`.`name` AS `Materia insegnata` 
FROM `courses` 
JOIN `course_teacher` 
ON `courses`.`id` = `course_teacher`.`course_id` 
JOIN `teachers` 
ON `course_teacher`.`teacher_id` = `teachers`.`id` 
WHERE `course_teacher`.`teacher_id` = 44;

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
 SELECT `students`.`surname` AS `Cognome`, `students`.`name` as `Nome`, `degrees`.`name` AS `Corso di Laurea`, `departments`.`name` AS `Dipartimento` 
 FROM `departments` 
 JOIN `degrees` 
 ON `departments`.`id` = `degrees`.`department_id` 
 JOIN `students` 
 ON `degrees`.`id` = `students`.`degree_id` 
 ORDER BY `students`.`surname` ASC, `students`.`name` ASC;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `degrees`.`id` AS `Cod. Corso`, `degrees`.`name` AS `Titolo`, `courses`.`id` AS `Cod. Materia`, `courses`.`name` AS `Nome`, `teachers`.`surname` AS `Cognome docente`, `teachers`.`name` AS `Nome docente` 
FROM `degrees` 
JOIN `courses` 
ON `degrees`.`id` = `courses`.`degree_id` 
JOIN `course_teacher` 
ON `courses`.`id`=`course_teacher`.`course_id` 
JOIN `teachers` 
ON `course_teacher`.`teacher_id` = `teachers`.`id` 
ORDER BY `degrees`.`id`, `courses`.`id`;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)


-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami

