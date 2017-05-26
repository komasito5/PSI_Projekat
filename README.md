# PSI_Projekat
baza je bazaNova.erwin


Scanbot Apr 22, 2017 4.43 PM.jpg je slika baze sa table


CREATE TRIGGER KoloZavrseno
ON kolo
AFTER UPDATE, INSERT
AS
BEGIN
	DECLARE @CursorTim CURSOR;
    DECLARE @CursorIgrac CURSOR;
    DECLARE @brojKola INTEGER;
    DECLARE @brojIgraca INTEGER;
    DECLARE @brojKorisnika INTEGER;
    DECLARE @ukupanUcinak INTEGER;
    
    SELECT @brojKola = IdKolo
    FROM INSERTED
    
    SET @CursorIgrac = CURSOR FOR
    SELECT IdIgrac
    FROM ucinakigrac    
    WHERE IdKolo = @brojKola
    
    OPEN @CursorIgrac
    FETCH NEXT FROM @CursorIgrac
    INTO @brojIgraca;
    
    WHILE @@FETCH_STATUS = 0
    BEGIN
    	SET @CursorTim = CURSOR FOR
    	SELECT IdKorisnik
    	FROM tim_igrac
    	WHERE IdIgrac = @brojIgraca
    
    	OPEN @CursorTim
    	FETCH NEXT FROM @CursorTim
    	INTO @brojKorisnika;
        
        @ukupanUcinak = 0;
        
    	WHILE @@FETCH_STATUS = 0
   		BEGIN
    		
			FETCH NEXT FROM @CursorTim
    		INTO @brojKorisnika;
        END
    
        FETCH NEXT FROM @CursorIgrac
    	INTO @brojIgraca;
    END
   
   CLOSE @CursorIgrac
   DEALLOCATE @CursorIgrac
END

Napisati triger za kreiranje tima po kreiranju korisnika
