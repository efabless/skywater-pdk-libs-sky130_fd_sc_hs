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


`ifndef SKY130_FD_SC_HS__A2BB2OI_1_TIMING_PP_V
`define SKY130_FD_SC_HS__A2BB2OI_1_TIMING_PP_V

/**
 * a2bb2oi: 2-input AND, both inputs inverted, into first input, and
 *          2-input AND into 2nd input of 2-input NOR.
 *
 *          Y = !((!A1 & !A2) | (B1 & B2))
 *
 * Verilog simulation timing model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import sub cells.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hs__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hs__a2bb2oi_1 (
    VPWR,
    VGND,
    Y   ,
    A1_N,
    A2_N,
    B1  ,
    B2
);

    // Module ports
    input  VPWR;
    input  VGND;
    output Y   ;
    input  A1_N;
    input  A2_N;
    input  B1  ;
    input  B2  ;

    // Local signals
    wire    and0_out          ;
    wire    nor0_out          ;
    wire    nor1_out_Y        ;
    wire    udp_pwrgood_pp$PG0_out_Y;

    //                           Name          Output              Other arguments
    and                          and0         (and0_out          , B1, B2                );
    nor                          nor0         (nor0_out          , A1_N, A2_N            );
    nor                          nor1         (nor1_out_Y        , nor0_out, and0_out    );
    sky130_fd_sc_hs__udp_pwrgood_pp$PG udp_pwrgood_pp$PG0 (udp_pwrgood_pp$PG0_out_Y, nor1_out_Y, VPWR, VGND);
    buf                          buf0         (Y                 , udp_pwrgood_pp$PG0_out_Y    );

specify
if ((!A2_N&!B1&!B2)) (A1_N +=> Y) = (0:0:0,0:0:0);
if ((!A2_N&!B1&B2)) (A1_N +=> Y) = (0:0:0,0:0:0);
if ((!A2_N&B1&!B2)) (A1_N +=> Y) = (0:0:0,0:0:0);
if ((!A1_N&!B1&!B2)) (A2_N +=> Y) = (0:0:0,0:0:0);
if ((!A1_N&!B1&B2)) (A2_N +=> Y) = (0:0:0,0:0:0);
if ((!A1_N&B1&!B2)) (A2_N +=> Y) = (0:0:0,0:0:0);
if ((!A1_N&A2_N&B2)) (B1 -=> Y) = (0:0:0,0:0:0);
if ((A1_N&!A2_N&B2)) (B1 -=> Y) = (0:0:0,0:0:0);
if ((A1_N&A2_N&B2)) (B1 -=> Y) = (0:0:0,0:0:0);
if ((!A1_N&A2_N&B1)) (B2 -=> Y) = (0:0:0,0:0:0);
if ((A1_N&!A2_N&B1)) (B2 -=> Y) = (0:0:0,0:0:0);
if ((A1_N&A2_N&B1)) (B2 -=> Y) = (0:0:0,0:0:0);
endspecify
endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HS__A2BB2OI_1_TIMING_PP_V
