package Game_Of_Life.Cells is

	type T_Cell is private;

	function Live_Cell return T_Cell;
	function Dead_Cell return T_Cell;

	function Is_Alive(Cell : in T_Cell) return Boolean;

	procedure Display(Cell : in T_Cell);

private

	type T_Cell is record
		Live : Boolean := False;
	end record;

end Game_Of_Life.Cells;
