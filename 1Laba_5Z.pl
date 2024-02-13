problem(dandruff):-
    query('У вас есть перхоть, зуд или шелушение?').

problem(procedure):-
    query('Вы когда-нибудь делали ламинирование волос или кератиновое выпрямление?').

problem(dryness):-
    query('Ваши волосы сухие и ломкие?').

problem(styler):-
    query('Пользуетесь ли вы феном или утюжком для волос?').

problem(dirty):-
    query('Ваши волосы быстро становятся грязными и жирными?').

problem(unruly):-
    query('У вас непослушные и выпадающие волосы?').

fault('шампунь с салициловой кислотой'):-
    problem(dirty),
    problem(dandruff).

fault('шампунь с климбазолом'):-
    problem(dandruff),
    problem(unruly).

fault('шампунь с дисульфидом селена'):-
    problem(dandruff),
    problem(dirty).

fault('восстанавливающая маска с кератином'):-
    problem(dryness),
    problem(styler).

fault('восстанавливающая маска с коллагеном'):-
    problem(dryness),
    problem(unruly).

fault('восстанавливающая маска с гиалуроновой кислотой'):-
    problem(unruly),
    problem(styler).

fault('бальзам с экстрактом какао'):-
    problem(damaged),
    problem(dandruff).

fault('бальзам с кератином'):-
    problem(dryness),
    problem(procedure).

fault('бальзам с молочным протеином'):-
    problem(dryness),
    problem(styler).

fault('бальзам с пантенолом'):-
    problem(dryness),
    problem(dandruff).

fault('бессульфатный шампунь'):-
    problem(styler),
    problem(procedure).

fault('анти-желтый шампунь'):-
    problem(procedure).

fault('маска с биотином'):-
    problem(unruly),
    problem(dirty).

fault('мультивитаминный бальзам с экстрактами женьшеня и маслом авокадо'):-
    problem(dryness),
    problem(styler),
    problem(dirty),
    problem(unruly).

fault('увлажняющий шампунь с алоэ вера'):-
    problem(procedure),
    problem(dryness).

fault('кондиционер с маслом вишневых косточек'):-
    problem(unruly).

fault('маска в омега-6'):-
    problem(procedure),
    problem(unruly).

fault('кондиционер для окрашенных волос'):-
    problem(procedure).

fault('шампунь с экстрактом черники и маслом авокадо'):-
    problem(dandruff),
    problem(unruly),
    problem(procedure).

fault('восстанавливающая маска с экстрактом черной икры'):-
    problem(dandruff),
    problem(unruly),
    problem(procedure),
    problem(styler),
    problem(dirty),
    problem(dryness).
