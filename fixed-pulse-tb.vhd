library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end testbench;


architecture implementation of testbench is	

	component test is
	
        generic(
            n	: positive := 8
        );
    
        port(
            load_en		: in 	std_logic;
            clk			: in 	std_logic;
            pulse_out	: out 	std_logic
        );       
		
	end component;

	signal load_en		:	std_logic := '0';
	signal clk			:	std_logic := '0';
	signal pulse_out	:	std_logic := '0';

begin

	cmp : test
        generic map(5)
		port map (load_en, clk, pulse_out);

	clk <= not clk after 5 ns;
	
	process
	
	begin
		
		wait for 10 ns;

		load_en <= '1';

		wait for 10 ns;

		load_en <= '0';

		wait for 100 ns;

		load_en <= '1';

		wait for 10 ns;

		load_en <= '0';

		wait;
		
	end process;

end implementation;