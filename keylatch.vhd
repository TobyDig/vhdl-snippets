library ieee;
use ieee.std_logic_1164.all;

library tad64;
use tad64.utils.all;

entity keylatch is
	
	generic(
		k : integer := 77
	);
	
	port(
		input : in std_logic_vector(k-1 downto 0);
		output : out std_logic_vector(k-1 downto 0)
	);
	
end keylatch;


architecture behaviour of keylatch is
	
begin

	process (input) is
	
	begin
	
		for i in 0 to k-1 loop
			if input(i) = '1' then output <= slv_onehot(i, k); end if;
		end loop;
		
		if input(k-1 downto 0) = slv_zeros(k) then output <= slv_zeros(k); end if;
		
	end process;
	
end behaviour;