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


`ifndef SKY130_FD_SC_HS__MUX2_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HS__MUX2_FUNCTIONAL_PP_V

/**
 * mux2: 2-input multiplexer.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import sub cells.
`include "../u_mux_2/sky130_fd_sc_hs__u_mux_2.v"
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hs__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hs__mux2 (
    VPWR,
    VGND,
    X   ,
    A0  ,
    A1  ,
    S
);

    // Module ports
    input  VPWR;
    input  VGND;
    output X   ;
    input  A0  ;
    input  A1  ;
    input  S   ;

    // Local signals
    wire   u_mux_20_out_X    ;
    wire   udp_pwrgood_pp$PG0_out_X;

    //                           Name          Output              Other arguments
    sky130_fd_sc_hs__u_mux_2_1   u_mux_20     (u_mux_20_out_X    , A0, A1, S                 );
    sky130_fd_sc_hs__udp_pwrgood_pp$PG udp_pwrgood_pp$PG0 (udp_pwrgood_pp$PG0_out_X, u_mux_20_out_X, VPWR, VGND);
    buf                          buf0         (X                 , udp_pwrgood_pp$PG0_out_X        );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HS__MUX2_FUNCTIONAL_PP_V
