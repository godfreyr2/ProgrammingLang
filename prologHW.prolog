% Practice program to check skills
%
%
% jobs_ok(+Assignment, +Employees).
% jobs_ok(Assignment, Employees).
jobs_ok(Assignment, Employees) :-  no_dupe(Assignment), assignments_ok(Assignment, Employees).

% no_dupe(+List)
% No duplicates in Assignment
no_dupe(A) :- flatten(A, L), is_set(L).

% get_skills(+Name, +List, -Skills)
% Skills for specific employee will be unioned.
get_skills(Name, [[Name | Skills] | _ ], Skills).
get_skills(Name, [_ | T], Skills) :- get_skills(Name, T, Skills).


%phone_skills(+Assignment, +Employees)
%Skill is the required skill for employee's phone assignment.
phone_skills(Name, Employees) :- get_skills(Name, Employees, F),
				F = (1, _, _).

%computer skills(+Assignment, +Employees)
%Skill is the required skill for employee's computer assignment.
computer_skills(Name, Employees) :- get_skills(Name, Employees, F),
				    F = (_, 1, _).

%network_skills(+Assignment, +Employees)
%Skill is the required skill for employee's network assignment.

network_skills(Name, Employees) :- get_skills(Name, Employees, F),
				   F = (_, _, 1).


shifts_ok([A,B,C,D], Employees):-
    phone_skills(A, Employees),
    phone_skills(B, Employees),
    computer_skills(C, Employees),
    network_skills(D, Employees).


assignments_ok([], _).
assignments_ok([H | T], Employees) :-
    shifts_ok(H, Employees),
    assignments_ok(T, Employees).
