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


`ifndef SKY130_FD_SC_HS__NOR4B_FUNCTIONAL_V
`define SKY130_FD_SC_HS__NOR4B_FUNCTIONAL_V

/**
 * nor4b: 4-input NOR, first input inverted.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import sub cells.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hs__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hs__nor4b (
    VPWR,
    VGND,
    Y   ,
    A   ,
    B   ,
    C   ,
    D_N
);

    // Module ports
    input  VPWR;
    input  VGND;
    output Y   ;
    input  A   ;
    input  B   ;
    input  C   ;
    input  D_N ;

    // Local signals
    wire	DN not0_out          ;
    wire    nor0_out_Y        ;
    wire    udp_pwrgood_pp$PG0_out_Y;

    //                           Name          Output              Other arguments
    not                          not0         (not0_out          , D_N                   );
    nor                          nor0         (nor0_out_Y        , A, B, C, not0_out     );
    sky130_fd_sc_hs__udp_pwrgood_pp$PG udp_pwrgood_pp$PG0 (udp_pwrgood_pp$PG0_out_Y, nor0_out_Y, VPWR, VGND);
    buf                          buf0         (Y                 , udp_pwrgood_pp$PG0_out_Y    );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HS__NOR4B_FUNCTIONAL_V
