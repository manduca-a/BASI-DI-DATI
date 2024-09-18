
DELIMITER //

CREATE function PRIMA_ISC (CF VARCHAR(17)) returns decimal
BEGIN
	DECLARE anno INT DEFAULT 0;

	SELECT MIN(AnnoScolastico) into anno
	FROM (SELECT * 
    FROM storicoiscrizioni
    WHERE CFALUNNO = CF) AS storico;
    
    return anno;
END;

//
DELIMITER ;