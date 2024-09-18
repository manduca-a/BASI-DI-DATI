CREATE View InsegnateStudente(CF_ins, CF_Stu, AnnoScolastico, cognome_Ins, materia, cognome_Stu, sezione) As
Select Ins.CF, AL.CF, Ing.AnnoScolastico, Ins.cognome, Ins.materia, AL.cognome, CL.lettera
From Insegnante as Ins,  Insegna as Ing, StoricoIscrizioni as SI, Alunno as AL, Classe as CL
Where Ins.CF=Ing.IDInsegnante and Ing.IDClasse=SI.IDClasse and SI.CFAlunno=AL.CF and Ing.IDClasse=CL.IDClasse and Ing.AnnoScolastico=SI.AnnoScolastico