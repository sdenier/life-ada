package Game_Of_Life is
	
	type T_Cell is private;
	
	function Live_Cell return T_Cell;
	
	function Is_Alive(Cell : in T_Cell) return Boolean;
	
	procedure Display(Cell : in T_Cell);
	
	type T_Cell_Neighbours is array (Integer range 1 .. 8) of T_Cell;
	
	function Get_Neighbours(Cell : in T_Cell) return T_Cell_Neighbours;
	
	function Next_State(Cell       : in T_Cell;
							  Neighbours : in T_Cell_Neighbours) return Boolean;
	
private

	type T_Cell is record
		Live : Boolean := False;
	end record;
	
end Game_Of_Life;
