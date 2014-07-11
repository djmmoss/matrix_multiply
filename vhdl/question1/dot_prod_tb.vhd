library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
use work.mult_pkg.all;

entity dot_prod_tb is
end dot_prod_tb;

architecture behave of dot_prod_tb is

    constant c_CLK_PERIOD : time := 10 ns;

    signal r_CLK    : std_logic                 := '0';
    signal r_RST    : std_logic                 := '0';
    signal r_A      : t_in_vec                  := (others => (others => '0'));
    signal r_B      : t_in_vec                  := (others => (others => '0'));
    signal w_RESULT : unsigned (31 downto 0)    := (others => '0');

    signal x        : unsigned (15 downto 0) := (others => '0');
    signal y        : unsigned (31 downto 0) := (others => '0');

begin

  DOT_PROD_TOP_INST : dot_prod_top
    port map (
        i_CLK   => r_CLK,
        i_RST   => r_RST,
        i_A     => r_A,
        i_B     => r_B,
        o_C     => w_RESULT
        );

  p_CLK_GEN : process is 
  begin
    wait for c_CLK_PERIOD/2;
        r_CLK <= not r_CLK;
  end process p_CLK_GEN;

  process
  begin

    r_RST <= '1';
    wait for c_CLK_PERIOD;
    r_RST <= '0';
    r_A <= (x+1,x+1,x+1);
    r_B <= (x+1,x+1,x+1);
    wait for c_CLK_PERIOD;
    if w_RESULT = y+3 then
        report "SUCESS";
    else
        report "FAILURE";
    end if;
    r_A <= (x+2,x+2,x+2);
    r_B <= (x+3,x+3,x+3);
    wait for c_CLK_PERIOD;
    if w_RESULT = y+18 then
        report "SUCESS";
    else
        report "FAILURE";
    end if;

    end process;

end behave;
