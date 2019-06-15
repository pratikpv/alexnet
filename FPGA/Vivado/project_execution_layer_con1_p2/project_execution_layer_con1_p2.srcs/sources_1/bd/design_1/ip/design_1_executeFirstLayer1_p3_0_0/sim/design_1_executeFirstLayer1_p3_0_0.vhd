-- (c) Copyright 1995-2019 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:hls:executeFirstLayer1_p3:1.0
-- IP Revision: 1905071208

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_executeFirstLayer1_p3_0_0 IS
  PORT (
    s_axi_control_AWADDR : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    s_axi_control_AWVALID : IN STD_LOGIC;
    s_axi_control_AWREADY : OUT STD_LOGIC;
    s_axi_control_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_control_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_control_WVALID : IN STD_LOGIC;
    s_axi_control_WREADY : OUT STD_LOGIC;
    s_axi_control_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_control_BVALID : OUT STD_LOGIC;
    s_axi_control_BREADY : IN STD_LOGIC;
    s_axi_control_ARADDR : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    s_axi_control_ARVALID : IN STD_LOGIC;
    s_axi_control_ARREADY : OUT STD_LOGIC;
    s_axi_control_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_control_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_control_RVALID : OUT STD_LOGIC;
    s_axi_control_RREADY : IN STD_LOGIC;
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    interrupt : OUT STD_LOGIC;
    m_axi_gmem_AWADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_gmem_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_gmem_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem_AWLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem_AWREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem_AWVALID : OUT STD_LOGIC;
    m_axi_gmem_AWREADY : IN STD_LOGIC;
    m_axi_gmem_WDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_gmem_WSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem_WLAST : OUT STD_LOGIC;
    m_axi_gmem_WVALID : OUT STD_LOGIC;
    m_axi_gmem_WREADY : IN STD_LOGIC;
    m_axi_gmem_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem_BVALID : IN STD_LOGIC;
    m_axi_gmem_BREADY : OUT STD_LOGIC;
    m_axi_gmem_ARADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_gmem_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_gmem_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem_ARREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem_ARVALID : OUT STD_LOGIC;
    m_axi_gmem_ARREADY : IN STD_LOGIC;
    m_axi_gmem_RDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_gmem_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem_RLAST : IN STD_LOGIC;
    m_axi_gmem_RVALID : IN STD_LOGIC;
    m_axi_gmem_RREADY : OUT STD_LOGIC
  );
END design_1_executeFirstLayer1_p3_0_0;

