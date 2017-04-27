
       	; Ryan Godfrey, Alyssa Kutney, Patrick Jacaszek


       	; Checks for duplicate employees and if the employee assignments are correct.

(define (jobs_ok? shiftAssignment Employees)
  (cond ((duplicates? (flatten shiftAssignment)) #F) ; If there are duplicate names return false.
	((employees_ok? shiftAssignment Employees) #T) ; If everything checks out ok then return true.
	(else #F)
	)
  )

      	; Validates that each employee's skills are in order.
(define (employees_ok? shiftList employeeList) 
  (cond ((null? shiftList) #T)                                   ; If reached the end then return true.
	((eqv? #F (skills_ok? (car shiftList) employeeList)) #F) ; If skills_ok returns an #F then return false.
	(else (employees_ok? (cdr shiftList) employeeList))      ; Go to the next name.
	)
  )

      	; Checks the lists for duplicate items.

(define (duplicates? lst)
  (cond ((null? lst) #F) ; If it's empty return false.
	((member (car lst) (cdr lst)) #T) ; Does the car match anything in the cdr?
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

(define (getSkills employeeList name)
  (cond ((null? employeeList) #F)
	((eqv? name (caar employeeList)) (cdar employeeList)) ;
	(else (getSkills (cdr employeeList) name))
	)
  )

   	; Checks a name to see if they have phone skills.

(define (phoneSkill? employeeList name)
  (cond ((= 1 (car (getSkills employeeList name))) #T)
	(else #F)
	)
  )

       	; Checks a name to see if they have computer skills.

(define (compSkill? employeeList name)
  (cond ((= 1 (cadr (getSkills employeeList name))) #T)
	(else #F)
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

(define (getSkills employeeList name)
  (cond ((null? employeeList) #F)
        ((eqv? name (caar employeeList)) (cdar employeeList)) ;
        (else (getSkills (cdr employeeList) name))
        )
  )

        ; Checks a name to see if they have phone skills.

(define (phoneSkill? employeeList name)
  (cond ((= 1 (car (getSkills employeeList name))) #T)
        (else #F)
        )
  )

        ; Checks a name to see if they have computer skills.

(define (compSkill? employeeList name)
  (cond ((= 1 (cadr (getSkills employeeList name))) #T)
        (else #F)
        )
  )

        ; Checks a name to see if they have network skills.

(define (networkSkill? employeeList name)
  (cond ((= 1 (caddr (getSkills employeeList name))) #T)
        (else #F)
        )
  )

        ; Checks each of the 4-employee lists and validates their job skills.

(define (skills_ok? shiftList employeeList)
  (cond ((eqv? #F (phoneSkill? employeeList (car shiftList))) #F)
        ((eqv? #F (phoneSkill? employeeList (cadr shiftList))) #F)
        ((eqv? #F (compSkill? employeeList (caddr shiftList))) #F)
        ((eqv? #F (networkSkill? employeeList (cadddr shiftList))) #F)
        )
  )
         	; Checks a name to see if they have network skills.

(define (networkSkill? employeeList name)
  (cond ((= 1 (caddr (getSkills employeeList name))) #T)
	(else #F)
	)
  )

       	; Checks each of the 4-employee lists and validates their job skills.

(define (skills_ok? shiftList employeeList)
  (cond ((eqv? #F (phoneSkill? employeeList (car shiftList))) #F)
	((eqv? #F (phoneSkill? employeeList (cadr shiftList))) #F)
	((eqv? #F (compSkill? employeeList (caddr shiftList))) #F)
	((eqv? #F (networkSkill? employeeList (cadddr shiftList))) #F)
	)
  )








