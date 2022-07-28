library ieee;
use ieee.std_logic_1164.all;
use work.comcodes.all;
use work.utils.all;

entity test is
	
	generic(
		k : integer := 77; -- number of keys
		c : integer := 7 -- number of bits in output key code
	);
	
	port(
		key		: in std_logic_vector(k-1 downto 0);
		code	: out std_logic_vector(c-1 downto 0);
		clk		: in std_logic
	);
	
end test;


architecture behaviour of test is

	signal key_edge	: std_logic_vector(k-1 downto 0);
	signal key_hold : std_logic_vector(k-1 downto 0);
	signal ff_sync	: std_logic_vector(k-1 downto 0);
	signal ff_edge	: std_logic_vector(k-1 downto 0);
	signal code_buf	: std_logic_vector(c-1 downto 0);
	
begin

	process (clk) is
	begin
	
		if rising_edge(clk) then
			ff_sync <= key;
			ff_edge <= ff_sync;
		end if;
		
	end process;
	
	process (key_edge, key_hold) is
	begin
	
		for i in 0 to k-1 loop
			if key_edge(i) = '1' then 
				code_buf <= std_key_table(i);
			end if;
		end loop;
		
		if key_hold = slv_zeros(k) then 
			code_buf <= (others => '0');
		end if;
		
	end process;
	
	key_edge <= ff_sync and (not ff_edge);
	key_hold <= ff_sync;
	code <= code_buf;
	
end behaviour;