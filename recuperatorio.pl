 %      (Programa,Rating)
programa(intrusos, 10).
programa(infama, 11).
programa(animalesSueltos, 8).
programa(elMonologo, 5).
programa(espn, 100).
%      (Programa,Conductor)
conduce(intrusos, rial).
conduce(intrusos, ventura).
conduce(infama, delMoro).
conduce(animalesSueltos, fantino).
conduce(animalesSueltos, neumann).
conduce(animalesSueltos, cocoSily).
conduce(elMonologo, cocoSily).
conduce(intrusos,ruben).
conduce(espn,santi).
conduce(intruso,santi).
conduce(infama,santi).

%        (Protagonista,Publico,Programa)
primicia(rial, 20, intrusos).
primicia(fantino, 40, intrusos).
primicia(floppyTesouro, 100, animalesSueltos).
primicia(zairaNara, 20, animalesSueltos).
primicia(ruben, 30, espn).


%Punto 1 
%Calcular el ranking de una primicia, 
%que son los puntos de rating que espera hacer un programa más la mitad del publico interesado de la primicia. 
ranking(Protagonista,Valor):-
    primicia(Protagonista,Publico,Programa),
    programa(Programa,Rating),
    Valor is Rating + (Publico /2).

%Punto 2
%Se quiere conocer los programas que no tienen primicias
noTienePrimicia(Programa):-
    programa(Programa,_),
    not(primicia(_,_,Programa)).


%Punto 3
% Se quiere conocer los conductores que estén en más de un programa de chimentos.
masDeUnPrograma(Conductor):-
        conduce(P1,Conductor),
        conduce(P2,Conductor),
        P1 \= P2.


%Punto 4
% Se quiere saber los programas donde todas sus primicias son de conductores de otros programas de chimentos. 

conPrimiciasDeOtroConductor(Programa):-
        programa(Programa,_),
        primicia(_,_,Programa),
        forall((primicia(Protagonista,_,Programa),(conduce(Programa,Conductor))),Protagonista \= Conductor).

