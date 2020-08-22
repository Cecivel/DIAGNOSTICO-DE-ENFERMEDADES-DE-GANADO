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
sintoma(fiebre_aftosa, "\n1. Fiebre y escalofríos").
sintoma(fiebre_aftosa, "\n2. Chasquidos de los labios y baboseo").
sintoma(fiebre_aftosa, "\n3. Vesículas en las fosas nasales, cavidad bucal y entre las uñas").
sintoma(fiebre_aftosa, "\n4. Depresión y mal estado general").
sintoma(fiebre_aftosa, "\n5. Lesiones y erosiones en el epitelio de la boca, fosas nasales, morro, patas, tetillas y ubre\n").

sintoma(tetano, "\n1. Rigidez en los músculos del cuello").
sintoma(tetano, "\n2. Dificultad para respirar").
sintoma(tetano, "\n3. Calambres").
sintoma(tetano, "\n4. Salivación excesiva").
sintoma(tetano, "\n5. Muerte\n").

sintoma(carbunco, "\n1. Postración del animal").
sintoma(carbunco, "\n2. Fiebre").
sintoma(carbunco, "\n3. Temblor muscular").
sintoma(carbunco, "\n4. Muerte súbita\n").

%HECHOS SINTOMAS ENFERMEDADES GANADO PORCINO

sintoma(colera_porcina, "\n1. Fiebre de 40°C - 41°C").
sintoma(colera_porcina, "\n2. Decaimiento").
sintoma(colera_porcina, "\n3. Conjuntivitis").
sintoma(colera_porcina, "\n4. Vientre con coloración roja").
sintoma(colera_porcina, "\n5. Estreñimiento seguido de diarrea\n").

sintoma(leptospirosis_porcina, "\n1. Parió lechones débiles o abortó en el tercer trimestre").
sintoma(leptospirosis_porcina, "\n2. Fiebre elevada").
sintoma(leptospirosis_porcina, "\n3. Muerte\n").

sintoma(disenteria_porcina, "\n1. Diarrea").
sintoma(disenteria_porcina, "\n2. Heces tienen sangre").
sintoma(disenteria_porcina, "\n3. Deshidratación").
sintoma(disenteria_porcina, "\n4. Pérdida del apetito").
sintoma(disenteria_porcina, "\n5. Muerte\n").

%TRATAMIENTO

tratamiento(fiebre_aftosa, "No hay un tratamiento específico para esta enfermedad,se recomienda sacrificio e incineración o entierro de las reses infectadas, para prevención se recomienda aplicar la vacuna anti aftosa siguiendo el plan de vacunación").
tratamiento(tetano, "En caso de presentarse la enfermedad colocar la antitoxina tetánica cada 12 horas. \nAplicar antibióticos de amplio espectro y tratamiento de soporte").
tratamiento(carbunco,"Los antibióticos más utilizados son la oxitetraciclina, la eritromicina, las sulfonamidas y la penicilina. \nLos productores deben incluir la vacunación anual profiláctica en su plan de vacunación").

tratamiento(colera_porcina, "No existe un tratamiento para los animales que poseen la enfermedad, lo único que se puede hacer es prevenir la enfermedad mediante vacunación e incinerar el animal infectado.").
tratamiento(leptospirosis_porcina, "Se debe aplicar antibióticos dihidroestreptomicina para contrarrestar esta enfermedad").
tratamiento(disenteria_porcina, "Se pueden utilizar antibióticos para su control, pero requiere periodos largos y puede ser bastante caro.").

%REGLAS

enfermedades_gb(fiebre_aftosa) :-
preguntar("¿presenta fiebre y escalofríos?"),
preguntar("¿tiene chasquidos de los labios y baboseo?"),
preguntar("¿tiene vesículas en las fosas nasales, cavidad bucal y entre las uñas?"),
preguntar("¿el animal está deprimido y con mal estado general?"),
preguntar("¿presenta lesiones y erosiones en el epitelio de la boca, fosas nasales, morro, patas, tetillas y ubre?").

enfermedades_gb(tetano) :-
preguntar("¿tiene rigidez en los músculos del cuello?"),
preguntar("¿dificultad para respirar?"),
preguntar("¿tiene calambres?"),
preguntar("¿tiene salivación excesiva?"),
preguntar("¿el animál murió?").

enfermedades_gb(carbunco) :-
preguntar("¿el animal se ha postrado?"),
preguntar("¿tiene fiebre?"),
preguntar("¿temblor muscular?"),
preguntar("¿el animal tubo muerte súbita?").

enfermedades_gb("DESCONOCIDA").

%REGLAS
%
enfermedades_gp(colera) :-
preguntar("¿tiene fiebre de 40°C - 41°C?"),
preguntar("¿tiene decaimiento?"),
preguntar("¿tiene conjuntivitis?"),
preguntar("¿el vientre tiene coloración roja?"),
preguntar("¿tiene estreñimiento seguido de diarrea?").

enfermedades_gp(leptospirosis_porcina) :-
preguntar("¿parió lechones débiles o abortó en el tercer trimestre?"),
preguntar("¿fiebre elevada?"),
preguntar("el animal murió?").

enfermedades_gp(disenteria_porcina) :-
preguntar("¿tiene diarrea?"),
preguntar("¿las heces tienen sangre?"),
preguntar("¿se nota deshidratación?"),
preguntar("¿muestra pérdida del apetito?"),
preguntar("el animal murió?").

enfermedades_gp("DESCONOCIDA").


gestacion(porcino):- write("Entre 110-118 días, con un promedio de: 3 meses, 3 semanas y 3 días").
gestacion(bovino):- write("Entre 271-305 días, con un promedio de: 9 meses y 10 días").

enfermedades(ANIMAL):- bagof(X, enfermedad(ANIMAL, X), LISTA), write(LISTA).

sintomas_de(ENFERMEDAD):- bagof(X, sintoma(ENFERMEDAD, X), LISTA), write(LISTA).

preguntar(PREGUNTA):- write("\nCONTESTE LA SIGUIENTE PREGUNTA: "), write(PREGUNTA), nl, write('Responda: VERDADERO(v) ó FALSO(f): '), read(RESPUESTA), (RESPUESTA == v).

detectar_enfermedad_gb:- enfermedades_gb(ENFERMEDAD), nl, write("según los síntomas, la efermedad es: "), write(ENFERMEDAD), nl,
write("'El tratamiento recomendado es:'"), nl, nl, tratamiento(ENFERMEDAD, TRATAMIENTO), write(TRATAMIENTO).

detectar_enfermedad_gp:- enfermedades_gp(ENFERMEDAD), nl, write("según los síntomas, la efermedad  es: "), write(ENFERMEDAD), nl,
write("'El tratamiento recomendado es:'"), nl, nl, tratamiento(ENFERMEDAD, TRATAMIENTO), write(TRATAMIENTO).

detectar_efermedad(ANIMAL):- (ANIMAL == bovino, detectar_enfermedad_gb); (ANIMAL == porcino, detectar_enfermedad_gp).
