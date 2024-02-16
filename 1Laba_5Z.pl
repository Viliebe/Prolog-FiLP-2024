problem(dandruff):-
    query('U vas est perhot, zud ili shelushenia?').

problem(procedure):-
    query('vi kogda-nibud delali laminirovanie volos ili keratinovoe vipryamlenie').

problem(dryness):-
    query('Vashi volosi suhie i lomkie?').

problem(styler):-
    query('Polzuetes li vu fenom ili utyugom dlya volos?').

problem(dirty):-
    query('Vashi volosi bistro stanovyztsya gryaznumi i jirnumi?').

problem(unruly):-
    query('U vas vipadayuschie i neposlushnie volosi?').

fault('shampoo with salicylic acid'):-
    problem(dirty),
    problem(dandruff).

fault('shampoo with climbazole'):-
    problem(dandruff),
    problem(unruly).

fault('shampoo with selenium disulfide'):-
    problem(dandruff),
    problem(dirty).

fault('restorative mask with keratin'):-
    problem(dryness),
    problem(styler).

fault('revitalizing mask with collagen'):-
    problem(dryness),
    problem(unruly).

fault('revitalizing mask with hyaluronic acid'):-
    problem(unruly),
    problem(styler).

fault('balm with cocoa extract'):-
    problem(unruly),
    problem(dandruff).

fault('balm with keratin'):-
    problem(dryness),
    problem(procedure).

fault('milk protein balm'):-
    problem(dryness),
    problem(styler).

fault('balm with panthenol'):-
    problem(dryness),
    problem(dandruff).

fault('sulfate-free shampoo'):-
    problem(styler),
    problem(procedure).

fault('anti-yellow shampoo'):-
    problem(procedure).

fault('biotin mask'):-
    problem(unruly),
    problem(dirty).

fault('multivitamin balm with ginseng extracts and avocado oil'):-
    problem(dryness),
    problem(styler),
    problem(dirty),
    problem(unruly).

fault('moisturizing shampoo with aloe vera'):-
    problem(procedure),
    problem(dryness).

fault('conditioner with cherry seed oil'):-
    problem(unruly).

fault('omega-6 mask'):-
    problem(procedure),
    problem(unruly).

fault('conditioner for colored hair'):-
    problem(procedure).

fault('shampoo with blueberry extract and avocado oil'):-
    problem(dandruff),
    problem(unruly),
    problem(procedure).