ARCHITECTURE design_1_executeFirstLayer1_p3_0_0_arch OF design_1_executeFirstLayer1_p3_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_executeFirstLayer1_p3_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT executeFirstLayer1_p3 IS
    GENERIC (
      C_S_AXI_CONTROL_ADDR_WIDTH : INTEGER;
      C_S_AXI_CONTROL_DATA_WIDTH : INTEGER;
      C_M_AXI_GMEM_ID_WIDTH : INTEGER;
      C_M_AXI_GMEM_ADDR_WIDTH : INTEGER;
      C_M_AXI_GMEM_DATA_WIDTH : INTEGER;
      C_M_AXI_GMEM_AWUSER_WIDTH : INTEGER;
      C_M_AXI_GMEM_ARUSER_WIDTH : INTEGER;
      C_M_AXI_GMEM_WUSER_WIDTH : INTEGER;
      C_M_AXI_GMEM_RUSER_WIDTH : INTEGER;
      C_M_AXI_GMEM_BUSER_WIDTH : INTEGER;
      C_M_AXI_GMEM_USER_VALUE : INTEGER;
      C_M_AXI_GMEM_PROT_VALUE : INTEGER;
      C_M_AXI_GMEM_CACHE_VALUE : INTEGER;
      C_M_AXI_GMEM_TARGET_ADDR : INTEGER
    );
    PORT (
      s_axi_control_AWADDR : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      s_axi_control_AWVALID : IN STD_LOGIC;
      s_axi_control_AWREADY : OUT STD_LOGIC;
      s_axi_control_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_control_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_control_WVALID : IN STD_LOGIC;
      s_axi_control_WREADY : OUT STD_LOGIC;
      s_axi_control_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_control_BVALID : OUT STD_LOGIC;
      s_axi_control_BREADY : IN STD_LOGIC;
      s_axi_control_ARADDR : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      s_axi_control_ARVALID : IN STD_LOGIC;
      s_axi_control_ARREADY : OUT STD_LOGIC;
      s_axi_control_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_control_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_control_RVALID : OUT STD_LOGIC;
      s_axi_control_RREADY : IN STD_LOGIC;
      ap_clk : IN STD_LOGIC;
      ap_rst_n : IN STD_LOGIC;
      interrupt : OUT STD_LOGIC;
      m_axi_gmem_AWID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem_AWADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_gmem_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_gmem_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_gmem_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem_AWLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem_AWREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_gmem_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem_AWUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem_AWVALID : OUT STD_LOGIC;
      m_axi_gmem_AWREADY : IN STD_LOGIC;
      m_axi_gmem_WID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem_WDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_gmem_WSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem_WLAST : OUT STD_LOGIC;
      m_axi_gmem_WUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem_WVALID : OUT STD_LOGIC;
      m_axi_gmem_WREADY : IN STD_LOGIC;
      m_axi_gmem_BID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem_BUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem_BVALID : IN STD_LOGIC;
      m_axi_gmem_BREADY : OUT STD_LOGIC;
      m_axi_gmem_ARID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem_ARADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_gmem_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_gmem_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_gmem_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem_ARREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_gmem_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem_ARUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem_ARVALID : OUT STD_LOGIC;
      m_axi_gmem_ARREADY : IN STD_LOGIC;
      m_axi_gmem_RID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem_RDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_gmem_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem_RLAST : IN STD_LOGIC;
      m_axi_gmem_RUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem_RVALID : IN STD_LOGIC;
      m_axi_gmem_RREADY : OUT STD_LOGIC
    );
  END COMPONENT executeFirstLayer1_p3;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_AWADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_AWVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_AWREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_WDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_WSTRB: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_WVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_WREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_BRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_BVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_BREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_ARADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_ARVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_ARREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_RDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_RRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_RVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_RREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF ap_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 ap_clk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF ap_rst_n: SIGNAL IS "xilinx.com:signal:reset:1.0 ap_rst_n RST";
  ATTRIBUTE X_INTERFACE_INFO OF interrupt: SIGNAL IS "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_AWADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_AWLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem AWLEN";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_AWSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_AWBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_AWLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_AWREGION: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem AWREGION";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_AWCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem AWCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_AWPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_AWQOS: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem AWQOS";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_AWVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_AWREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_WDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_WSTRB: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_WLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_WVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_WREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_BRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_BVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_BREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_ARADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_ARLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_ARSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_ARBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_ARLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_ARREGION: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem ARREGION";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_ARCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_ARPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_ARQOS: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem ARQOS";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_ARVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_ARREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_RDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_RRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_RLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_RVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_RREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem RREADY";
