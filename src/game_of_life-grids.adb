with Text_IO; use Text_IO;
with Game_Of_Life.Rules; use Game_Of_Life.Rules;
with Game_Of_Life.Neighbours; use Game_Of_Life.Neighbours;

package body Game_Of_Life.Grids is

	function O return T_Cell renames Live_Cell;
	function x return T_Cell renames Dead_Cell;
	
	function Block_Grid return T_Grid is
	begin
		return ((x, x, x, x, x),
				  (x, O, O, x, x),
				  (x, O, O, x, x),
				  (x, x, x, x, x),
				  (x, x, x, x, x));
	end Block_Grid;

   ------------------
   -- Blinker_Grid --
   ------------------

   function Blinker_Grid return T_Grid is
   begin
		return ((x, x, x, x, x),
				  (x, x, x, x, x),
				  (x, O, O, O, x),
				  (x, x, x, x, x),
				  (x, x, x, x, x));
   end Blinker_Grid;

   function Toad_Grid return T_Grid is
   begin
		return ((x, x, x, x, x),
				  (x, x, x, x, x),
				  (x, x, O, O, O),
				  (x, O, O, O, x),
				  (x, x, x, x, x));
   end Toad_Grid;

   function Glider_Grid return T_Grid is
   begin
		return ((x, O, x, x, x),
				  (x, x, O, x, x),
				  (O, O, O, x, x),
				  (x, x, x, x, x),
				  (x, x, x, x, x));
   end Glider_Grid;

   ------------------
   -- Display_Grid --
   ------------------

   procedure Display_Grid (Grid : in T_Grid) is
   begin
		for Row in 1..5 loop
			for Column in 1..5 loop
				Display(Grid(Row, Column));
			end loop;	
			New_Line;
		end loop;	
		New_Line;
   end Display_Grid;

	function Next_Generation(Grid : in T_Grid) return T_Grid is
		New_Grid       : T_Grid;
		Old_Cell       : T_Cell;
		Old_Neighbours : T_Cell_Neighbours;
	begin
		for Row in 1..5 loop
			for Column in 1..5 loop
				Old_Cell       := Grid(Row, Column);
				Old_Neighbours := Get_Neighbours(Grid, Row, Column);
				
				if Next_State(Old_Cell, Old_Neighbours) then
					New_Grid(Row, Column) := Live_Cell;
				else
					New_Grid(Row, Column) := Dead_Cell;
				end if;
			end loop;
		end loop;
		
		return New_Grid;
	end Next_Generation;
	
	function Get_Neighbours(Grid : in T_Grid; Row : in Positive; Column : in Positive) return T_Cell_Neighbours is
		Neighbours : T_Cell_Neighbours := (others => Dead_Cell);
	begin
		if Row > 1 then
			if Column > 1 then
				Neighbours(1) := Grid(Row - 1, Column - 1);
			end if;
			Neighbours(2) := Grid(Row - 1, Column);
			if Column < 5 then
				Neighbours(3) := Grid(Row - 1, Column + 1);
			end if;
		end if;
		
		if Column > 1 then
			Neighbours(4) := Grid(Row ,    Column - 1);
		end if;
		if Column < 5 then
			Neighbours(5) := Grid(Row,     Column + 1);
		end if;
		
		if Row < 5 then
			if Column > 1 then
				Neighbours(6) := Grid(Row + 1, Column - 1);
			end if;
			Neighbours(7) := Grid(Row + 1, Column);
			if Column < 5 then
				Neighbours(8) := Grid(Row + 1, Column + 1);
			end if;
		end if;
		return Neighbours;
	end Get_Neighbours;

end Game_Of_Life.Grids;
