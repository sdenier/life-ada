with Text_IO; use Text_IO;

package body Game_Of_Life.Cells is

	function Live_Cell return T_Cell is
	begin
		return (Live => True);
	end Live_Cell;
	
	function Dead_Cell return T_Cell is
	begin
		return (Live => False);
	end Dead_Cell;
	
	function Is_Alive(Cell : in T_Cell) return Boolean is
	begin
		return Cell.Live;
	end Is_Alive;
	
	procedure Display(Cell : in T_Cell) is
	begin
		if Is_Alive(Cell) then
			Put("O");
		else
			Put("-");
		end if;
	end Display;

end Game_Of_Life.Cells;
