LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
ENTITY aula4 IS
 PORT(
    -- Clk e rst
    clk : in std_logic; -- 100Mhz
    btnCpuReset : in std_logic; -- RST em '0'
    -- IOs
    sw : in std_logic_vector(15 downto 0);
    led : out std_logic_vector(15 downto 0)
 );
END aula4;

ARCHITECTURE bhv OF aula4 IS


signal in_mux : std_logic_vector(2 downto 0);
signal ss_mux : std_logic_vector(1 downto 0);
signal out_mux : std_logic;

BEGIN

    process (in_mux,ss_mux)
    begin
        CASE ss_mux IS
            WHEN "00" => out_mux <= in_mux(0);
            WHEN "01" => out_mux <= in_mux(1);
            WHEN OTHERS => out_mux <= in_mux(2);
         END CASE;
         
     end process;
                    
    ss_mux <= sw(4 downto 3);
    in_mux <= sw(2 downto 0);
    led(15) <= out_mux;
    
END bhv;
