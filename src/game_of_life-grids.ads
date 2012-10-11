with Game_Of_Life.Cells; use Game_Of_Life.Cells;
with Game_Of_Life.Neighbours; use Game_Of_Life.Neighbours;

package Game_Of_Life.Grids is
	
	type T_Grid is private;
	
	function Blinker_Grid return T_Grid;
	
	procedure Display_Grid(Grid : in T_Grid);
	
	function Get_Neighbours(Grid : in T_Grid; Row : in Positive; Column : in Positive) return T_Cell_Neighbours;
		
	function Next_Generation(Grid : in T_Grid) return T_Grid;

private

	type T_Grid is array (1 .. 5, 1 .. 5) of T_Cell;
	
end Game_Of_Life.Grids;
