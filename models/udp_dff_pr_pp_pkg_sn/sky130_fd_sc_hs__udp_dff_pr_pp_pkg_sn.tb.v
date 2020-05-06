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

`ifndef SKY130_FD_SC_HS__UDP_DFF_PR_PP_PKG_SN_TB_V
`define SKY130_FD_SC_HS__UDP_DFF_PR_PP_PKG_SN_TB_V

/**
 * udp_dff$PR_pp$PKG$sN: Positive edge triggered D flip-flop with
 *                       active high
 *
 * Autogenerated test bench.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`include "sky130_fd_sc_hs__udp_dff_pr_pp_pkg_sn.v"

module top();

    // Inputs are registered
    reg D;
    reg RESET;
    reg SLEEP_B;
    reg NOTIFIER;
    reg KAPWR;
    reg VGND;
    reg VPWR;

    // Outputs are wires
    wire Q;

    initial
    begin
        // Initial state is x for all inputs.
        D        = 1'bX;
        KAPWR    = 1'bX;
        NOTIFIER = 1'bX;
        RESET    = 1'bX;
        SLEEP_B  = 1'bX;
        VGND     = 1'bX;
        VPWR     = 1'bX;

        #20   D        = 1'b0;
        #40   KAPWR    = 1'b0;
        #60   NOTIFIER = 1'b0;
        #80   RESET    = 1'b0;
        #100  SLEEP_B  = 1'b0;
        #120  VGND     = 1'b0;
        #140  VPWR     = 1'b0;
        #160  D        = 1'b1;
        #180  KAPWR    = 1'b1;
        #200  NOTIFIER = 1'b1;
        #220  RESET    = 1'b1;
        #240  SLEEP_B  = 1'b1;
        #260  VGND     = 1'b1;
        #280  VPWR     = 1'b1;
        #300  D        = 1'b0;
        #320  KAPWR    = 1'b0;
        #340  NOTIFIER = 1'b0;
        #360  RESET    = 1'b0;
        #380  SLEEP_B  = 1'b0;
        #400  VGND     = 1'b0;
        #420  VPWR     = 1'b0;
        #440  VPWR     = 1'b1;
        #460  VGND     = 1'b1;
        #480  SLEEP_B  = 1'b1;
        #500  RESET    = 1'b1;
        #520  NOTIFIER = 1'b1;
        #540  KAPWR    = 1'b1;
        #560  D        = 1'b1;
        #580  VPWR     = 1'bx;
        #600  VGND     = 1'bx;
        #620  SLEEP_B  = 1'bx;
        #640  RESET    = 1'bx;
        #660  NOTIFIER = 1'bx;
        #680  KAPWR    = 1'bx;
        #700  D        = 1'bx;
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

    sky130_fd_sc_hs__udp_dff$PR_pp$PKG$sN dut (.D(D), .RESET(RESET), .SLEEP_B(SLEEP_B), .NOTIFIER(NOTIFIER), .KAPWR(KAPWR), .VGND(VGND), .VPWR(VPWR), .Q(Q), .CLK(CLK));

endmodule

`default_nettype wire
`endif  // SKY130_FD_SC_HS__UDP_DFF_PR_PP_PKG_SN_TB_V
