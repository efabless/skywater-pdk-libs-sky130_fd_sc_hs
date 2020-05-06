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

`ifndef SKY130_FD_SC_HS__O211AI_TB_V
`define SKY130_FD_SC_HS__O211AI_TB_V

/**
 * o211ai: 2-input OR into first input of 3-input NAND.
 *
 *         Y = !((A1 | A2) & B1 & C1)
 *
 * Autogenerated test bench.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`include "sky130_fd_sc_hs__o211ai.v"

module top();

    // Inputs are registered
    reg A1;
    reg A2;
    reg B1;
    reg C1;
    reg VPWR;
    reg VGND;

    // Outputs are wires
    wire Y;

    initial
    begin
        // Initial state is x for all inputs.
        A1   = 1'bX;
        A2   = 1'bX;
        B1   = 1'bX;
        C1   = 1'bX;
        VGND = 1'bX;
        VPWR = 1'bX;

        #20   A1   = 1'b0;
        #40   A2   = 1'b0;
        #60   B1   = 1'b0;
        #80   C1   = 1'b0;
        #100  VGND = 1'b0;
        #120  VPWR = 1'b0;
        #140  A1   = 1'b1;
        #160  A2   = 1'b1;
        #180  B1   = 1'b1;
        #200  C1   = 1'b1;
        #220  VGND = 1'b1;
        #240  VPWR = 1'b1;
        #260  A1   = 1'b0;
        #280  A2   = 1'b0;
        #300  B1   = 1'b0;
        #320  C1   = 1'b0;
        #340  VGND = 1'b0;
        #360  VPWR = 1'b0;
        #380  VPWR = 1'b1;
        #400  VGND = 1'b1;
        #420  C1   = 1'b1;
        #440  B1   = 1'b1;
        #460  A2   = 1'b1;
        #480  A1   = 1'b1;
        #500  VPWR = 1'bx;
        #520  VGND = 1'bx;
        #540  C1   = 1'bx;
        #560  B1   = 1'bx;
        #580  A2   = 1'bx;
        #600  A1   = 1'bx;
    end

    sky130_fd_sc_hs__o211ai dut (.A1(A1), .A2(A2), .B1(B1), .C1(C1), .VPWR(VPWR), .VGND(VGND), .Y(Y));

endmodule

`default_nettype wire
`endif  // SKY130_FD_SC_HS__O211AI_TB_V
