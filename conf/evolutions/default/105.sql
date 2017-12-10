# --- !Ups


ALTER TABLE `patient_encounters`
  ADD COLUMN `isDeleted` DATETIME NULL DEFAULT NULL AFTER `date_of_diabetes_screen`;
ALTER TABLE `patient_encounters`

  ADD COLUMN `deleted_by_user_id` INT(11) NULL DEFAULT NULL  AFTER `isDeleted`;
ALTER TABLE `patient_encounters`

  ADD COLUMN `reason_encounter_deleted` VARCHAR(255) NULL DEFAULT NULL AFTER `deleted_by_user_id`;

ALTER TABLE `patient_encounters`
ADD CONSTRAINT `fk_deleted_by_user_id_id`
FOREIGN KEY (`DeletedByUserId`)
REFERENCES `users` (`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;


# --- !Downs


ALTER TABLE `patient_encounters`
  DROP COLUMN `isDeleted`;
ALTER TABLE `patient_encounters`
  DROP COLUMN `deleted_by_user_id`;
ALTER TABLE `patient_encounters`
  DROP COLUMN `reason_deleted`;
ALTER TABLE `patient_encounters`
DROP FOREIGN KEY `fk_deleted_by_user_id_id`;

