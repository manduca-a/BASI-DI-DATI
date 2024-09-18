
DELIMITER //

CREATE function trova_sezioni (Grado INT, Numero INT, AnnoScolastico INT) returns decimal
BEGIN
	DECLARE nsezioni INT DEFAULT 0;

	SELECT COUNT(*) into nsezioni
	FROM associata a inner join classe on a.IDClasse = classe.IDClasse inner join scuola on classe.IDScuola = scuola.IDScuola
	WHERE Grado = scuola.Grado AND Numero = classe.Numero AND AnnoScolastico = a.AnnoScolastico;
    
    return nsezioni;
END;

//
DELIMITER ;