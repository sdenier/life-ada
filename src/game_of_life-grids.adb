with Text_IO; use Text_IO;
with Game_Of_Life.Rules; use Game_Of_Life.Rules;
with Game_Of_Life.Neighbours; use Game_Of_Life.Neighbours;

package body Game_Of_Life.Grids is

	function O return T_Cell renames Live_Cell;
	function x return T_Cell renames Dead_Cell;

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
		Neighbours : T_Cell_Neighbours;
	begin
			return (x, x, x, x, x, O, O, O);
	end Get_Neighbours;

end Game_Of_Life.Grids;
