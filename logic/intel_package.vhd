--!@file intel_package.vhd
--!@brief Components developed by Intel and instantiated in the logic
--!@detail soc_system is generated in the Platform designer, whereas the other
--!@detail componens are in the ip folder

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

--!@brief Components developed by Intel and instantiated in the logic
package intel_package is

--!@brief SOC system developed by the "Platform designer" software
component soc_system is
  port (
  button_pio_external_connection_export : in    std_logic_vector(1 downto 0)  := (others => '0'); -- button_pio_external_connection.export
  clk_clk                               : in    std_logic                     := '0';             --                            clk.clk
  dipsw_pio_external_connection_export  : in    std_logic_vector(3 downto 0)  := (others => '0'); --  dipsw_pio_external_connection.export
  hps_0_f2h_cold_reset_req_reset_n      : in    std_logic                     := '0';             --       hps_0_f2h_cold_reset_req.reset_n
  hps_0_f2h_debug_reset_req_reset_n     : in    std_logic                     := '0';             --      hps_0_f2h_debug_reset_req.reset_n
  hps_0_f2h_stm_hw_events_stm_hwevents  : in    std_logic_vector(27 downto 0) := (others => '0'); --        hps_0_f2h_stm_hw_events.stm_hwevents
  hps_0_f2h_warm_reset_req_reset_n      : in    std_logic                     := '0';             --       hps_0_f2h_warm_reset_req.reset_n
  hps_0_h2f_reset_reset_n               : out   std_logic;                                        --                hps_0_h2f_reset.reset_n
  hps_0_hps_io_hps_io_emac1_inst_TX_CLK : out   std_logic;                                        --                   hps_0_hps_io.hps_io_emac1_inst_TX_CLK
  hps_0_hps_io_hps_io_emac1_inst_TXD0   : out   std_logic;                                        --                               .hps_io_emac1_inst_TXD0
  hps_0_hps_io_hps_io_emac1_inst_TXD1   : out   std_logic;                                        --                               .hps_io_emac1_inst_TXD1
  hps_0_hps_io_hps_io_emac1_inst_TXD2   : out   std_logic;                                        --                               .hps_io_emac1_inst_TXD2
  hps_0_hps_io_hps_io_emac1_inst_TXD3   : out   std_logic;                                        --                               .hps_io_emac1_inst_TXD3
  hps_0_hps_io_hps_io_emac1_inst_RXD0   : in    std_logic                     := '0';             --                               .hps_io_emac1_inst_RXD0
  hps_0_hps_io_hps_io_emac1_inst_MDIO   : inout std_logic                     := '0';             --                               .hps_io_emac1_inst_MDIO
  hps_0_hps_io_hps_io_emac1_inst_MDC    : out   std_logic;                                        --                               .hps_io_emac1_inst_MDC
  hps_0_hps_io_hps_io_emac1_inst_RX_CTL : in    std_logic                     := '0';             --                               .hps_io_emac1_inst_RX_CTL
  hps_0_hps_io_hps_io_emac1_inst_TX_CTL : out   std_logic;                                        --                               .hps_io_emac1_inst_TX_CTL
  hps_0_hps_io_hps_io_emac1_inst_RX_CLK : in    std_logic                     := '0';             --                               .hps_io_emac1_inst_RX_CLK
  hps_0_hps_io_hps_io_emac1_inst_RXD1   : in    std_logic                     := '0';             --                               .hps_io_emac1_inst_RXD1
  hps_0_hps_io_hps_io_emac1_inst_RXD2   : in    std_logic                     := '0';             --                               .hps_io_emac1_inst_RXD2
  hps_0_hps_io_hps_io_emac1_inst_RXD3   : in    std_logic                     := '0';             --                               .hps_io_emac1_inst_RXD3
  hps_0_hps_io_hps_io_sdio_inst_CMD     : inout std_logic                     := '0';             --                               .hps_io_sdio_inst_CMD
  hps_0_hps_io_hps_io_sdio_inst_D0      : inout std_logic                     := '0';             --                               .hps_io_sdio_inst_D0
  hps_0_hps_io_hps_io_sdio_inst_D1      : inout std_logic                     := '0';             --                               .hps_io_sdio_inst_D1
  hps_0_hps_io_hps_io_sdio_inst_CLK     : out   std_logic;                                        --                               .hps_io_sdio_inst_CLK
  hps_0_hps_io_hps_io_sdio_inst_D2      : inout std_logic                     := '0';             --                               .hps_io_sdio_inst_D2
  hps_0_hps_io_hps_io_sdio_inst_D3      : inout std_logic                     := '0';             --                               .hps_io_sdio_inst_D3
  hps_0_hps_io_hps_io_usb1_inst_D0      : inout std_logic                     := '0';             --                               .hps_io_usb1_inst_D0
  hps_0_hps_io_hps_io_usb1_inst_D1      : inout std_logic                     := '0';             --                               .hps_io_usb1_inst_D1
  hps_0_hps_io_hps_io_usb1_inst_D2      : inout std_logic                     := '0';             --                               .hps_io_usb1_inst_D2
  hps_0_hps_io_hps_io_usb1_inst_D3      : inout std_logic                     := '0';             --                               .hps_io_usb1_inst_D3
  hps_0_hps_io_hps_io_usb1_inst_D4      : inout std_logic                     := '0';             --                               .hps_io_usb1_inst_D4
  hps_0_hps_io_hps_io_usb1_inst_D5      : inout std_logic                     := '0';             --                               .hps_io_usb1_inst_D5
  hps_0_hps_io_hps_io_usb1_inst_D6      : inout std_logic                     := '0';             --                               .hps_io_usb1_inst_D6
  hps_0_hps_io_hps_io_usb1_inst_D7      : inout std_logic                     := '0';             --                               .hps_io_usb1_inst_D7
  hps_0_hps_io_hps_io_usb1_inst_CLK     : in    std_logic                     := '0';             --                               .hps_io_usb1_inst_CLK
  hps_0_hps_io_hps_io_usb1_inst_STP     : out   std_logic;                                        --                               .hps_io_usb1_inst_STP
  hps_0_hps_io_hps_io_usb1_inst_DIR     : in    std_logic                     := '0';             --                               .hps_io_usb1_inst_DIR
  hps_0_hps_io_hps_io_usb1_inst_NXT     : in    std_logic                     := '0';             --                               .hps_io_usb1_inst_NXT
  hps_0_hps_io_hps_io_spim1_inst_CLK    : out   std_logic;                                        --                               .hps_io_spim1_inst_CLK
  hps_0_hps_io_hps_io_spim1_inst_MOSI   : out   std_logic;                                        --                               .hps_io_spim1_inst_MOSI
  hps_0_hps_io_hps_io_spim1_inst_MISO   : in    std_logic                     := '0';             --                               .hps_io_spim1_inst_MISO
  hps_0_hps_io_hps_io_spim1_inst_SS0    : out   std_logic;                                        --                               .hps_io_spim1_inst_SS0
  hps_0_hps_io_hps_io_uart0_inst_RX     : in    std_logic                     := '0';             --                               .hps_io_uart0_inst_RX
  hps_0_hps_io_hps_io_uart0_inst_TX     : out   std_logic;                                        --                               .hps_io_uart0_inst_TX
  hps_0_hps_io_hps_io_i2c0_inst_SDA     : inout std_logic                     := '0';             --                               .hps_io_i2c0_inst_SDA
  hps_0_hps_io_hps_io_i2c0_inst_SCL     : inout std_logic                     := '0';             --                               .hps_io_i2c0_inst_SCL
  hps_0_hps_io_hps_io_i2c1_inst_SDA     : inout std_logic                     := '0';             --                               .hps_io_i2c1_inst_SDA
  hps_0_hps_io_hps_io_i2c1_inst_SCL     : inout std_logic                     := '0';             --                               .hps_io_i2c1_inst_SCL
  hps_0_hps_io_hps_io_gpio_inst_GPIO09  : inout std_logic                     := '0';             --                               .hps_io_gpio_inst_GPIO09
  hps_0_hps_io_hps_io_gpio_inst_GPIO35  : inout std_logic                     := '0';             --                               .hps_io_gpio_inst_GPIO35
  hps_0_hps_io_hps_io_gpio_inst_GPIO40  : inout std_logic                     := '0';             --                               .hps_io_gpio_inst_GPIO40
  hps_0_hps_io_hps_io_gpio_inst_GPIO53  : inout std_logic                     := '0';             --                               .hps_io_gpio_inst_GPIO53
  hps_0_hps_io_hps_io_gpio_inst_GPIO54  : inout std_logic                     := '0';             --                               .hps_io_gpio_inst_GPIO54
  hps_0_hps_io_hps_io_gpio_inst_GPIO61  : inout std_logic                     := '0';             --                               .hps_io_gpio_inst_GPIO61
  led_pio_external_connection_export    : out   std_logic_vector(6 downto 0);                     --    led_pio_external_connection.export
  memory_mem_a                          : out   std_logic_vector(14 downto 0);                    --                         memory.mem_a
  memory_mem_ba                         : out   std_logic_vector(2 downto 0);                     --                               .mem_ba
  memory_mem_ck                         : out   std_logic;                                        --                               .mem_ck
  memory_mem_ck_n                       : out   std_logic;                                        --                               .mem_ck_n
  memory_mem_cke                        : out   std_logic;                                        --                               .mem_cke
  memory_mem_cs_n                       : out   std_logic;                                        --                               .mem_cs_n
  memory_mem_ras_n                      : out   std_logic;                                        --                               .mem_ras_n
  memory_mem_cas_n                      : out   std_logic;                                        --                               .mem_cas_n
  memory_mem_we_n                       : out   std_logic;                                        --                               .mem_we_n
  memory_mem_reset_n                    : out   std_logic;                                        --                               .mem_reset_n
  memory_mem_dq                         : inout std_logic_vector(31 downto 0) := (others => '0'); --                               .mem_dq
  memory_mem_dqs                        : inout std_logic_vector(3 downto 0)  := (others => '0'); --                               .mem_dqs
  memory_mem_dqs_n                      : inout std_logic_vector(3 downto 0)  := (others => '0'); --                               .mem_dqs_n
  memory_mem_odt                        : out   std_logic;                                        --                               .mem_odt
  memory_mem_dm                         : out   std_logic_vector(3 downto 0);                     --                               .mem_dm
  memory_oct_rzqin                      : in    std_logic                     := '0';             --                               .oct_rzqin
  reset_reset_n                         : in    std_logic                     := '0'              --                          reset.reset_n
  );
