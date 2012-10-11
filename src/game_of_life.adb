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

	function Alive_Count(Neighbours : in T_Cell_Neighbours) return Natural is
		Count : Natural := 0;
	begin
		for Index in T_Cell_Neighbours'Range loop
			if (Is_Alive(Neighbours(Index))) then
				Count := Count + 1;
			end if;
		end loop;
		
		return Count;
	end Alive_Count;

	-- Any live cell with fewer than two live neighbours dies, as if caused by under-population
	function Under_Population(Neighbours: in T_Cell_Neighbours) return Boolean is
	begin
		return Alive_Count(Neighbours) < 2;
	end Under_Population;

	-- Any live cell with more than three live neighbours dies, as if by overcrowding.
	function Overcrowding(Neighbours: in T_Cell_Neighbours) return Boolean is
	begin
		return Alive_Count(Neighbours) > 3;
	end Overcrowding;

	-- Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
	function Reproduction(Neighbours: in T_Cell_Neighbours) return Boolean is
	begin
		return Alive_Count(Neighbours) = 3;
	end Reproduction;
	
	function Next_State(Cell       : in T_Cell;
							  Neighbours : in T_Cell_Neighbours) return Boolean is
	begin
		if Is_Alive(Cell) then
			if (Under_Population(Neighbours) or Overcrowding(Neighbours)) then
				return False;
			else
				return True;
			end if;
		elsif Reproduction(Neighbours) then
			return True;
		else
			return False;
		end if;
	end Next_State;
	
end Game_Of_Life;
