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


`ifndef SKY130_FD_SC_HS__O221AI_BEHAVIORAL_PP_V
`define SKY130_FD_SC_HS__O221AI_BEHAVIORAL_PP_V

/**
 * o221ai: 2-input OR into first two inputs of 3-input NAND.
 *
 *         Y = !((A1 | A2) & (B1 | B2) & C1)
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import sub cells.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hs__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hs__o221ai (
    VPWR,
    VGND,
    Y   ,
    A1  ,
    A2  ,
    B1  ,
    B2  ,
    C1
);

    // Module ports
    input  VPWR;
    input  VGND;
    output Y   ;
    input  A1  ;
    input  A2  ;
    input  B1  ;
    input  B2  ;
    input  C1  ;

    // Local signals
    wire	B2 or0_out           ;
    wire	B2 or1_out           ;
    wire    nand0_out_Y       ;
    wire    udp_pwrgood_pp$PG0_out_Y;

    //                           Name          Output              Other arguments
    or                           or0          (or0_out           , B2, B1                 );
    or                           or1          (or1_out           , A2, A1                 );
    nand                         nand0        (nand0_out_Y       , or1_out, or0_out, C1   );
    sky130_fd_sc_hs__udp_pwrgood_pp$PG udp_pwrgood_pp$PG0 (udp_pwrgood_pp$PG0_out_Y, nand0_out_Y, VPWR, VGND);
    buf                          buf0         (Y                 , udp_pwrgood_pp$PG0_out_Y     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HS__O221AI_BEHAVIORAL_PP_V
