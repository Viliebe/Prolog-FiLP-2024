problem(dandruff):-
    query('� ��� ���� �������, ��� ��� ���������?').

problem(procedure):-
    query('�� �����-������ ������ ������������� ����� ��� ����������� �����������?').

problem(dryness):-
    query('���� ������ ����� � ������?').

problem(styler):-
    query('����������� �� �� ����� ��� ������� ��� �����?').

problem(dirty):-
    query('���� ������ ������ ���������� �������� � �������?').

problem(unruly):-
    query('� ��� ����������� � ���������� ������?').

fault('������� � ����������� ��������'):-
    problem(dirty),
    problem(dandruff).

fault('������� � �����������'):-
    problem(dandruff),
    problem(unruly).

fault('������� � ����������� ������'):-
    problem(dandruff),
    problem(dirty).

fault('����������������� ����� � ���������'):-
    problem(dryness),
    problem(styler).

fault('����������������� ����� � ����������'):-
    problem(dryness),
    problem(unruly).

fault('����������������� ����� � ������������ ��������'):-
    problem(unruly),
    problem(styler).

fault('������� � ���������� �����'):-
    problem(damaged),
    problem(dandruff).

fault('������� � ���������'):-
    problem(dryness),
    problem(procedure).

fault('������� � �������� ���������'):-
    problem(dryness),
    problem(styler).

fault('������� � ����������'):-
    problem(dryness),
    problem(dandruff).

fault('������������� �������'):-
    problem(styler),
    problem(procedure).

fault('����-������ �������'):-
    problem(procedure).

fault('����� � ��������'):-
    problem(unruly),
    problem(dirty).

fault('���������������� ������� � ����������� �������� � ������ �������'):-
    problem(dryness),
    problem(styler),
    problem(dirty),
    problem(unruly).

fault('����������� ������� � ���� ����'):-
    problem(procedure),
    problem(dryness).

fault('����������� � ������ �������� ��������'):-
    problem(unruly).

fault('����� � �����-6'):-
    problem(procedure),
    problem(unruly).

fault('����������� ��� ���������� �����'):-
    problem(procedure).

fault('������� � ���������� ������� � ������ �������'):-
    problem(dandruff),
    problem(unruly),
    problem(procedure).

fault('����������������� ����� � ���������� ������ ����'):-
    problem(dandruff),
    problem(unruly),
    problem(procedure),
    problem(styler),
    problem(dirty),
    problem(dryness).
