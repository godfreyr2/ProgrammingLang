

-- Homework Assignment 2 (Ada)

-- AUTHORS:
-- Ryan Godfrey, Alyssa Kutney, Patrick Jacaszek

with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Homework2 is
   
   -- Createa an array that will hold 4 different shifts with
   -- 4 workers assigned to each shift.
   
   type JobShift is array(1..4, 1..4) of Character;
   Job: JobShift; -- "Job" will reference the array called "Jobshift"
   
   
   -- Create an employee record
   type Employee is record
      Name: Character; -- the name will be of type char
      Phone: Integer; -- the phone will be an Intger
      Repair: Integer; -- repair will be of type Integer
      Net: Integer; -- network skill will be of type Integer
   end record;
   
   
   -- Creates an array that holds employee records.  This size
   -- will allow at least 1 or no more than 26 employees as the
   -- directions specify.  
   type EmployeeRecords is array(1..26) of Employee;
   -- "ER" will reference the array called "EmployeeRecords"
   ER: EmployeeRecords; 
   NumberOfEmployees: Integer; --The exact amount of records to compute.
   
   
   -- Computes 4 different lines of 4 charachters each, including the spaces, 
   -- and places them in the array called "Jobshift"
   procedure GetShifts is   
      ws: Character; -- Helps deal with the white spaces "ws" between the chars.
   begin
      for I in Job'Range(1) loop
	 Get(Job(I, 1));
	 Get(ws); -- Get the white space
	 Get(Job(I, 2));
	 Get(ws); -- Get the white space
	 Get(Job(I, 3));
	 Get(ws); -- Get the white space
	 Get(Job(I, 4));
	 Skip_Line;
      end loop;
   end GetShifts;
   
  
   -- The ASCII value of a capital or lower case letters, mod by 32, will give
   -- the same result.  "a" or "A" mod 32 = 1. "b" or "B" mod 32 = 2 and so on.
   -- This function checks the ASCII value and then uses a sencond array called
   -- Temp.  The default value for this array will be set to False.  As it 
   -- iterates through each value in the array called "Job" it will take the 
   -- ASCII value and match the index in the temp array and flip that index to 
   -- true.  If it lands on the same spot and finds a boolean value of true 
   -- then there must be a dupe.
   function CheckDupes return Boolean is
      type Temp is array(1..26) of Boolean with Default_Component_Value => False;
      T: Temp; -- "T" will reference the array called "Temp"
   begin      
      for X in Job'Range(1) loop -- For every char in the row
	 for I in Job'Range(2)  loop	-- and every column    
	    -- (If the current position in the Temp array mod by 32) boolean
	    -- value is false then flip it to true
	    if T(Character'Pos(Job(X, I)) mod 32) = False then 
	       T(Character'Pos(Job(X, I)) mod 32) := True;
	    else  -- If we end up here then there was a dupe found.
	       return True;
	    end if;
	 end loop;
      end loop;
      
      return False;  -- If we end up here then there were no dupes.
   end CheckDupes;
   
   
   -- Gets the records by starting a loop from 1 to N and taking in
   -- the rest of the input, after the NumberOfEmployees Integer, as 
   -- the employee records.
   procedure GetRecords is 
   begin
      for X in 1.. NumberOfEmployees loop
	 Get(ER(X).Name); -- assign the first char to Name
	 Get(ER(X).Phone); -- assign the second char to Phone 
	 Get(ER(X).Repair); -- assign the third char to Comp Repair
	 Get(ER(X).Net); -- assign the fourth char to Network skills
	 Skip_Line;
      end loop;    
   end GetRecords;
   
   
   -- Checks to see if the current employee has Phone skills
   function PhoneSkills(Name: in Character) return Boolean is
      Rec: Employee;
   begin
      for X in 1..NumberOfEmployees loop -- start a loop from the employeed size
	 if ER(X).Name = Name then 
	    Rec := ER(X);
	    exit;
	 end if;	    
      end loop;
      return Rec.Phone = 1;
   end PhoneSkills;
   
   
   -- Checks to see if the current employee has Computer Repair skills
   function RepairSkills(Name: in Character) return Boolean is
      Rec: Employee;
   begin
      for X in 1..NumberOfEmployees loop
	 if ER(X).Name = Name then
	    Rec := ER(X);
	    exit;
	 end if;	    
      end loop;
      return Rec.Repair = 1;
   end RepairSkills;
   
   -- Checks to see if the current employee has Network skills
   function NetworkSkills(Name: in Character) return Boolean is
      Rec: Employee;
   begin
      for X in 1..NumberOfEmployees loop
	 if ER(X).Name = Name then
	    Rec := ER(X);
	    exit;
	 end if;	    
      end loop;
      return Rec.Net = 1;
   end NetworkSkills;
   
   -- Checks that the assigned shifts are satisfactory.
   function ShiftsOk return Boolean is
   begin
      for X in Job'Range(1) loop
	 if not PhoneSkills(Job(X,1)) or not PhoneSkills(Job(X,2))
	    or not RepairSkills(Job(X,3)) or not NetworkSkills(Job(X,4)) then
	    return False;
	 end if;	 
      end loop;            
      return True;
   end ShiftsOk;
   
   
   
   --Homework2's main method.  If all is good, return "Acceptable"
   --If things are not good, return "Not Acceptable"

begin

   GetShifts;
   Get(NumberOfEmployees);
   GetRecords;
   
   
   -- After all of the input is either manually entered or
   -- received from another file this part should execute.
   if ShiftsOk = False or CheckDupes = True Then
      Put_Line("Not Acceptable");
      return;
   else
      Put_Line("Acceptable");
   end if;
   
   
   
end Homework2;   
