	library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
	entity reloj is
	port(clr : in std_logic;
			Ao, Bo, Co, Do, Eo, Fo, Go: out std_logic;
			Am, Bm, Cm, Dm, Em, Fm, Gm,Hm: out std_logic;
			qsal2: inout std_logic_vector(7 downto 0);
			qsal: inout std_logic_vector(7 downto 0));
	end reloj;
	
	architecture reloj_final of reloj is
	
	component osc00 is
	port(
       osc_int0: out std_logic);
	end component;
	
	component divisor is
		port(clk, clr: in std_logic;
			sal : out std_logic_vector(7 downto 0));
	end component;
	
	component decodificador0 is
	port(
       A, B, C, D: in std_logic;
	   Ao, Bo, Co, Do, Eo, Fo, Go: out std_logic);
	end component;
	
	signal qaux:std_logic;
	signal qsalx:std_logic_vector(7 downto 0);
	begin 
	
	cto1: osc00 port map(osc_int0=>qaux);
	cto2: divisor port map(clk =>qaux, clr =>clr, sal => qsal);
	cto3: decodificador0 port map(qsal(3),qsal(2),qsal(1),qsal(0),Ao, Bo, Co, Do, Eo, Fo, Go);
	
	process(qsal, qsalx) is
		begin
		if(qsal(3 downto 0)="0001" or  qsal(3 downto 0)="0100" or qsal(3 downto 0)="1000") then
			qsalx <= qsalx + 1;
		end if;
		--if(qsal2(3 downto 0)="0110") then
			--qsal2<=(others =>'0');
		--end if;
	end process;
	qsal2<=qsalx;
	--cto4: decodificador0 port map(qsal2(3),qsal2(2),qsal2(1),qsal2(0),Am, Bm, Cm, Dm, Em, Fm, Gm);
	end reloj_final;   
	
	
