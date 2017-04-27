% Alyssa Kutney, Ryan Godfrey, Patrick Jacaszek 




% jobs_ok(+Assignment, +Employees
% True if there are no duplicates found in the Assignments,
% and that every employee has been assigned to their apropriate roll.
jobs_ok(Assignment, Employees) :- noDupe(Assignment),
				  assignmentsOK(Assignment, Employees).


% noDupes(+List)
% True if the given list, when flattened, does not cantain and duplicats
% items. is_set checks to see that the if flattened list is a set or not.
noDupe(Assignment) :- flatten(Assignment, X), is_set(X).


% findEmpSkills(+Name, +List, -Skills)
% True if the given Name is the 1st element of the 1st element, and Skills
% are unioned with the Employee's skill list. 
get_skills(Name, [[Name | Skills] | _], Skills).
get_skills(Name, [_ | T], Skills) :- get_skills(Name, T, Skills).

% Actual Skill(+Name, +List)
% True if the named employee can perform each task. This method
% checks the specific skill in question for a match. 
phone_skills(Name, Employees) :- get_skills(Name, Employees, X),
				 X = [1, _, _].
computer_skills(Name, Employees) :- get_skills(Name, Employees, X),
				 X = [_, 1, _].
network_skills(Name, Employees) :- get_skills(Name, Employees, X),
				 X = [_, _, 1].


% Shifts_OK(+Shifts, +Employees)
% True if all employees can perform the actual specified skill. 
shifts_OK([A,B,C,D], Employees) :- phone_skills(A, Employees),
				  phone_skills(B, Employees),
				  computer_skills(C, Employees),
				  network_skills(D, Employees).


% assignmentsOK(+Assignment, +Employees)
% True if all Empoyees can perform the task where they are placed,
% by calling shifts_OK, and checks that all assignments pass as well.  
assignmentsOK([], _).
assignmentsOK([H | T], Employees) :- shifts_OK(H, Employees),
				assignmentsOK(T, Employees).
