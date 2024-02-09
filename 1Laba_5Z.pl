
main :-
    retractall(asked(_,_)),
    fault(Problem),
    !,
    nl,
    write('It suits you '), write(Problem), write(.), nl.
main :-
    nl,
    write('We havent found a remedy for you yet.'), nl.

problem(dandruff):-
    query('You have dandruff, hearing loss or flaking?').

problem(procedure):-
    query('Have you ever done hair lamination or keratin?').

problem(dryness):-
    query('Is your hair dry and brittle?').

problem(styler):-
    query('Do you use a hair dryer and various stylers?').

problem(dirty):-
    query('Does your hair quickly become dirty and greasy?').

problem(unruly):-
    query('Do you have unruly and falling hair?').



fault('shampoo_with_salicylic_acid'):-
    problem(dandruff).

fault('shampoo_with_salicylic_acid'):-
    problem(dirty),
    problem(dandruff).

fault('shampoo_with_climbazole'):-
    problem(dandruff),
    problem(unruly).

fault('shampoo_with_selenium_disulfide'):-
    problem(dandruff),
    problem(dirty).

fault('regenerating_mask_with_keratin'):-
    problem(dryness),
    problem(styler).

fault('regenerating_mask_with_collagen'):-
    problem(dryness),
    problem(unruly).

fault('regenerating_mask_hyaluronic_acid'):-
    problem(unruly),
    problem(styler).

fault('care_with_cocoa_extract'):-
    problem(damaged),
    problem(dandruff).

fault('keratin_care'):-
    problem(dryness),
    problem(procedure).

fault('care_with_milk_protein'):-
    problem(dryness),
    problem(styler).

fault('care_with_panthenol'):-
    problem(dryness),
    problem(dandruff).

fault('sulfate_free_shampoo'):-
    problem(styler),
    problem(procedure).

fault('anti_yellow_shampoo'):-
    problem(procedure).

fault('biotin_mask'):-
    problem(unruly),
    problem(dirty).

fault('multivitamin_balm_with_ginseng_extracts_and_avacado_oil'):-
    problem(dryness),
    problem(styler),
    problem(dirty),
    problem(unruly).

fault('moisturizing_shampoo_with_aloe_vera'):-
    problem(procedure),
    problem(dryness).

fault('conditioner_with_cherry_seed_oil'):-
    problem(unruly)

fault('mask with omega-6'):-
    problem(procedure),
    problem(unruly).

fault('conditioner_for_colored_hair'):-
    problem(procedure).

fault('revitalizing_mask_with_caviar_extract'):-
    problem(dandruff),
    problem(unruly),
    problem(procedure).

fault('shampoo with blueberry extract and avacado oil'):-
    problem(dandruff),
    problem(unruly),
    problem(procedure),
    problem(styler),
    problem(dirty),
    problem(dryness).



query(Prompt) :-
    (   asked(Prompt, Reply) -> true
    ;   nl, write(Prompt), write(' (y/n)? '),
        read(X),(X = y -> Reply = y ; Reply = n),
	assert(asked(Prompt, Reply))
    ),
    Reply = y.



