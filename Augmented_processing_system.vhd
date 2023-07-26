library std; use std.standard.all;
library ieee; use ieee.numeric_std.all; use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity Augmented_processing_system is
    port(clk, reset_n, uart_rxd : in std_logic;
			uart_txd : out std_logic);
end entity;

architecture behave of Augmented_processing_system is
	COMPONENT MY_PROCESSING_SYSTEM is
	port (
		clk_clk            : in  std_logic                     := '0';             --         clk.clk
		count_for_c_export : in  std_logic_vector(31 downto 0) := (others => '0'); -- count_for_c.export
		inp1a_export       : out std_logic_vector(31 downto 0);                    --       inp1a.export
		inp1b_export       : out std_logic_vector(31 downto 0);                    --       inp1b.export
		inp2a_export       : out std_logic_vector(31 downto 0);                    --       inp2a.export
		inp2b_export       : out std_logic_vector(31 downto 0);                    --       inp2b.export
		inp3a_export       : out std_logic_vector(31 downto 0);                    --       inp3a.export
		inp3b_export       : out std_logic_vector(31 downto 0);                    --       inp3b.export
		inp4a_export       : out std_logic_vector(31 downto 0);                    --       inp4a.export
		inp4b_export       : out std_logic_vector(31 downto 0);                    --       inp4b.export
		inp5a_export       : out std_logic_vector(31 downto 0);                    --       inp5a.export
		inp5b_export       : out std_logic_vector(31 downto 0);                    --       inp5b.export
		inp6a_export       : out std_logic_vector(31 downto 0);                    --       inp6a.export
		inp6b_export       : out std_logic_vector(31 downto 0);                    --       inp6b.export
		inp7a_export       : out std_logic_vector(31 downto 0);                    --       inp7a.export
		inp7b_export       : out std_logic_vector(31 downto 0);                    --       inp7b.export
		inp8a_export       : out std_logic_vector(31 downto 0);                    --       inp8a.export
		inp8b_export       : out std_logic_vector(31 downto 0);                    --       inp8b.export
		outp1a_export      : in  std_logic_vector(31 downto 0) := (others => '0'); --      outp1a.export
		outp1b_export      : in  std_logic_vector(31 downto 0) := (others => '0'); --      outp1b.export
		outp2a_export      : in  std_logic_vector(31 downto 0) := (others => '0'); --      outp2a.export
		outp2b_export      : in  std_logic_vector(31 downto 0) := (others => '0'); --      outp2b.export
		outp3a_export      : in  std_logic_vector(31 downto 0) := (others => '0'); --      outp3a.export
		outp3b_export      : in  std_logic_vector(31 downto 0) := (others => '0'); --      outp3b.export
		outp4a_export      : in  std_logic_vector(31 downto 0) := (others => '0'); --      outp4a.export
		outp4b_export      : in  std_logic_vector(31 downto 0) := (others => '0'); --      outp4b.export
		outp5a_export      : in  std_logic_vector(31 downto 0) := (others => '0'); --      outp5a.export
		outp5b_export      : in  std_logic_vector(31 downto 0) := (others => '0'); --      outp5b.export
		outp6a_export      : in  std_logic_vector(31 downto 0) := (others => '0'); --      outp6a.export
		outp6b_export      : in  std_logic_vector(31 downto 0) := (others => '0'); --      outp6b.export
		outp7a_export      : in  std_logic_vector(31 downto 0) := (others => '0'); --      outp7a.export
		outp7b_export      : in  std_logic_vector(31 downto 0) := (others => '0'); --      outp7b.export
		outp8a_export      : in  std_logic_vector(31 downto 0) := (others => '0'); --      outp8a.export
		outp8b_export      : in  std_logic_vector(31 downto 0) := (others => '0'); --      outp8b.export
		reset_reset_n      : in  std_logic                     := '0';             --       reset.reset_n
		start_go_export    : out std_logic_vector(31 downto 0);                    --    start_go.export
		stop_export        : in  std_logic_vector(31 downto 0) := (others => '0'); --        stop.export
		uart_rxd           : in  std_logic                     := '0';             --        uart.rxd
		uart_txd           : out std_logic;                                        --            .txd
		write_ctrl_export  : in  std_logic_vector(31 downto 0) := (others => '0')  --  write_ctrl.export
	);
	END COMPONENT;
	
	COMPONENT DWT IS
	PORT ( clk : IN STD_LOGIC;
			 inp1, inp2, inp3, inp4, inp5, inp6, inp7, inp8 : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
			 outp1, outp2, outp3, outp4, outp5, outp6, outp7, outp8 : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
			 dwt_valid : OUT STD_LOGIC);
	END COMPONENT;
	
	signal dwt_inp1, dwt_inp2, dwt_inp3, dwt_inp4, dwt_inp5, dwt_inp6, dwt_inp7, dwt_inp8,
			 dwt_outp1, dwt_outp2, dwt_outp3, dwt_outp4, dwt_outp5, dwt_outp6, dwt_outp7, dwt_outp8: std_logic_vector(63 downto 0) := (others=>'0');
	
	signal inp1a_export, inp1b_export, inp2a_export, inp2b_export, inp3a_export, inp3b_export, 
			 inp4a_export, inp4b_export, inp5a_export, inp5b_export, inp6a_export, inp6b_export, 
	       inp7a_export, inp7b_export, inp8a_export, inp8b_export, outp1a_export, outp1b_export,
	       outp2a_export, outp2b_export, outp3a_export, outp3b_export, outp4a_export, outp4b_export,
	       outp5a_export, outp5b_export, outp6a_export, outp6b_export, outp7a_export, outp7b_export,
	       outp8a_export, outp8b_export : std_logic_vector(31 downto 0):=(others => '0');
			 
			 	signal inp1a1_export, inp1b1_export, inp2a1_export, inp2b1_export, inp3a1_export, inp3b1_export, 
			 inp4a1_export, inp4b1_export, inp5a1_export, inp5b1_export, inp6a1_export, inp6b1_export : std_logic_vector(31 downto 0):=(others => '0');
			 
	signal start_go : std_logic_vector(31 downto 0)  := (others => '0'); -- pio_0_external_connection.export
	signal write_clkcntrl : std_logic_vector(31 downto 0) ;
	signal stop :std_logic_vector(31 downto 0):= (others => '0'); 
	
			 
   signal dwt_valid : std_logic := '0' ;
	signal reset : std_logic;
	
   signal coproc_inp_reg1, coproc_inp_reg2, coproc_inp_reg3, coproc_inp_reg4,
			 coproc_inp_reg5, coproc_inp_reg6, coproc_inp_reg7, coproc_inp_reg8, 
			 coproc_outp_reg1, coproc_outp_reg2, coproc_outp_reg3, coproc_outp_reg4,
			 coproc_outp_reg5, coproc_outp_reg6, coproc_outp_reg7, coproc_outp_reg8 : std_logic_vector(63 downto 0) := (others=>'0') ;
   --signal coproc_command_reg , coproc_status_reg : std_logic_vector(31 downto 0) := (others=>'0') ;
   --signal state : integer := 0 ;
	type state_type is (s0,s1,s2,s3);
	signal state:state_type:=s0;
	signal nxt_state:state_type:=s0;
	signal count : integer :=1;
	signal cheching_fsm : integer :=0;
	signal count_c : std_logic_vector(31 downto 0);
	signal count1 : integer :=0;
	 
