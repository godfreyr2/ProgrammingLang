% Alyssa Kutney, Ryan Godfrey, Patrick Jacaszek 




% jobs_ok(+Assignment, +Employees
% True if no duplicates in Assignments, and every employee has required
jobs_ok(Assignment, Employees) :- noDupe(Assignment),
				  assignmentsOK(Assignment, Employees).


% noDupes(+List)
% True if list, when flattened, contains no duplicate elements. 
noDupe(Assignment) :- flatten(Assignment, X), is_set(X).


% findEmpSkills(+Name, +List, -Skills)
% True if Name is the 1st element of the 1st element, and Skills is unioned
% with the Employee's skill list
get_skills(Name, [[Name | Skills] | _], Skills).
get_skills(Name, [_ | T], Skills) :- get_skills(Name, T, Skills).

% Actual Skill(+Name, +List)
% True if named employee can perform each task.
phone_skills(Name, Employees) :- get_skills(Name, Employees, X),
				 X = [1, _, _].
computer_skills(Name, Employees) :- get_skills(Name, Employees, X),
				 X = [_, 1, _].
network_skills(Name, Employees) :- get_skills(Name, Employees, X),
				 X = [_, _, 1].


%Shifts_OK(+Shifts, +Employees)
%True if all employees can perform their special skill
shifts_OK([A,B,C,D], Employees) :- phone_skills(A, Employees),
				  phone_skills(B, Employees),
				  computer_skills(C, Employees),
				  network_skills(D, Employees).


%assignmentsOK(+Assignment, +Employees)
%True if all Empoyees can perform their task where they are placed,
%and all assignments paas as well.  
assignmentsOK([], _).
assignmentsOK([H | T], Employees) :- shifts_OK(H, Employees),
				assignmentsOK(T, Employees).
