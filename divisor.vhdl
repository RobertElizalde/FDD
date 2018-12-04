	library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
	entity divisor is
		port(clk, clr: in std_logic;
			sal : out std_logic_vector(7 downto 0));
	end divisor;
	
	architecture clk_div of divisor is
	signal qaux: std_logic_vector(28 downto 0);
	begin
		process(clk,clr,qaux)is
			begin
			if( clr = '1' ) then qaux <=(others =>'0');
			elsif(clk'event and clk='1') then
				qaux <= qaux+1;
			end if;
			if(qaux(28 downto 21)= "00001010") then 
				qaux(28 downto 21)<= "00000000";
			end if;
		end process;
	sal <=qaux(28 downto 21);
	end clk_div; 
