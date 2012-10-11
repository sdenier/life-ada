with Game_Of_Life; use Game_Of_Life;
with Text_IO; use Text_IO;

procedure Main is
	Cell       : T_Cell;
	Neighbours : T_Cell_Neighbours;
begin
	Cell       := Live_Cell;
	Neighbours := Get_Neighbours(Cell);
	
	for Index in Neighbours'Range loop
		Display(Neighbours(Index));
	end loop;
	
	New_Line;
	Put_Line(Next_State(Cell, Get_Neighbours(Cell))'Img);
	
end Main;
