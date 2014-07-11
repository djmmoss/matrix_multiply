library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

package dot_prod_pkg is

    constant n : integer := 10;

    type t_in_vec is array (0 to n) of unsigned(15 downto 0);
    type t_out_vec is array (0 to n) of unsigned(31 downto 0);

    function dot_prod (a : t_in_vec; b : t_in_vec) return unsigned;

    component dot_prod_top is
        port(
                i_CLK       : in std_logic;
                i_RST       : in std_logic;
                i_A         : in t_in_vec;
                i_B         : in t_in_vec;
                o_C         : out unsigned(31 downto 0)
            );
    end component;
end package dot_prod_pkg;

package body dot_prod_pkg is

    function dot_prod (a : t_in_vec; b : t_in_vec) return unsigned is
        variable res : unsigned(31 downto 0) := (others =>'0');
        variable i : integer := 0;

        begin
            for i in 0 to a'length-1 loop
                res := res + (a(i)*b(i));
            end loop;
        return res;
    end dot_prod;
end dot_prod_pkg;
