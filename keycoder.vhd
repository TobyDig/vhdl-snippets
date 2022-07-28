library ieee;
use ieee.std_logic_1164.all;

library tad64;
use tad64.comcodes.all;
use tad64.utils.all;

entity keycoder is
	
	generic(
		k : integer := 77 -- number of standard keys (77 or 58)
	);
	
    port(
        stdkey  : in std_logic_vector(k-1 downto 0);
        keycode : out std_logic_vector(6 downto 0)
    );

end keycoder;

architecture dataflow of keycoder is

begin

    with stdkey select
        keycode <=  std_key_table(00)   when slv_onehot(00, k),
                    std_key_table(01)   when slv_onehot(01, k),
                    std_key_table(02)   when slv_onehot(02, k),
                    std_key_table(03)   when slv_onehot(03, k),
                    std_key_table(04)   when slv_onehot(04, k),
                    std_key_table(05)   when slv_onehot(05, k),
                    std_key_table(06)   when slv_onehot(06, k),
                    std_key_table(07)   when slv_onehot(07, k),
                    std_key_table(08)   when slv_onehot(08, k),
                    std_key_table(09)   when slv_onehot(09, k),
                    std_key_table(10)   when slv_onehot(10, k),
                    std_key_table(11)   when slv_onehot(11, k),
                    std_key_table(12)   when slv_onehot(12, k),
                    std_key_table(13)   when slv_onehot(13, k),
                    std_key_table(14)   when slv_onehot(14, k),
                    std_key_table(15)   when slv_onehot(15, k),
                    std_key_table(16)   when slv_onehot(16, k),
                    std_key_table(17)   when slv_onehot(17, k),
                    std_key_table(18)   when slv_onehot(18, k),
                    std_key_table(19)   when slv_onehot(19, k),
                    std_key_table(20)   when slv_onehot(20, k),
                    std_key_table(21)   when slv_onehot(21, k),
                    std_key_table(22)   when slv_onehot(22, k),
                    std_key_table(23)   when slv_onehot(23, k),
                    std_key_table(24)   when slv_onehot(24, k),
                    std_key_table(25)   when slv_onehot(25, k),
                    std_key_table(26)   when slv_onehot(26, k),
                    std_key_table(27)   when slv_onehot(27, k),
                    std_key_table(28)   when slv_onehot(28, k),
                    std_key_table(29)   when slv_onehot(29, k),
                    std_key_table(30)   when slv_onehot(30, k),
                    std_key_table(31)   when slv_onehot(31, k),
                    std_key_table(32)   when slv_onehot(32, k),
                    std_key_table(33)   when slv_onehot(33, k),
                    std_key_table(34)   when slv_onehot(34, k),
                    std_key_table(35)   when slv_onehot(35, k),
                    std_key_table(36)   when slv_onehot(36, k),
                    std_key_table(37)   when slv_onehot(37, k),
                    std_key_table(38)   when slv_onehot(38, k),
                    std_key_table(39)   when slv_onehot(39, k),
                    std_key_table(40)   when slv_onehot(40, k),
                    std_key_table(41)   when slv_onehot(41, k),
                    std_key_table(42)   when slv_onehot(42, k),
                    std_key_table(43)   when slv_onehot(43, k),
                    std_key_table(44)   when slv_onehot(44, k),
                    std_key_table(45)   when slv_onehot(45, k),
                    std_key_table(46)   when slv_onehot(46, k),
                    std_key_table(47)   when slv_onehot(47, k),
                    std_key_table(48)   when slv_onehot(48, k),
                    std_key_table(49)   when slv_onehot(49, k),
                    std_key_table(50)   when slv_onehot(50, k),
                    std_key_table(51)   when slv_onehot(51, k),
                    std_key_table(52)   when slv_onehot(52, k),
                    std_key_table(53)   when slv_onehot(53, k),
                    std_key_table(54)   when slv_onehot(54, k),
                    std_key_table(55)   when slv_onehot(55, k),
                    std_key_table(56)   when slv_onehot(56, k),
                    std_key_table(57)   when slv_onehot(57, k),
                    std_key_table(58)   when slv_onehot(58, k),
                    std_key_table(59)   when slv_onehot(59, k),
                    std_key_table(60)   when slv_onehot(60, k),
                    std_key_table(61)   when slv_onehot(61, k),
                    std_key_table(62)   when slv_onehot(62, k),
                    std_key_table(63)   when slv_onehot(63, k),
                    std_key_table(64)   when slv_onehot(64, k),
                    std_key_table(65)   when slv_onehot(65, k),
                    std_key_table(66)   when slv_onehot(66, k),
                    std_key_table(67)   when slv_onehot(67, k),
                    std_key_table(68)   when slv_onehot(68, k),
                    std_key_table(69)   when slv_onehot(69, k),
                    std_key_table(70)   when slv_onehot(70, k),
                    std_key_table(71)   when slv_onehot(71, k),
                    std_key_table(72)   when slv_onehot(72, k),
                    std_key_table(73)   when slv_onehot(73, k),
                    std_key_table(74)   when slv_onehot(74, k),
                    std_key_table(75)   when slv_onehot(75, k),
                    std_key_table(76)   when slv_onehot(76, k),
                    c_NUL               when others;

end dataflow;