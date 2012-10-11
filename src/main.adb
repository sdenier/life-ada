with Game_Of_Life.Grids; use Game_Of_Life.Grids;

procedure Main is
	Grid : T_Grid;
begin
	Grid := Glider_Grid;
	loop
		Display_Grid(Grid);
		delay 1.0;
		Grid := Next_Generation(Grid);
	end loop;
end Main;
