delimiter //
CREATE DEFINER=`root`@`localhost` TRIGGER `mq` BEFORE UPDATE ON `aula` 
FOR EACH ROW 
BEGIN
	IF new.MQ < MQ AND new.Capienza >= Capienza
		THEN
			SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "ERRORE NEI MQ!";
	end if;
END
//