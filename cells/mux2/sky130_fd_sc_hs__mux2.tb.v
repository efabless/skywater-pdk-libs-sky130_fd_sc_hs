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

`ifndef SKY130_FD_SC_HS__MUX2_TB_V
`define SKY130_FD_SC_HS__MUX2_TB_V

/**
 * mux2: 2-input multiplexer.
 *
 * Autogenerated test bench.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`include "sky130_fd_sc_hs__mux2.v"

module top();

    // Inputs are registered
    reg A0;
    reg A1;
    reg S;
    reg VPWR;
    reg VGND;

    // Outputs are wires
    wire X;

    initial
    begin
        // Initial state is x for all inputs.
        A0   = 1'bX;
        A1   = 1'bX;
        S    = 1'bX;
        VGND = 1'bX;
        VPWR = 1'bX;

        #20   A0   = 1'b0;
        #40   A1   = 1'b0;
        #60   S    = 1'b0;
        #80   VGND = 1'b0;
        #100  VPWR = 1'b0;
        #120  A0   = 1'b1;
        #140  A1   = 1'b1;
        #160  S    = 1'b1;
        #180  VGND = 1'b1;
        #200  VPWR = 1'b1;
        #220  A0   = 1'b0;
        #240  A1   = 1'b0;
        #260  S    = 1'b0;
        #280  VGND = 1'b0;
        #300  VPWR = 1'b0;
        #320  VPWR = 1'b1;
        #340  VGND = 1'b1;
        #360  S    = 1'b1;
        #380  A1   = 1'b1;
        #400  A0   = 1'b1;
        #420  VPWR = 1'bx;
        #440  VGND = 1'bx;
        #460  S    = 1'bx;
        #480  A1   = 1'bx;
        #500  A0   = 1'bx;
    end

    sky130_fd_sc_hs__mux2 dut (.A0(A0), .A1(A1), .S(S), .VPWR(VPWR), .VGND(VGND), .X(X));

endmodule

`default_nettype wire
`endif  // SKY130_FD_SC_HS__MUX2_TB_V
