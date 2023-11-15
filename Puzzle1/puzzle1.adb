with Ada.Text_IO;		use Ada.Text_IO;
with Ada.Integer_Text_IO;	use Ada.Integer_Text_IO;

procedure Puzzle1 is
	
	File_Char		: Character;
	Current_Floor		: Integer := 0;
	Character_Position	: Positive := 1;
	Increment_Position	: Boolean := false;

	F		: File_Type;
	File_Name	: constant String := "puzzle1_input.dat";
	
begin
	Open (F, In_File, File_Name);

	while not End_Of_File (F) loop

		Get (F, File_Char);
		
		case File_Char is
			when '(' =>
				Current_Floor := Current_Floor + 1;
			when ')' =>
				Current_Floor := Current_Floor - 1;
			when others =>
				Put_Line ("ERROR :: Invalid Character!");
		end case;

		if Current_Floor = -1 and Increment_Position = false then
			Increment_Position := true;
		elsif Increment_Position = false then
			Character_Position := Character_Position + 1;
		end if;

	end loop;

	Close (F);
	
	Put_Line ("Part 1 Answer:" & Current_Floor'Image);
	Put_Line ("Part 2 Answer:" & Character_Position'Image);

end Puzzle1;
