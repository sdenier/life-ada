with Game_Of_Life.Cells; use Game_Of_Life.Cells;
with Game_Of_Life.Neighbours; use Game_Of_Life.Neighbours;

package Game_Of_Life.Rules is
	
	function Next_State(Cell       : in T_Cell;
							  Neighbours : in T_Cell_Neighbours) return Boolean;
	
end Game_Of_Life.Rules;
