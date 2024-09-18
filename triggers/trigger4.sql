CREATE DEFINER=`root`@`localhost` TRIGGER `nonpermetto` BEFORE INSERT ON `storicoiscrizioni` FOR EACH ROW BEGIN
	
	IF (SELECT count(*) FROM storicoiscrizioni WHERE AnnoScolastico = new.AnnoScolastico AND IDClasse = new.IDClasse) = (SELECT Capienza FROM aula, associata WHERE associata.IDClasse = new.IDClasse AND aula.ID = associata.IDAula GROUP BY IDAula)
         THEN
			 SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "TROPPI ALUNNI, STAI A CASEDA!";
	end if;
END