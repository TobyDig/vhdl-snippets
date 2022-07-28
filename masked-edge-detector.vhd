library ieee;
use ieee.std_logic_1164.all;

entity test is
	
	generic(
		s	: positive := 8
	);

	port(
		sig_in	: in	std_logic_vector(s-1 downto 0);
		mask	: in	std_logic_vector(s-1 downto 0);
		clk		: in 	std_logic;
		sig_out	: out 	std_logic_vector(s-1 downto 0)
	);
	
end test;


architecture behaviour of test is

	signal sync	: std_logic_vector(s-1 downto 0) := (others => '0');
	signal edge	: std_logic_vector(s-1 downto 0) := (others => '0');
	
begin
	
	process (clk)
	begin
		if rising_edge(clk) then
			sync <= sig_in;
			edge <= sync;
		end if;
	end process;
	
	sig_out <= mask and sync and not edge;

end behaviour;

