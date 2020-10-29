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

`ifndef SKY130_FD_SC_HS__AND3B_2_V
`define SKY130_FD_SC_HS__AND3B_2_V

/**
 * and3b: 3-input AND, first input inverted.
 *
 * Verilog wrapper for and3b with size of 2 units.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`include "sky130_fd_sc_hs__and3b.v"

`ifdef USE_POWER_PINS
/*********************************************************/

`celldefine
module sky130_fd_sc_hs__and3b_2 (
    X   ,
    A_N ,
    B   ,
    C   ,
    VPWR,
    VGND
);

    output X   ;
    input  A_N ;
    input  B   ;
    input  C   ;
    input  VPWR;
    input  VGND;
    sky130_fd_sc_hs__and3b base (
        .X(X),
        .A_N(A_N),
        .B(B),
        .C(C),
        .VPWR(VPWR),
        .VGND(VGND)
    );

endmodule
`endcelldefine

/*********************************************************/
`else // If not USE_POWER_PINS
/*********************************************************/

`celldefine
module sky130_fd_sc_hs__and3b_2 (
    X  ,
    A_N,
    B  ,
    C
);

    output X  ;
    input  A_N;
    input  B  ;
    input  C  ;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;

    sky130_fd_sc_hs__and3b base (
        .X(X),
        .A_N(A_N),
        .B(B),
        .C(C)
    );

endmodule
`endcelldefine

/*********************************************************/
`endif // USE_POWER_PINS

`default_nettype wire
`endif  // SKY130_FD_SC_HS__AND3B_2_V
