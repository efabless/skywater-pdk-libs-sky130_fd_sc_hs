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

`ifndef SKY130_FD_SC_HS__DFSBP_TB_V
`define SKY130_FD_SC_HS__DFSBP_TB_V

/**
 * dfsbp: Delay flop, inverted set, complementary outputs.
 *
 * Autogenerated test bench.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`include "sky130_fd_sc_hs__dfsbp.v"

module top();

    // Inputs are registered
    reg D;
    reg SET_B;
    reg VPWR;
    reg VGND;

    // Outputs are wires
    wire Q;
    wire Q_N;

    initial
    begin
        // Initial state is x for all inputs.
        D     = 1'bX;
        SET_B = 1'bX;
        VGND  = 1'bX;
        VPWR  = 1'bX;

        #20   D     = 1'b0;
        #40   SET_B = 1'b0;
        #60   VGND  = 1'b0;
        #80   VPWR  = 1'b0;
        #100  D     = 1'b1;
        #120  SET_B = 1'b1;
        #140  VGND  = 1'b1;
        #160  VPWR  = 1'b1;
        #180  D     = 1'b0;
        #200  SET_B = 1'b0;
        #220  VGND  = 1'b0;
        #240  VPWR  = 1'b0;
        #260  VPWR  = 1'b1;
        #280  VGND  = 1'b1;
        #300  SET_B = 1'b1;
        #320  D     = 1'b1;
        #340  VPWR  = 1'bx;
        #360  VGND  = 1'bx;
        #380  SET_B = 1'bx;
        #400  D     = 1'bx;
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

    sky130_fd_sc_hs__dfsbp dut (.D(D), .SET_B(SET_B), .VPWR(VPWR), .VGND(VGND), .Q(Q), .Q_N(Q_N), .CLK(CLK));

endmodule

`default_nettype wire
`endif  // SKY130_FD_SC_HS__DFSBP_TB_V