BEGIN
  U0 : executeFirstLayer1_p3
    GENERIC MAP (
      C_S_AXI_CONTROL_ADDR_WIDTH => 7,
      C_S_AXI_CONTROL_DATA_WIDTH => 32,
      C_M_AXI_GMEM_ID_WIDTH => 1,
      C_M_AXI_GMEM_ADDR_WIDTH => 32,
      C_M_AXI_GMEM_DATA_WIDTH => 32,
      C_M_AXI_GMEM_AWUSER_WIDTH => 1,
      C_M_AXI_GMEM_ARUSER_WIDTH => 1,
      C_M_AXI_GMEM_WUSER_WIDTH => 1,
      C_M_AXI_GMEM_RUSER_WIDTH => 1,
      C_M_AXI_GMEM_BUSER_WIDTH => 1,
      C_M_AXI_GMEM_USER_VALUE => 0,
      C_M_AXI_GMEM_PROT_VALUE => 0,
      C_M_AXI_GMEM_CACHE_VALUE => 3,
      C_M_AXI_GMEM_TARGET_ADDR => 0
    )
    PORT MAP (
      s_axi_control_AWADDR => s_axi_control_AWADDR,
      s_axi_control_AWVALID => s_axi_control_AWVALID,
      s_axi_control_AWREADY => s_axi_control_AWREADY,
      s_axi_control_WDATA => s_axi_control_WDATA,
      s_axi_control_WSTRB => s_axi_control_WSTRB,
      s_axi_control_WVALID => s_axi_control_WVALID,
      s_axi_control_WREADY => s_axi_control_WREADY,
      s_axi_control_BRESP => s_axi_control_BRESP,
      s_axi_control_BVALID => s_axi_control_BVALID,
      s_axi_control_BREADY => s_axi_control_BREADY,
      s_axi_control_ARADDR => s_axi_control_ARADDR,
      s_axi_control_ARVALID => s_axi_control_ARVALID,
      s_axi_control_ARREADY => s_axi_control_ARREADY,
      s_axi_control_RDATA => s_axi_control_RDATA,
      s_axi_control_RRESP => s_axi_control_RRESP,
      s_axi_control_RVALID => s_axi_control_RVALID,
      s_axi_control_RREADY => s_axi_control_RREADY,
      ap_clk => ap_clk,
      ap_rst_n => ap_rst_n,
      interrupt => interrupt,
      m_axi_gmem_AWADDR => m_axi_gmem_AWADDR,
      m_axi_gmem_AWLEN => m_axi_gmem_AWLEN,
      m_axi_gmem_AWSIZE => m_axi_gmem_AWSIZE,
      m_axi_gmem_AWBURST => m_axi_gmem_AWBURST,
      m_axi_gmem_AWLOCK => m_axi_gmem_AWLOCK,
      m_axi_gmem_AWREGION => m_axi_gmem_AWREGION,
      m_axi_gmem_AWCACHE => m_axi_gmem_AWCACHE,
      m_axi_gmem_AWPROT => m_axi_gmem_AWPROT,
      m_axi_gmem_AWQOS => m_axi_gmem_AWQOS,
      m_axi_gmem_AWVALID => m_axi_gmem_AWVALID,
      m_axi_gmem_AWREADY => m_axi_gmem_AWREADY,
      m_axi_gmem_WDATA => m_axi_gmem_WDATA,
      m_axi_gmem_WSTRB => m_axi_gmem_WSTRB,
      m_axi_gmem_WLAST => m_axi_gmem_WLAST,
      m_axi_gmem_WVALID => m_axi_gmem_WVALID,
      m_axi_gmem_WREADY => m_axi_gmem_WREADY,
      m_axi_gmem_BID => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_gmem_BRESP => m_axi_gmem_BRESP,
      m_axi_gmem_BUSER => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_gmem_BVALID => m_axi_gmem_BVALID,
      m_axi_gmem_BREADY => m_axi_gmem_BREADY,
      m_axi_gmem_ARADDR => m_axi_gmem_ARADDR,
      m_axi_gmem_ARLEN => m_axi_gmem_ARLEN,
      m_axi_gmem_ARSIZE => m_axi_gmem_ARSIZE,
      m_axi_gmem_ARBURST => m_axi_gmem_ARBURST,
      m_axi_gmem_ARLOCK => m_axi_gmem_ARLOCK,
      m_axi_gmem_ARREGION => m_axi_gmem_ARREGION,
      m_axi_gmem_ARCACHE => m_axi_gmem_ARCACHE,
      m_axi_gmem_ARPROT => m_axi_gmem_ARPROT,
      m_axi_gmem_ARQOS => m_axi_gmem_ARQOS,
      m_axi_gmem_ARVALID => m_axi_gmem_ARVALID,
      m_axi_gmem_ARREADY => m_axi_gmem_ARREADY,
      m_axi_gmem_RID => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_gmem_RDATA => m_axi_gmem_RDATA,
      m_axi_gmem_RRESP => m_axi_gmem_RRESP,
      m_axi_gmem_RLAST => m_axi_gmem_RLAST,
      m_axi_gmem_RUSER => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_gmem_RVALID => m_axi_gmem_RVALID,
      m_axi_gmem_RREADY => m_axi_gmem_RREADY
    );
END design_1_executeFirstLayer1_p3_0_0_arch;
