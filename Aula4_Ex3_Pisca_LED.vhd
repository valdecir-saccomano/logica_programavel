LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity conta_tempo is
    Port (
    clk : in std_logic; -- frequencia de 100Mhz
    btnCpuReset : in std_logic;
    led : out std_logic_vector(15 downto 0)
    );
end conta_tempo;

architecture bhv of conta_tempo is
    signal cnt : integer range 0 to 100_000_000 := 0;
    signal led_i : std_logic_vector(15 downto 0);
    begin
        process(clk, btnCpuReset)
        begin
            if(btnCpuReset = '0') then
                cnt <= 0;
                
            
            elsif(rising_edge(clk)) then
            if (cnt = 100_000_000) then
                cnt <= 0;
                led_i <= not led_i;
            else
                cnt <= cnt + 1;
            end if;
            
            end if;
        end process;

led <= led_i;

end bhv;