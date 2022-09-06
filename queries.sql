-- ---------------------------------------  QUERY CON SELECT

-- 1. Selezionare tutti gli studenti nati nel 1990 (160)
SELECT `name` AS `nome`, `surname` AS `cognome`, `date_of_birth` AS `data_di_nascita` 
FROM `students` 
WHERE YEAR(`date_of_birth`) = 1990;

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT `name` AS `nome_corso`, `cfu` AS `crediti_formativi` 
FROM `courses` 
WHERE `cfu` > 10;

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
SELECT `name` AS `nome`, `surname` AS `cognome`, `date_of_birth` AS `data_di_nascita` 
FROM `students`
WHERE YEAR(`date_of_birth`) < 1992;

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT `name` AS `nome_corso`, `period` AS `semestre`, `year` AS `anno` 
FROM `courses` 
WHERE `period` = 'I semestre' AND `year` = '1';

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
SELECT `id` AS `codice_sessione`, `date` AS `data`, `hour` AS `ora` 
FROM `exams` 
WHERE `date` LIKE '2020-06-20' AND `hour` >= '14:00:00';

-- 6. Selezionare tutti i corsi di laurea magistrale (38)
SELECT `name` AS `corsi_di_laurea_magistrale` 
FROM `degrees` 
WHERE `name` LIKE '%Magistrale%';

-- 7. Da quanti dipartimenti è composta l'università? (12)
SELECT COUNT(*) AS `totale_dipartimenti` 
FROM `departments`;

-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT `name` AS `nome`, `surname` AS `cognome`, `phone` AS `telefono` 
FROM `teachers` 
WHERE `phone` IS NULL;


-- ------------------------------------------ QUERY CON GROUP BY


-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(*) AS `iscritti`, YEAR(`enrolment_date`) AS `anno_iscrizione` 
FROM `students` 
GROUP BY `anno_iscrizione`;

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(*) AS `utenti_edificio`, `office_address` AS `edificio` 
FROM `teachers` 
GROUP BY `office_address`;

-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT ROUND(AVG(`vote`),2) AS `voto_medio`, `exam_id` AS `codice_appello` 
FROM `exam_student` 
GROUP BY `exam_id`;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
