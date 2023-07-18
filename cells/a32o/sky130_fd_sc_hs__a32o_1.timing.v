/*
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


`ifndef SKY130_FD_SC_HS__A32O_1_TIMING_V
`define SKY130_FD_SC_HS__A32O_1_TIMING_V

/**
 * a32o: 3-input AND into first input, and 2-input AND into
 *       2nd input of 2-input OR.
 *
 *       X = ((A1 & A2 & A3) | (B1 & B2))
 *
 * Verilog simulation timing model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import sub cells.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hs__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hs__a32o_1 (
    X   ,
    A1  ,
    A2  ,
    A3  ,
    B1  ,
    B2  ,
    VPWR,
    VGND
);

    // Module ports
    output X   ;
    input  A1  ;
    input  A2  ;
    input  A3  ;
    input  B1  ;
    input  B2  ;
    input  VPWR;
    input  VGND;

    // Local signals
    wire    and0_out          ;
    wire    and1_out          ;
    wire    or0_out_X         ;
    wire    udp_pwrgood_pp$PG0_out_X;

    //                           Name          Output              Other arguments
    and                          and0         (and0_out          , A3, A1, A2           );
    and                          and1         (and1_out          , B1, B2               );
    or                           or0          (or0_out_X         , and1_out, and0_out   );
    sky130_fd_sc_hs__udp_pwrgood_pp$PG udp_pwrgood_pp$PG0 (udp_pwrgood_pp$PG0_out_X, or0_out_X, VPWR, VGND);
    buf                          buf0         (X                 , udp_pwrgood_pp$PG0_out_X   );

specify
if ((A2&A3&!B1&!B2)) (A1 +=> X) = (0:0:0,0:0:0);
if ((A2&A3&!B1&B2)) (A1 +=> X) = (0:0:0,0:0:0);
if ((A2&A3&B1&!B2)) (A1 +=> X) = (0:0:0,0:0:0);
if ((A1&A3&!B1&!B2)) (A2 +=> X) = (0:0:0,0:0:0);
if ((A1&A3&!B1&B2)) (A2 +=> X) = (0:0:0,0:0:0);
if ((A1&A3&B1&!B2)) (A2 +=> X) = (0:0:0,0:0:0);
if ((A1&A2&!B1&!B2)) (A3 +=> X) = (0:0:0,0:0:0);
if ((A1&A2&!B1&B2)) (A3 +=> X) = (0:0:0,0:0:0);
if ((A1&A2&B1&!B2)) (A3 +=> X) = (0:0:0,0:0:0);
if ((!A1&!A2&!A3&B2)) (B1 +=> X) = (0:0:0,0:0:0);
if ((!A1&!A2&A3&B2)) (B1 +=> X) = (0:0:0,0:0:0);
if ((!A1&A2&!A3&B2)) (B1 +=> X) = (0:0:0,0:0:0);
if ((!A1&A2&A3&B2)) (B1 +=> X) = (0:0:0,0:0:0);
if ((A1&!A2&!A3&B2)) (B1 +=> X) = (0:0:0,0:0:0);
if ((A1&!A2&A3&B2)) (B1 +=> X) = (0:0:0,0:0:0);
if ((A1&A2&!A3&B2)) (B1 +=> X) = (0:0:0,0:0:0);
if ((!A1&!A2&!A3&B1)) (B2 +=> X) = (0:0:0,0:0:0);
if ((!A1&!A2&A3&B1)) (B2 +=> X) = (0:0:0,0:0:0);
if ((!A1&A2&!A3&B1)) (B2 +=> X) = (0:0:0,0:0:0);
if ((!A1&A2&A3&B1)) (B2 +=> X) = (0:0:0,0:0:0);
if ((A1&!A2&!A3&B1)) (B2 +=> X) = (0:0:0,0:0:0);
if ((A1&!A2&A3&B1)) (B2 +=> X) = (0:0:0,0:0:0);
if ((A1&A2&!A3&B1)) (B2 +=> X) = (0:0:0,0:0:0);
endspecify
endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HS__A32O_1_TIMING_V