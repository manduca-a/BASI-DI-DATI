delimiter //
CREATE DEFINER=`root`@`localhost` TRIGGER `nonumer` BEFORE DELETE ON `storicoiscrizioni` FOR EACH ROW BEGIN
	DECLARE conta int;
    SELECT count(*) INTO conta FROM storicoiscrizioni WHERE AnnoScolastico = old.AnnoScolastico;
    
     IF conta<=25
		 THEN
			 UPDATE associata SET numerosa = FALSE WHERE associata.IDClasse = old.IDClasse AND associata.AnnoScolastico = old.AnnoScolastico;
	end if;
END
//