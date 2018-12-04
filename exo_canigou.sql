USE canigou;

-- Question 2

ALTER TABLE marche
ADD difficulte VARCHAR(45);

-- Question 3
ALTER TABLE marche
MODIFY difficulte ENUM('facile', 'moyen', 'difficile', 'competition');

-- Question 4
ALTER TABLE annee 
ADD CONSTRAINT chkAnnee CHECK ( annee > 2000 AND annee < 2020) ;

-- Question 5
INSERT INTO nomTable
VALUES ('tuples1'),
		('tuples2');
/*On doit faire attention à l'ordre d'insertion car l’ordre des 
colonnes doit resté identique sinon certaines valeurs prennent le risque d’être complétée dans la mauvaise colonne*/
