--!@file top_periphController.vhd
--!@brief Peripherals controller (Switch, Key, Led, GPIO)
--!@author Matteo D'Antonio, matteo.dantonio@pg.infn.it
--!@date 20/04/2022


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;
use work.intel_package.all;
use work.basic_package.all;


--!@copydoc top_periphController.vhd
entity top_periphController is
  generic (
    --HoG: Global Generic Variables
    GLOBAL_DATE : std_logic_vector(31 downto 0) := (others => '0');
    GLOBAL_TIME : std_logic_vector(31 downto 0) := (others => '0');
    GLOBAL_VER  : std_logic_vector(31 downto 0) := (others => '0');
    GLOBAL_SHA  : std_logic_vector(31 downto 0) := (others => '0');
    TOP_VER     : std_logic_vector(31 downto 0) := (others => '0');
    TOP_SHA     : std_logic_vector(31 downto 0) := (others => '0');
    CON_VER     : std_logic_vector(31 downto 0) := (others => '0');
    CON_SHA     : std_logic_vector(31 downto 0) := (others => '0');
    HOG_VER     : std_logic_vector(31 downto 0) := (others => '0');
    HOG_SHA     : std_logic_vector(31 downto 0) := (others => '0');

    --HoG: Project Specific Lists (One for each .src file in your Top/ folder)
    PAPEROASTRA_SHA : std_logic_vector(31 downto 0) := (others => '0');
    PAPEROASTRA_VER : std_logic_vector(31 downto 0) := (others => '0')
    );
  port(
    iCLK        : in  std_logic;
    iKEY        : in    std_logic_vector(1 downto 0);
    iSW         : in    std_logic_vector(3 downto 0);
    oLED        : out   std_logic_vector(7 downto 0);
    GPIO_RX     : in    std_logic;
    GPIO_TX     : out   std_logic
  );
end entity top_periphController;


--!@copydoc top_periphController.vhd
architecture std of top_periphController is
  --!Main command
  signal sRst                     : std_logic;
  --!Peripherals
  signal sSwitch                  : std_logic_vector(3 downto 0);
  --signal sKey                     : std_logic_vector(1 downto 0);
  signal sLed                     : std_logic_vector(7 downto 0);
  signal sGpioRx                  : std_logic;
  signal sGpioRxSync              : std_logic;
  signal sGpioTx                  : std_logic;
  --!Key debounced
  signal sKeyDeb                  : std_logic_vector(1 downto 0);
  --!Blinking led
  signal sCounter                 : std_logic_vector(25 downto 0) := (others => '0');


begin
  --!LED '0' (data receiver)
  sGpioRx   <= GPIO_RX;
    RX_SYNCH : sync_stage
      generic map (
        pSTAGES => 2
        )
      port map (
        iCLK  => iCLK,
        iRST  => '0',
        iD    => sGpioRx,
        oQ    => sGpioRxSync
        );
  rx_proc : process (iCLK)
  begin
    if (rising_edge(iCLK)) then
      if (sRst = '1') then
        oLED(0)   <= '0';
      elsif (sGpioRxSync = '1') then
        oLED(0)   <= '1';
      else
        oLED(0)   <= '0';
      end if;
    end if;
  end process;
  
  
  --!LED '1' (data transmitter)
  GPIO_TX   <= sGpioTx;
  tx_proc : process (iCLK)
  begin
    if (rising_edge(iCLK)) then
      if (sRst = '1') then
        sGpioTx   <= '0';
        oLED(1)   <= '0';
      elsif (iSW(2) = '1') then
        sGpioTx   <= '1';
        oLED(1)   <= '1';
      else
        sGpioTx   <= '0';
        oLED(1)   <= '0';
      end if;
    end if;
  end process;
  
  
  --!LED '2' void
  oLED(2) <= '0';
  
  
  --!Control of LEDs '3' with switches '0' and '1'
  switch_proc : process (iCLK)
  begin
    if (rising_edge(iCLK)) then
      if (sRst = '1') then
        oLED(3)   <= '0';
      else
        oLED(3) <= iSW(0) xor iSW(1);
      end if;
    end if;
  end process;
  
  
  --!Control of LEDs '4' and '5' with keys
  oLED(4) <= not sKeyDeb(0);
  oLED(5) <= not sKeyDeb(1);
  --!Debounce logic to clean out glitches within 1ms
  debounce_inst : debounce
    generic map(
      WIDTH           => 2,
      POLARITY        => "LOW",
      TIMEOUT         => 50000,   -- at 50Mhz this is a debounce time of 1ms
      TIMEOUT_WIDTH   => 16       -- ceil(log2(TIMEOUT))
      ) 
    port map(
      clk         => iCLK,
      reset_n     => '1',
      data_in     => iKEY,
      data_out    => sKeyDeb
      );

  
  --!Reset LED ('6')
  sRst  <= iSW(3);
  reset_proc : process (iCLK)
  begin
    if (rising_edge(iCLK)) then
      if (sRst = '1') then
        oLED(6) <= '1';
      else
        oLED(6) <= '0';
      end if;
    end if;
  end process;
  
  
  --!Blinking LED '7'
  oLED(7) <= sLed(7);
  blink_proc : process (iCLK)
  begin
    if (rising_edge(iCLK)) then
      if (sRst = '1') then
        sCounter  <= (others => '0');
        sLed(7)   <= '0';
      elsif (sCounter = 12499999) then  --! 2Hz
        sCounter  <= (others => '0');
        sLed(7)   <= not sLed(7);
      else
        sCounter  <= sCounter + '1';
      end if;
    end if;
  end process;


end architecture;