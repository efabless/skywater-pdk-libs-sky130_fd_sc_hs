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

`ifndef SKY130_FD_SC_HS__NOR2B_TB_V
`define SKY130_FD_SC_HS__NOR2B_TB_V

/**
 * nor2b: 2-input NOR, first input inverted.
 *
 *        Y = !(A | B | C | !D)
 *
 * Autogenerated test bench.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`include "sky130_fd_sc_hs__nor2b.v"

module top();

    // Inputs are registered
    reg A;
    reg B_N;
    reg VPWR;
    reg VGND;

    // Outputs are wires
    wire Y;

    initial
    begin
        // Initial state is x for all inputs.
        A    = 1'bX;
        B_N  = 1'bX;
        VGND = 1'bX;
        VPWR = 1'bX;

        #20   A    = 1'b0;
        #40   B_N  = 1'b0;
        #60   VGND = 1'b0;
        #80   VPWR = 1'b0;
        #100  A    = 1'b1;
        #120  B_N  = 1'b1;
        #140  VGND = 1'b1;
        #160  VPWR = 1'b1;
        #180  A    = 1'b0;
        #200  B_N  = 1'b0;
        #220  VGND = 1'b0;
        #240  VPWR = 1'b0;
        #260  VPWR = 1'b1;
        #280  VGND = 1'b1;
        #300  B_N  = 1'b1;
        #320  A    = 1'b1;
        #340  VPWR = 1'bx;
        #360  VGND = 1'bx;
        #380  B_N  = 1'bx;
        #400  A    = 1'bx;
    end

    sky130_fd_sc_hs__nor2b dut (.A(A), .B_N(B_N), .VPWR(VPWR), .VGND(VGND), .Y(Y));

endmodule

`default_nettype wire
`endif  // SKY130_FD_SC_HS__NOR2B_TB_V
