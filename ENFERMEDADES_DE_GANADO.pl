%HECHOS GENERALES
animal(bovino).
animal(porcino).

enfermedad(bovino, fiebre_aftosa).
enfermedad(bovino, tetano).
enfermedad(bovino, carbunco).
enfermedad(porcino, colera_porcina).
enfermedad(porcino, leptospirosis_porcina).
enfermedad(porcino, disenteria_porcina).

%HECHOS SINTOMAS GANADO BOVINO
%
sintoma(fiebre_aftosa, "\n1. Fiebre y escalofr�os").
sintoma(fiebre_aftosa, "\n2. Chasquidos de los labios y baboseo").
sintoma(fiebre_aftosa, "\n3. Ves�culas en las fosas nasales, cavidad bucal y entre las u�as").
sintoma(fiebre_aftosa, "\n4. Depresi�n y mal estado general").
sintoma(fiebre_aftosa, "\n5. Lesiones y erosiones en el epitelio de la boca, fosas nasales, morro, patas, tetillas y ubre\n").

sintoma(tetano, "\n1. Rigidez en los m�sculos del cuello").
sintoma(tetano, "\n2. Dificultad para respirar").
sintoma(tetano, "\n3. Calambres").
sintoma(tetano, "\n4. Salivaci�n excesiva").
sintoma(tetano, "\n5. Muerte\n").

sintoma(carbunco, "\n1. Postraci�n del animal").
sintoma(carbunco, "\n2. Fiebre").
sintoma(carbunco, "\n3. Temblor muscular").
sintoma(carbunco, "\n4. Muerte s�bita\n").

%HECHOS SINTOMAS ENFERMEDADES GANADO PORCINO

sintoma(colera_porcina, "\n1. Fiebre de 40�C - 41�C").
sintoma(colera_porcina, "\n2. Decaimiento").
sintoma(colera_porcina, "\n3. Conjuntivitis").
sintoma(colera_porcina, "\n4. Vientre con coloraci�n roja").
sintoma(colera_porcina, "\n5. Estre�imiento seguido de diarrea\n").

sintoma(leptospirosis_porcina, "\n1. Pari� lechones d�biles o abort� en el tercer trimestre").
sintoma(leptospirosis_porcina, "\n2. Fiebre elevada").
sintoma(leptospirosis_porcina, "\n3. Muerte\n").

sintoma(disenteria_porcina, "\n1. Diarrea").
sintoma(disenteria_porcina, "\n2. Heces tienen sangre").
sintoma(disenteria_porcina, "\n3. Deshidrataci�n").
sintoma(disenteria_porcina, "\n4. P�rdida del apetito").
sintoma(disenteria_porcina, "\n5. Muerte\n").

%TRATAMIENTO

tratamiento(fiebre_aftosa, "No hay un tratamiento espec�fico para esta enfermedad,se recomienda sacrificio e incineraci�n o entierro de las reses infectadas, para prevenci�n se recomienda aplicar la vacuna anti aftosa siguiendo el plan de vacunaci�n").
tratamiento(tetano, "En caso de presentarse la enfermedad colocar la antitoxina tet�nica cada 12 horas. \nAplicar antibi�ticos de amplio espectro y tratamiento de soporte").
tratamiento(carbunco,"Los antibi�ticos m�s utilizados son la oxitetraciclina, la eritromicina, las sulfonamidas y la penicilina. \nLos productores deben incluir la vacunaci�n anual profil�ctica en su plan de vacunaci�n").

tratamiento(colera_porcina, "No existe un tratamiento para los animales que poseen la enfermedad, lo �nico que se puede hacer es prevenir la enfermedad mediante vacunaci�n e incinerar el animal infectado.").
tratamiento(leptospirosis_porcina, "Se debe aplicar antibi�ticos dihidroestreptomicina para contrarrestar esta enfermedad").
tratamiento(disenteria_porcina, "Se pueden utilizar antibi�ticos para su control, pero requiere periodos largos y puede ser bastante caro.").

%REGLAS

enfermedades_gb(fiebre_aftosa) :-
preguntar("�presenta fiebre y escalofr�os?"),
preguntar("�tiene chasquidos de los labios y baboseo?"),
preguntar("�tiene ves�culas en las fosas nasales, cavidad bucal y entre las u�as?"),
preguntar("�el animal est� deprimido y con mal estado general?"),
preguntar("�presenta lesiones y erosiones en el epitelio de la boca, fosas nasales, morro, patas, tetillas y ubre?").

enfermedades_gb(tetano) :-
preguntar("�tiene rigidez en los m�sculos del cuello?"),
preguntar("�dificultad para respirar?"),
preguntar("�tiene calambres?"),
preguntar("�tiene salivaci�n excesiva?"),
preguntar("�el anim�l muri�?").

enfermedades_gb(carbunco) :-
preguntar("�el animal se ha postrado?"),
preguntar("�tiene fiebre?"),
preguntar("�temblor muscular?"),
preguntar("�el animal tubo muerte s�bita?").

enfermedades_gb("DESCONOCIDA").

%REGLAS
%
enfermedades_gp(colera) :-
preguntar("�tiene fiebre de 40�C - 41�C?"),
preguntar("�tiene decaimiento?"),
preguntar("�tiene conjuntivitis?"),
preguntar("�el vientre tiene coloraci�n roja?"),
preguntar("�tiene estre�imiento seguido de diarrea?").

enfermedades_gp(leptospirosis_porcina) :-
preguntar("�pari� lechones d�biles o abort� en el tercer trimestre?"),
preguntar("�fiebre elevada?"),
preguntar("el animal muri�?").

enfermedades_gp(disenteria_porcina) :-
preguntar("�tiene diarrea?"),
preguntar("�las heces tienen sangre?"),
preguntar("�se nota deshidrataci�n?"),
preguntar("�muestra p�rdida del apetito?"),
preguntar("el animal muri�?").

enfermedades_gp("DESCONOCIDA").


gestacion(porcino):- write("Entre 110-118 d�as, con un promedio de: 3 meses, 3 semanas y 3 d�as").
gestacion(bovino):- write("Entre 271-305 d�as, con un promedio de: 9 meses y 10 d�as").

enfermedades(ANIMAL):- bagof(X, enfermedad(ANIMAL, X), LISTA), write(LISTA).

sintomas_de(ENFERMEDAD):- bagof(X, sintoma(ENFERMEDAD, X), LISTA), write(LISTA).

preguntar(PREGUNTA):- write("\nCONTESTE LA SIGUIENTE PREGUNTA: "), write(PREGUNTA), nl, write('Responda: VERDADERO(v) � FALSO(f): '), read(RESPUESTA), (RESPUESTA == v).

detectar_enfermedad_gb:- enfermedades_gb(ENFERMEDAD), nl, write("seg�n los s�ntomas, la efermedad es: "), write(ENFERMEDAD), nl,
write("'El tratamiento recomendado es:'"), nl, nl, tratamiento(ENFERMEDAD, TRATAMIENTO), write(TRATAMIENTO).

detectar_enfermedad_gp:- enfermedades_gp(ENFERMEDAD), nl, write("seg�n los s�ntomas, la efermedad  es: "), write(ENFERMEDAD), nl,
write("'El tratamiento recomendado es:'"), nl, nl, tratamiento(ENFERMEDAD, TRATAMIENTO), write(TRATAMIENTO).

detectar_efermedad(ANIMAL):- (ANIMAL == bovino, detectar_enfermedad_gb); (ANIMAL == porcino, detectar_enfermedad_gp).
