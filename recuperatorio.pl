
 %      (Programa,Rating)
programa(intrusos, 10).
programa(infama, 11).
programa(animalesSueltos, 8).
programa(elMonologo, 5).

%      (Programa,Conductor)
conduce(intrusos, rial).
conduce(intrusos, ventura).
conduce(infama, delMoro).
conduce(animalesSueltos, fantino).
conduce(animalesSueltos, neumann).
conduce(animalesSueltos, cocoSily).
conduce(elMonologo, cocoSily).

%        (Protagonista,Valor,Programa)
primicia(rial, 20, intrusos).
primicia(fantino, 40, intrusos).
primicia(floppyTesouro, 100, animalesSueltos).
primicia(zairaNara, 20, animalesSueltos).


%Punto 1 
% ranking(Primicia):-primicia(Primicia,Valor,Programa),

%Punto 2
%Se quiere conocer los programas que no tienen primicias
noTienePrimicia(Programa):-
    programa(Programa,_),
    not(primicia(_,_,Programa)).


%Punto 3
% Se quiere conocer los conductores que estén en más de un programa de chimentos.
conductoresconMasprog(Conductor):-
    %   programa(P1,_),
    %   programa(P2,_),    
    %   conduce(P1,Conductor),
    %   conduce(P2,Conductor),
    %   P1 \= P2.
    conduce(_,Conductor),
    forall(conduce(Programa,Conductor),conduce(Programa,Conductor)).



masDeUnPrograma(Conductor):-
        programa(P1,_),
        programa(P2,_),
        conduce(P1,Conductor),
        conduce(P2,Conductor),
        P1 \= P2.

%Punto 4
% Se quiere saber los programas donde todas sus primicias son de conductores de otros programas de chimentos. 

primiciaConConductorChimento(Programa):-
    conduce(Programa,C),
    primicia(Conductor,_,Programa), 
    conduce(Conductor,Programa1),
    C\=Conductor,
    Programa\= Programa1. 

