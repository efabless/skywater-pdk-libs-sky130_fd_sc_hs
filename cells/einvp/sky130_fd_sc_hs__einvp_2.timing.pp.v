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


`ifndef SKY130_FD_SC_HS__EINVP_2_TIMING_PP_V
`define SKY130_FD_SC_HS__EINVP_2_TIMING_PP_V

/**
 * einvp: Tri-state inverter, positive enable.
 *
 * Verilog simulation timing model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import sub cells.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_hs__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_hs__einvp_2 (
    VPWR,
    VGND,
    Z   ,
    A   ,
    TE
);

    // Module ports
    input  VPWR;
    input  VGND;
    output Z   ;
    input  A   ;
    input  TE  ;

    // Local signals
    wire udp_pwrgood_pp$PG0_out_A ;
    wire udp_pwrgood_pp$PG1_out_TE;

    //                           Name          Output               Other arguments
    sky130_fd_sc_hs__udp_pwrgood_pp$PG udp_pwrgood_pp$PG0 (udp_pwrgood_pp$PG0_out_A , A, VPWR, VGND                          );
    sky130_fd_sc_hs__udp_pwrgood_pp$PG udp_pwrgood_pp$PG1 (udp_pwrgood_pp$PG1_out_TE, TE, VPWR, VGND                         );
    notif1                       notif10      (Z                  , udp_pwrgood_pp$PG0_out_A, udp_pwrgood_pp$PG1_out_TE);

specify
if (TE ) (A -=> Z ) = (0:0:0,0:0:0);  // delays are tris,tfall
(TE => Z ) = (0:0:0,0:0:0,0:0:0,0:0:0,0:0:0,0:0:0);  // delays are t01,t10,t0Z,tZ1,t1Z,tZ0
endspecify
endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HS__EINVP_2_TIMING_PP_V
