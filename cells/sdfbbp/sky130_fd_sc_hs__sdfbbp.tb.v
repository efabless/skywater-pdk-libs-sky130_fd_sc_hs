/**
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

`ifndef SKY130_FD_SC_HS__SDFBBP_TB_V
`define SKY130_FD_SC_HS__SDFBBP_TB_V

/**
 * sdfbbp: Scan delay flop, inverted set, inverted reset, non-inverted
 *         clock, complementary outputs.
 *
 * Autogenerated test bench.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`include "sky130_fd_sc_hs__sdfbbp.v"

module top();

    // Inputs are registered
    reg D;
    reg SCD;
    reg SCE;
    reg SET_B;
    reg RESET_B;
    reg VPWR;
    reg VGND;

    // Outputs are wires
    wire Q;
    wire Q_N;

    initial
    begin
        // Initial state is x for all inputs.
        D       = 1'bX;
        RESET_B = 1'bX;
        SCD     = 1'bX;
        SCE     = 1'bX;
        SET_B   = 1'bX;
        VGND    = 1'bX;
        VPWR    = 1'bX;

        #20   D       = 1'b0;
        #40   RESET_B = 1'b0;
        #60   SCD     = 1'b0;
        #80   SCE     = 1'b0;
        #100  SET_B   = 1'b0;
        #120  VGND    = 1'b0;
        #140  VPWR    = 1'b0;
        #160  D       = 1'b1;
        #180  RESET_B = 1'b1;
        #200  SCD     = 1'b1;
        #220  SCE     = 1'b1;
        #240  SET_B   = 1'b1;
        #260  VGND    = 1'b1;
        #280  VPWR    = 1'b1;
        #300  D       = 1'b0;
        #320  RESET_B = 1'b0;
        #340  SCD     = 1'b0;
        #360  SCE     = 1'b0;
        #380  SET_B   = 1'b0;
        #400  VGND    = 1'b0;
        #420  VPWR    = 1'b0;
        #440  VPWR    = 1'b1;
        #460  VGND    = 1'b1;
        #480  SET_B   = 1'b1;
        #500  SCE     = 1'b1;
        #520  SCD     = 1'b1;
        #540  RESET_B = 1'b1;
        #560  D       = 1'b1;
        #580  VPWR    = 1'bx;
        #600  VGND    = 1'bx;
        #620  SET_B   = 1'bx;
        #640  SCE     = 1'bx;
        #660  SCD     = 1'bx;
        #680  RESET_B = 1'bx;
        #700  D       = 1'bx;
    end

    // Create a clock
    reg CLK;
    initial
    begin
        CLK = 1'b0;
    end

    always
    begin
        #5 CLK = ~CLK;
    end

    sky130_fd_sc_hs__sdfbbp dut (.D(D), .SCD(SCD), .SCE(SCE), .SET_B(SET_B), .RESET_B(RESET_B), .VPWR(VPWR), .VGND(VGND), .Q(Q), .Q_N(Q_N), .CLK(CLK));

endmodule

`default_nettype wire
`endif  // SKY130_FD_SC_HS__SDFBBP_TB_V
