package body Game_Of_Life.Rules is
	
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
	
end Game_Of_Life.Rules;
