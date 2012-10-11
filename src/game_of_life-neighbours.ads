with Game_Of_Life.Cells; use Game_Of_Life.Cells;

package Game_Of_Life.Neighbours is

	type T_Cell_Neighbours is array (Integer range 1 .. 8) of T_Cell;
		
	function Get_Neighbours(Cell : in T_Cell) return T_Cell_Neighbours;

	-- Any live cell with fewer than two live neighbours dies, as if caused by under-population
	function Under_Population(Neighbours: in T_Cell_Neighbours) return Boolean;

	-- Any live cell with more than three live neighbours dies, as if by overcrowding.
	function Overcrowding(Neighbours: in T_Cell_Neighbours) return Boolean;

	-- Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
	function Reproduction(Neighbours: in T_Cell_Neighbours) return Boolean;

end Game_Of_Life.Neighbours;
