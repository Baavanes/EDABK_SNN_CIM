module test (

  input 	VDDC,
  input 	VDDA,
  input 	VSS,
  input         wb_clk_i, 
  input         wb_rst_i, 
  input         wbs_stb_i,
  input         wbs_cyc_i,
  input         wbs_we_i, 
  input  [3:0]  wbs_sel_i,
  input  [31:0] wbs_dat_i,
  input  [31:0] wbs_adr_i,
  output [31:0] wbs_dat_o,
  output      wbs_ack_o,

  // Scan/Test Pins
  input         ScanInCC,        // Scan enable
  input         ScanInDL,        // Data scan chain input (user_clk domain)
  input         ScanInDR,        // Data scan chain input (wb_clk domain)
  input         TM,              // Test mode
  output        ScanOutCC,       // Data scan chain output

  // Analog Pins
  input         Iref,            // 100 µA current reference
  input         Vcc_read,        // 0.3 V read rail
  input         Vcomp,           // 0.6 V comparator bias
  input         Bias_comp2,      // 0.6 V comparator bias
  input         Vcc_wl_read,     // 0.7 V wordline read rail
  input         Vcc_wl_set,      // 1.8 V wordline set rail
  input         Vbias,           // 1.8 V analog bias
  input         Vcc_wl_reset,    // 2.6 V wordline reset rail
  input         Vcc_set,         // 3.3 V array set rail
  input         Vcc_reset,       // 3.3 V array reset rail
  input         Vcc_L,           // 5 V level shifter supply
  input         Vcc_Body         // 5 V body-bias supply
);

  wire vddc,vdda,vss;
wire [31:0] wbs_dat_o_buff;
assign wbs_dat_o = wbs_dat_o_buff + 1;

  assign vddc = VDDC;
  assign vdda = VDDA;
  assign vss = VSS;

	Neuromorphic_X1_wb hihi (
        `ifdef USE_PG_PIN
        .VDDC(vddc),
        .VDDA(vdda),
        .VSS (vss),
        `endif
        .user_clk (wb_clk_i),
        .user_rst (wb_rst_i),
        .wb_clk_i (wb_clk_i),
        .wb_rst_i (wb_rst_i),
        .wbs_stb_i(wbs_stb_i),
        .wbs_cyc_i(wbs_cyc_i),
        .wbs_we_i (wbs_we_i),
        .wbs_sel_i(wbs_sel_i),
        .wbs_dat_i(wbs_dat_i),
        .wbs_adr_i(wbs_adr_i),
        .wbs_dat_o(wbs_dat_o_buff),
        .wbs_ack_o(wbs_ack_o),

        // Scan/Test Pins
        .ScanInCC(ScanInCC),
        .ScanInDL(ScanInDL),
        .ScanInDR(ScanInDR),
        .TM(TM),
        .ScanOutCC(ScanOutCC),

        // Analog Pins
        .Iref(Iref),
        .Vcc_read(Vcc_read),
        .Vcomp(Vcomp),
        .Bias_comp2(Bias_comp2),
        .Vcc_wl_read(Vcc_wl_read),
        .Vcc_wl_set(Vcc_wl_set),
        .Vbias(Vbias),
        .Vcc_wl_reset(Vcc_wl_reset),
        .Vcc_set(Vcc_set),
        .Vcc_reset(Vcc_reset),
        .Vcc_L(Vcc_L),
        .Vcc_Body(Vcc_Body)
      );
  
endmodule
