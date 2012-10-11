with Text_IO; use Text_IO;

package body Game_Of_Life is
	
	function Live_Cell return T_Cell is
	begin
		return (Live => True);
	end Live_Cell;
	
	function Is_Alive(Cell : in T_Cell) return Boolean is
	begin
		return Cell.Live;
	end Is_Alive;
	
	procedure Display(Cell : in T_Cell) is
	begin
		if Is_Alive(Cell) then
			Put("O");
		else
			Put(" ");
		end if;
	end Display;
	
	function Get_Neighbours(Cell : in T_Cell) return T_Cell_Neighbours is
	begin
		return (others => (Live => True));
	end Get_Neighbours;
	
	function Next_State(Cell       : in T_Cell;
							  Neighbours : in T_Cell_Neighbours) return Boolean is
	begin
		if Is_Alive(Cell) then
			return True;
		else
			return False;
		end if;
	end Next_State;
	
end Game_Of_Life;
