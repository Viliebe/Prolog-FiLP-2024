man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).
man(rostislav).
man(rostislavchik).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).
woman(miroslava).
woman(mirovlada).
woman(nadya).

parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).

parent(miroslava,velerad).
parent(miroslava,veslava).
parent(mirovlada,duhovlad).
parent(mirovlada,zhdana).

parent(miroslava,nadya).

%Построить предикат grand_ma(X, Y), который проверяет, является ли X бабушкой Y. Без использования готовых предикатов.
%grand_ma(+X,+Y)
grand_ma(X, Y):- parent(Z,Y), parent(X,Z), woman(X).

%Построить предикат grand_mas(X), который выводит всех бабушек X. Без использования готовых предикатов.
%grand_mas(+ X)
grand_mas(X):- parent(Z,Y), parent(Y,X), print(Z), nl, fail.

%Построить предикат grand_ma_and_da(X,Y), который проверяет, являются ли X и Y бабушкой и внучкой или внучкой и бабушкой. Без использования готовых предикатов.
%grand_ma_and_da(+X,+Y)
grand_ma_and_da(X,Y):- parent(Y,Z), parent(Z,X), woman(X), woman(Y); parent(X,Z), parent(Z,Y), woman(Y), woman(X).

%Построить предикат grand_ma_and_da(X,Y), который проверяет, являются ли X и Y бабушкой и внучкой или внучкой и бабушкой. С использованием готовых предикатов.
%grand_ma_and_da(+X,+Y)
grand_ma_and_da(X,Y):- grand_ma(X,Y); grand_ma(Y,X), woman(Y).

%Построить предикат, который проверяет, является ли X тетей Y. Без использования готовых предикатов.
%aunt(+X,+Y)
aunt(X,Y):- parent(Z,Y), parent(V,Z), parent(V,X), woman(X), woman(Z), woman(V), X\=Z.

%Построить предикат, который проверяет, является ли X тетей Y. С использованием готовых предикатов.
%aunt(+X,+Y)
aunt(X,Y):- grand_ma(Z,Y), parent(Z,V), parent(V,Y), woman(X).

%Построить предикат, который выводит всех тетей X. Без использования готовых предикатов.
%aunts(+X) 
aunts(X):- aunt(Z,X), print(Z), nl, fail.