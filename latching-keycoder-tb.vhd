
library ieee;
use ieee.std_logic_1164.all;
use work.utils.all;

entity testbench is
	generic(
		k : integer := 77; -- number of keys
		c : integer := 7 -- number of bits in output key code
	);
end testbench;


architecture implementation of testbench is	

component test is
		
	generic(
		k : integer := 77; -- number of keys
		c : integer := 7 -- number of bits in output key code
	);
	
	port(
		key		: in std_logic_vector(k-1 downto 0);
		code	: out std_logic_vector(c-1 downto 0);
		clk		: in std_logic
	);
	
end component;

	
	signal input : std_logic_vector(k-1 downto 0);
	signal output : std_logic_vector(c-1 downto 0);
	signal clk : std_logic := '0';
	signal in0 : std_logic := '0';
	signal in1 : std_logic := '0';
	signal in2 : std_logic := '0';
	signal in3 : std_logic := '0';
	signal in4 : std_logic := '0';
	signal in5 : std_logic := '0';
	signal in6 : std_logic := '0';
	signal in7 : std_logic := '0';
	signal inremaining : std_logic_vector(k-1 downto 8) := slv_zeros(k-8);
	
begin

	input(0) <= in0;
	input(1) <= in1;
	input(2) <= in2;
	input(3) <= in3;
	input(4) <= in4;
	input(5) <= in5;
	input(6) <= in6;
	input(7) <= in7;
	input(k-1 downto 8) <= inremaining;
	

	cmp : test
		port map (input, output, clk);

	clk <= not clk after 5 ns;
	
	process
	
	begin
		
		wait for 20 ns;
		
		in0 <= '1';
		
		wait for 10 ns;
		
		in0 <= '0';
		
		wait for 10 ns;
		
		in3 <= '1';
		
		wait for 10 ns;
		
		in3 <= '0';
		
		wait for 10 ns;
		
		in7 <= '1';
		
		wait for 10 ns;
		
		in5 <= '1';

		wait for 10 ns;

		in4 <= '1';
		
		wait for 10 ns;
		
		in7 <= '0';
		
		wait for 10 ns;
		
		in5 <= '0';

		wait for 10 ns;

		in4 <= '0';
		
		wait;
		
	end process;



end implementation;