begin
	reset <= not reset_n;
  DWT_inst : DWT port map 
                    (clk => clk, inp1 => dwt_inp1, inp2 => dwt_inp2, inp3 => dwt_inp3, inp4 => dwt_inp4,
						   inp5 => dwt_inp5, inp6 => dwt_inp6, inp7 => dwt_inp7, inp8 => dwt_inp8, outp1 => dwt_outp1,
							outp2 => dwt_outp2, outp3 => dwt_outp3, outp4 => dwt_outp4 , outp5 => dwt_outp5,
							outp6 => dwt_outp6, outp7 => dwt_outp7, outp8 => dwt_outp8, dwt_valid => dwt_valid);
							
  MY_PS_inst : MY_PROCESSING_SYSTEM port map (Clk, count_c, inp1a_export, inp1b_export, inp2a_export, inp2b_export, inp3a_export, inp3b_export, 
			 inp4a_export, inp4b_export, inp5a_export, inp5b_export, inp6a_export, inp6b_export, 
	       inp7a_export, inp7b_export, inp8a_export, inp8b_export, outp1a_export, outp1b_export,
	       outp2a_export, outp2b_export, outp3a_export, outp3b_export, outp4a_export, outp4b_export,
	       outp5a_export, outp5b_export, outp6a_export, outp6b_export, outp7a_export, outp7b_export,
	       outp8a_export, outp8b_export, reset, start_go,stop,uart_rxd, uart_txd,write_clkcntrl);	
					 
 
  dwt_inp1 <= coproc_inp_reg1;
  dwt_inp2 <= coproc_inp_reg2;
  dwt_inp3 <= coproc_inp_reg3;
  dwt_inp4 <= coproc_inp_reg4;
  dwt_inp5 <= coproc_inp_reg5;
  dwt_inp6 <= coproc_inp_reg6;
  dwt_inp7 <= coproc_inp_reg7;
  dwt_inp8 <= coproc_inp_reg8;
  
  outp1a_export <= coproc_outp_reg1(63 downto 32);
  outp1b_export <= coproc_outp_reg1(31 downto 0);
  outp2a_export <= coproc_outp_reg2(63 downto 32);
  outp2b_export <= coproc_outp_reg2(31 downto 0);
  outp3a_export <= coproc_outp_reg3(63 downto 32);
  outp3b_export <= coproc_outp_reg3(31 downto 0);
  outp4a_export <= coproc_outp_reg4(63 downto 32);
  outp4b_export <= coproc_outp_reg4(31 downto 0);
  outp5a_export <= coproc_outp_reg5(63 downto 32);
  outp5b_export <= coproc_outp_reg5(31 downto 0);
  outp6a_export <= coproc_outp_reg6(63 downto 32);
  outp6b_export <= coproc_outp_reg6(31 downto 0);
  outp7a_export <= coproc_outp_reg7(63 downto 32);
  outp7b_export <= coproc_outp_reg7(31 downto 0);
  outp8a_export <= coproc_outp_reg8(63 downto 32);
  outp8b_export <= coproc_outp_reg8(31 downto 0);
  
   process (clk)
		begin 
			
			if(clk'event and clk='1') then
			state <= nxt_state;
			count1 <= count1 + 1;
			count_c <= std_logic_vector(to_unsigned(count1,32));
			
					if(reset='1')  then 
						state<=s0;
					
					elsif(start_go(0)='1') then
						state<=s1;
					 
					end if;
		   end if;
		end process;
	


--state diagram process 	
  process (state,clk)
		begin 
		if (clk'event and clk='1') then
			 nxt_state<= state;
			
					
			
					case (state) is
							when s0  => if(count>=1025 and count <1029 ) then
													
													count <= count+1;
													coproc_outp_reg1 <= dwt_outp1;
													coproc_outp_reg2 <= dwt_outp2;
													coproc_outp_reg3 <= dwt_outp3;
													coproc_outp_reg4 <= dwt_outp4;
													coproc_outp_reg5 <= dwt_outp5;
													coproc_outp_reg6 <= dwt_outp6;
													coproc_outp_reg7 <= dwt_outp7;
													coproc_outp_reg8 <= dwt_outp8;
												   nxt_state <= s0;
													
											elsif(count=1029) then 
													write_clkcntrl(0)<='0';
													count<=0;
													stop(0)<='1';
													nxt_state<= s0;
--											elsif(count> 1028) then
													
											end if;
											if(start_go(0)='1') then
												nxt_state<=s1;
											else
												nxt_state<=s0;
											end if;
							
							when s1  => if(start_go(1)='1')  then 
													nxt_state<= s2;
													cheching_fsm <= 2;
											coproc_inp_reg1 <= inp1a_export & inp1b_export;
											coproc_inp_reg2 <= inp2a_export & inp2b_export;
											coproc_inp_reg3 <= inp3a_export & inp3b_export;
											coproc_inp_reg4 <= inp4a_export & inp4b_export;
											coproc_inp_reg5 <= inp5a_export & inp5b_export;
											coproc_inp_reg6 <= inp6a_export & inp6b_export;
											coproc_inp_reg7 <= inp7a_export & inp7b_export;
											coproc_inp_reg8 <= inp8a_export & inp8b_export;
											else
												nxt_state<= s1;
												cheching_fsm<=1;
											end if ;
											
							when s2  => coproc_inp_reg1 <= inp1a_export & inp1b_export;
											coproc_inp_reg2 <= inp2a_export & inp2b_export;
											coproc_inp_reg3 <= inp3a_export & inp3b_export;
											coproc_inp_reg4 <= inp4a_export & inp4b_export;
											coproc_inp_reg5 <= inp5a_export & inp5b_export;
											coproc_inp_reg6 <= inp6a_export & inp6b_export;
											coproc_inp_reg7 <= inp7a_export & inp7b_export;
											coproc_inp_reg8 <= inp8a_export & inp8b_export;
											
											if(count >=2 ) then
													nxt_state <= s3;
													cheching_fsm <=4;
													count<= count +1;
												
											elsif(count=1024) then
													nxt_state<=s0;
													cheching_fsm<=6;
													count<= count +1;
											else
											 
													nxt_state<=s2;
													cheching_fsm<=5;
													count<= count +1;
											end if;
											
													coproc_outp_reg1 <= dwt_outp1;
													coproc_outp_reg2 <= dwt_outp2;
													coproc_outp_reg3 <= dwt_outp3;
													coproc_outp_reg4 <= dwt_outp4;
													coproc_outp_reg5 <= dwt_outp5;
													coproc_outp_reg6 <= dwt_outp6;
													coproc_outp_reg7 <= dwt_outp7;
													coproc_outp_reg8 <= dwt_outp8;
												
											
											
							
							when s3  => coproc_inp_reg1 <= inp1a_export & inp1b_export;
											coproc_inp_reg2 <= inp2a_export & inp2b_export;
											coproc_inp_reg3 <= inp3a_export & inp3b_export;
											coproc_inp_reg4 <= inp4a_export & inp4b_export;
											coproc_inp_reg5 <= inp5a_export & inp5b_export;
											coproc_inp_reg6 <= inp6a_export & inp6b_export;
											coproc_inp_reg7 <= inp7a_export & inp7b_export;
											coproc_inp_reg8 <= inp8a_export & inp8b_export;
											count<= count + 1;
											write_clkcntrl(0) <= '1';
											
											
											coproc_outp_reg1 <= dwt_outp1;
											coproc_outp_reg2 <= dwt_outp2;
											coproc_outp_reg3 <= dwt_outp3;
											coproc_outp_reg4 <= dwt_outp4;
											coproc_outp_reg5 <= dwt_outp5;
											coproc_outp_reg6 <= dwt_outp6;
											coproc_outp_reg7 <= dwt_outp7;
											coproc_outp_reg8 <= dwt_outp8;
											cheching_fsm<=8;
											if(count=1025) then 
												nxt_state<=s0;
											end if;
							when others => null;
						end case;
					end if;
		end process;
end behave;