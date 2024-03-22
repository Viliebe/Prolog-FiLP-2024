%Задание 4. Вариант 6
%Кто является австралийцем? Каким спортом увлекается Ричард?
in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).
%pr_ein
pr_ein:-Friends=[_,_,_,_],
         
        in_list(Friends,[micael,basketball,luche,_]),
        in_list(Friends,[_,basketball,_,american]),
        in_list(Friends,[saymon,tennis,luche,israel]),
        in_list(Friends,[_,kricet,luche,_]),

		in_list(Friends,[WHO1,_,_,_]),
		in_list(Friends,[richard,WHO2,_,_]),
        
		write('Avstraliets - '),write(WHO1),nl,
        write('Sport - '),write(WHO2),nl.