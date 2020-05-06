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

`ifndef SKY130_FD_SC_HS__DLRBN_1_V
`define SKY130_FD_SC_HS__DLRBN_1_V

/**
 * dlrbn: Delay latch, inverted reset, inverted enable,
 *        complementary outputs.
 *
 * Verilog wrapper for dlrbn with size of 1 units.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`include "sky130_fd_sc_hs__dlrbn.v"

`ifdef USE_POWER_PINS
/*********************************************************/

`celldefine
module sky130_fd_sc_hs__dlrbn_1 (
    RESET_B,
    D      ,
    GATE_N ,
    Q      ,
    Q_N    ,
    VPWR   ,
    VGND
);

    input  RESET_B;
    input  D      ;
    input  GATE_N ;
    output Q      ;
    output Q_N    ;
    input  VPWR   ;
    input  VGND   ;
    sky130_fd_sc_hs__dlrbn cell (
        .RESET_B(RESET_B),
        .D(D),
        .GATE_N(GATE_N),
        .Q(Q),
        .Q_N(Q_N),
        .VPWR(VPWR),
        .VGND(VGND)
    );

endmodule
`endcelldefine

/*********************************************************/
`else // If not USE_POWER_PINS
/*********************************************************/

`celldefine
module sky130_fd_sc_hs__dlrbn_1 (
    RESET_B,
    D      ,
    GATE_N ,
    Q      ,
    Q_N    ,
    VPWR   ,
    VGND
);

    input  RESET_B;
    input  D      ;
    input  GATE_N ;
    output Q      ;
    output Q_N    ;
    input  VPWR   ;
    input  VGND   ;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;

    sky130_fd_sc_hs__dlrbn cell (
        .RESET_B(RESET_B),
        .D(D),
        .GATE_N(GATE_N),
        .Q(Q),
        .Q_N(Q_N)
    );

endmodule
`endcelldefine

/*********************************************************/
`endif // USE_POWER_PINS

`default_nettype wire
`endif  // SKY130_FD_SC_HS__DLRBN_1_V
