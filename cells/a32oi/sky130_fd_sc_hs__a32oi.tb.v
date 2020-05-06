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

`ifndef SKY130_FD_SC_HS__A32OI_TB_V
`define SKY130_FD_SC_HS__A32OI_TB_V

/**
 * a32oi: 3-input AND into first input, and 2-input AND into
 *        2nd input of 2-input NOR.
 *
 *        Y = !((A1 & A2 & A3) | (B1 & B2))
 *
 * Autogenerated test bench.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`include "sky130_fd_sc_hs__a32oi.v"

module top();

    // Inputs are registered
    reg A1;
    reg A2;
    reg A3;
    reg B1;
    reg B2;
    reg VPWR;
    reg VGND;

    // Outputs are wires
    wire Y;

    initial
    begin
        // Initial state is x for all inputs.
        A1   = 1'bX;
        A2   = 1'bX;
        A3   = 1'bX;
        B1   = 1'bX;
        B2   = 1'bX;
        VGND = 1'bX;
        VPWR = 1'bX;

        #20   A1   = 1'b0;
        #40   A2   = 1'b0;
        #60   A3   = 1'b0;
        #80   B1   = 1'b0;
        #100  B2   = 1'b0;
        #120  VGND = 1'b0;
        #140  VPWR = 1'b0;
        #160  A1   = 1'b1;
        #180  A2   = 1'b1;
        #200  A3   = 1'b1;
        #220  B1   = 1'b1;
        #240  B2   = 1'b1;
        #260  VGND = 1'b1;
        #280  VPWR = 1'b1;
        #300  A1   = 1'b0;
        #320  A2   = 1'b0;
        #340  A3   = 1'b0;
        #360  B1   = 1'b0;
        #380  B2   = 1'b0;
        #400  VGND = 1'b0;
        #420  VPWR = 1'b0;
        #440  VPWR = 1'b1;
        #460  VGND = 1'b1;
        #480  B2   = 1'b1;
        #500  B1   = 1'b1;
        #520  A3   = 1'b1;
        #540  A2   = 1'b1;
        #560  A1   = 1'b1;
        #580  VPWR = 1'bx;
        #600  VGND = 1'bx;
        #620  B2   = 1'bx;
        #640  B1   = 1'bx;
        #660  A3   = 1'bx;
        #680  A2   = 1'bx;
        #700  A1   = 1'bx;
    end

    sky130_fd_sc_hs__a32oi dut (.A1(A1), .A2(A2), .A3(A3), .B1(B1), .B2(B2), .VPWR(VPWR), .VGND(VGND), .Y(Y));

endmodule

`default_nettype wire
`endif  // SKY130_FD_SC_HS__A32OI_TB_V
