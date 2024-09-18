delimiter //
CREATE DEFINER=`root`@`localhost` TRIGGER `numer` BEFORE INSERT ON `storicoiscrizioni` FOR EACH ROW BEGIN
	     
     IF (SELECT count(*) FROM storicoiscrizioni WHERE AnnoScolastico = new.AnnoScolastico)>=25
		 THEN
			UPDATE associata SET numerosa=true WHERE associata.IDClasse = new.IDClasse AND associata.AnnoScolastico = new.AnnoScolastico;
	end if;
END
//