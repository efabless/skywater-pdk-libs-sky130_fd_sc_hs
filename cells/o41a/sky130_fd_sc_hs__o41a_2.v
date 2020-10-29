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

`ifndef SKY130_FD_SC_HS__O41A_2_V
`define SKY130_FD_SC_HS__O41A_2_V

/**
 * o41a: 4-input OR into 2-input AND.
 *
 *       X = ((A1 | A2 | A3 | A4) & B1)
 *
 * Verilog wrapper for o41a with size of 2 units.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`include "sky130_fd_sc_hs__o41a.v"

`ifdef USE_POWER_PINS
/*********************************************************/

`celldefine
module sky130_fd_sc_hs__o41a_2 (
    X   ,
    A1  ,
    A2  ,
    A3  ,
    A4  ,
    B1  ,
    VPWR,
    VGND
);

    output X   ;
    input  A1  ;
    input  A2  ;
    input  A3  ;
    input  A4  ;
    input  B1  ;
    input  VPWR;
    input  VGND;
    sky130_fd_sc_hs__o41a base (
        .X(X),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        .A4(A4),
        .B1(B1),
        .VPWR(VPWR),
        .VGND(VGND)
    );

endmodule
`endcelldefine

/*********************************************************/
`else // If not USE_POWER_PINS
/*********************************************************/

`celldefine
module sky130_fd_sc_hs__o41a_2 (
    X ,
    A1,
    A2,
    A3,
    A4,
    B1
);

    output X ;
    input  A1;
    input  A2;
    input  A3;
    input  A4;
    input  B1;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;

    sky130_fd_sc_hs__o41a base (
        .X(X),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        .A4(A4),
        .B1(B1)
    );

endmodule
`endcelldefine

/*********************************************************/
`endif // USE_POWER_PINS

`default_nettype wire
`endif  // SKY130_FD_SC_HS__O41A_2_V
