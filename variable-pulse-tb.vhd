library ieee;
use ieee.std_logic_1164.all;

entity testbench is
	generic(
		s	: positive := 8
	);
end testbench;


architecture implementation of testbench is	

	component test is
		
		generic(
			s	: positive := 8
		);

		port(
			count_in	: in 	std_logic_vector(s-1 downto 0);
			load_en		: in 	std_logic;
			clk			: in 	std_logic;
			pulse_out	: out 	std_logic
		);
		
	end component;

	signal count_in		:	std_logic_vector(s-1 downto 0) := (others => '0');
	signal load_en		:	std_logic := '0';
	signal clk			:	std_logic := '0';
	signal pulse_out	:	std_logic := '0';

begin

	cmp : test
		generic map(s)
		port map (count_in, load_en, clk, pulse_out);

	clk <= not clk after 5 ns;
	
	process
	
	begin
		
		wait for 10 ns;

		count_in <= "00001000";
		load_en <= '1';

		wait for 10 ns;

		load_en <= '0';

		wait for 100 ns;

		count_in <= "00000001";
		load_en <= '1';

		wait for 10 ns;

		load_en <= '0';

		wait;
		
	end process;

end implementation;