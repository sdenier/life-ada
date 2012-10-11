with Game_Of_Life.Cells; use Game_Of_Life.Cells;
with Game_Of_Life.Neighbours; use Game_Of_Life.Neighbours;
with Game_Of_Life.Rules; use Game_Of_Life.Rules;
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
