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

`ifndef SKY130_FD_SC_HS__MUX4_TB_V
`define SKY130_FD_SC_HS__MUX4_TB_V

/**
 * mux4: 4-input multiplexer.
 *
 * Autogenerated test bench.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`include "sky130_fd_sc_hs__mux4.v"

module top();

    // Inputs are registered
    reg A0;
    reg A1;
    reg A2;
    reg A3;
    reg S0;
    reg S1;
    reg VPWR;
    reg VGND;

    // Outputs are wires
    wire X;

    initial
    begin
        // Initial state is x for all inputs.
        A0   = 1'bX;
        A1   = 1'bX;
        A2   = 1'bX;
        A3   = 1'bX;
        S0   = 1'bX;
        S1   = 1'bX;
        VGND = 1'bX;
        VPWR = 1'bX;

        #20   A0   = 1'b0;
        #40   A1   = 1'b0;
        #60   A2   = 1'b0;
        #80   A3   = 1'b0;
        #100  S0   = 1'b0;
        #120  S1   = 1'b0;
        #140  VGND = 1'b0;
        #160  VPWR = 1'b0;
        #180  A0   = 1'b1;
        #200  A1   = 1'b1;
        #220  A2   = 1'b1;
        #240  A3   = 1'b1;
        #260  S0   = 1'b1;
        #280  S1   = 1'b1;
        #300  VGND = 1'b1;
        #320  VPWR = 1'b1;
        #340  A0   = 1'b0;
        #360  A1   = 1'b0;
        #380  A2   = 1'b0;
        #400  A3   = 1'b0;
        #420  S0   = 1'b0;
        #440  S1   = 1'b0;
        #460  VGND = 1'b0;
        #480  VPWR = 1'b0;
        #500  VPWR = 1'b1;
        #520  VGND = 1'b1;
        #540  S1   = 1'b1;
        #560  S0   = 1'b1;
        #580  A3   = 1'b1;
        #600  A2   = 1'b1;
        #620  A1   = 1'b1;
        #640  A0   = 1'b1;
        #660  VPWR = 1'bx;
        #680  VGND = 1'bx;
        #700  S1   = 1'bx;
        #720  S0   = 1'bx;
        #740  A3   = 1'bx;
        #760  A2   = 1'bx;
        #780  A1   = 1'bx;
        #800  A0   = 1'bx;
    end

    sky130_fd_sc_hs__mux4 dut (.A0(A0), .A1(A1), .A2(A2), .A3(A3), .S0(S0), .S1(S1), .VPWR(VPWR), .VGND(VGND), .X(X));

endmodule

`default_nettype wire
`endif  // SKY130_FD_SC_HS__MUX4_TB_V
