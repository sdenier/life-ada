package Game_Of_Life is
	
	type T_Game is private;
	
	procedure Run(Game : in out T_Game);
	
private

	type T_Game is null record;
	
end Game_Of_Life;
