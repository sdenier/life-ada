with Text_IO; use Text_IO;

package body Game_Of_Life is
	
	function Live(Cell : in T_Cell) return Boolean is
	begin
		return Cell.Live;
	end Live;
	
	procedure Display(Cell : in T_Cell) is
	begin
		Put_Line(Live(Cell)'Img);
	end Display;
	
end Game_Of_Life;
