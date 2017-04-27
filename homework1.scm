
       	; Ryan Godfrey, Alyssa Kutney, Patrick Jacaszek

; Checks for duplicate employees and if the employee assignments are correct.

(define (jobs_ok? employeeShifts employeeSkills)
        ; If there are duplicate names return false.
  (cond ((duplicates? (flatten employeeShifts)) #F)
	; If everything checks out ok then return true.
	((employees_ok? employeeShifts employeeSkills) #T) 
	(else #F)
	)
  )

; Validates that each employee's skills are in order.

(define (employees_ok? shiftList employeeSkills)
        ; If reached the end then return true.
  (cond ((null? shiftList) #T)
	; If skills_ok returns an #F then return false.
	((eqv? #F (skills_ok? (car shiftList) employeeSkills)) #F)
	; Go to the next name.
	(else (employees_ok? (cdr shiftList) employeeSkills))      
	)
  )

; Checks the lists for duplicate items.

(define (duplicates? lst)
  (cond ((null? lst) #F) ; If it's empty return false.
	; Does the car match anything in the cdr?
	((member (car lst) (cdr lst)) #T) 
	(else (duplicates? (cdr lst)))
	)
  )

; Takes a list and all of its nested lists and flattens it to 1 list.

(define (flatten lst)
  (cond ((null? lst) '()) 
	((pair? (car lst)) (append (flatten (car lst)) (flatten (cdr lst))))
	(else (cons (car lst) (flatten (cdr lst))))
	)
  )

; Gets the skills list for a given employee.

(define (getSkills employeeSkills name)
  (cond ((null? employeeSkills) #F)
	; Gets the list of the specified name and returns the list that
        ; includes their skills assignment.
	((eqv? name (caar employeeSkills)) (cdar employeeSkills)) ;
	(else (getSkills (cdr employeeSkills) name))
	)
  )

; Checks a name to see if they have phone skills.

(define (phoneSkill? employeeList name)
        ; Checks to see if the phone skill is = 1
  (cond ((= 1 (car (getSkills employeeList name))) #T)
	(else #F)
	)
  )

; Checks a name to see if they have computer skills.

(define (compSkill? employeeList name)
        ; Checks to see if the computer  skill is = 1
  (cond ((= 1 (cadr (getSkills employeeList name))) #T)
	(else #F)
	)
  )

; Checks a name to see if they have network skills.

(define (networkSkill? employeeList name)
        ; Checks to see if the network skill is = 1
  (cond ((= 1 (caddr (getSkills employeeList name))) #T)
        (else #F)
        )
  )

; Checks each of the 4-employee lists and validates their job skills.

(define (skills_ok? shiftList employeeList)
        ; Checks the first name slot
  (cond ((eqv? #F (phoneSkill? employeeList (car shiftList))) #F)
	; Checks the second name slot
        ((eqv? #F (phoneSkill? employeeList (cadr shiftList))) #F)
	; Checks the third name slot
        ((eqv? #F (compSkill? employeeList (caddr shiftList))) #F)
	; Checks the fourth name slot
        ((eqv? #F (networkSkill? employeeList (cadddr shiftList))) #F)	
	(else #T)
        )
  )
         