end component soc_system;

--!@brief Debounce the electrical signals of a bus
component debounce generic (
  WIDTH           : natural := 32;     -- set to be the width of the bus being debounced
  POLARITY        : string  := "HIGH"; -- set to be "HIGH" for active high debounce or "LOW" for active low debounce
  TIMEOUT         : natural := 50000;  -- number of input clock cycles the input signal needs to be in the active state
  TIMEOUT_WIDTH   : natural := 16      -- set to be ceil(log2(TIMEOUT))
); port (
  clk       : in  std_logic;
  reset_n   : in  std_logic;
  data_in   : in  std_logic_vector(WIDTH-1 downto 0);
  data_out  : out std_logic_vector(WIDTH-1 downto 0)
);
end component debounce;

--!@brief General-purpose edge detector developed by Altera
component altera_edge_detector generic (
  PULSE_EXT               : natural := 0; -- 0, 1 = edge detection generate single cycle pulse, >1 = pulse extended for specified clock cycle
  EDGE_TYPE               : natural := 0; -- 0 = falling edge, 1 or else = rising edge
  IGNORE_RST_WHILE_BUSY   : natural := 0  -- 0 = module internal reset will be default whenever rst_n asserted, 1 = rst_n request will be ignored while generating pulse out
); port (
  clk          : in  std_logic;
  rst_n        : in  std_logic;
  signal_in    : in  std_logic;
  pulse_out    : out std_logic
);
end component altera_edge_detector;

--!@brief Reset of the HPS processor
component hps_reset port(
  probe       : in  std_logic;
  source_clk  : in  std_logic;
  source      : out std_logic_vector(2 downto 0)
);
end component hps_reset;

end intel_package;
