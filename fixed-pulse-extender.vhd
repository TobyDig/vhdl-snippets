library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.utils.all;

entity test is
	
	generic(
		n	: positive := 8
	);

	port(
		load_en		: in 	std_logic;
		clk			: in 	std_logic;
		pulse_out	: out 	std_logic
	);
	
end test;


architecture behaviour of test is
	
	constant s			: integer := log2ceil(n+1);
	constant count_in	: std_logic_vector(s-1 downto 0) := std_logic_vector(to_unsigned(n, s));
	
	signal count 		: std_logic_vector(s-1 downto 0) := (others => '0');
	signal lsb_edge		: std_logic;
	signal pulse		: std_logic;
	signal load_ff		: std_logic;
	signal or_chain		: std_logic_vector(s-1 downto 0);
	
begin
	
	process (clk)
	begin
	
		if rising_edge(clk) then
			if load_en = '1' then
				count <= count_in;
			elsif (count > 0) then
				count <= count - 1;
			end if;
			load_ff <= load_en;
			lsb_edge <= count(0);
		end if;	
		
	end process;
	
	gen_or : for i in 0 to s-2 generate
		or_chain(i) <= or_chain(i+1) or count(i);
	end generate gen_or;
	or_chain(s-1) <= count(s-1);
	
	pulse <= lsb_edge or or_chain(0);
	pulse_out <= pulse and not load_ff;
	

end behaviour;


