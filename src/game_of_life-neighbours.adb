package body Game_Of_Life.Neighbours is

	function Get_Neighbours(Cell : in T_Cell) return T_Cell_Neighbours is
	begin
		return (others => (Live_Cell));
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

	function Under_Population(Neighbours: in T_Cell_Neighbours) return Boolean is
	begin
		return Alive_Count(Neighbours) < 2;
	end Under_Population;

	function Overcrowding(Neighbours: in T_Cell_Neighbours) return Boolean is
	begin
		return Alive_Count(Neighbours) > 3;
	end Overcrowding;

	function Reproduction(Neighbours: in T_Cell_Neighbours) return Boolean is
	begin
		return Alive_Count(Neighbours) = 3;
	end Reproduction;

end Game_Of_Life.Neighbours;
