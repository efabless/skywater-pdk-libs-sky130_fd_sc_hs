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


`ifndef SKY130_FD_SC_HS__SDFBBP_FUNCTIONAL_PP_V
`define SKY130_FD_SC_HS__SDFBBP_FUNCTIONAL_PP_V

/**
 * sdfbbp: Scan delay flop, inverted set, inverted reset, non-inverted
 *         clock, complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import sub cells.
`include "../u_dfb_setdom_pg/sky130_fd_sc_hs__u_dfb_setdom_pg.v"
`include "../u_mux_2/sky130_fd_sc_hs__u_mux_2.v"

`celldefine
module sky130_fd_sc_hs__sdfbbp (
    Q      ,
    Q_N    ,
    D      ,
    SCD    ,
    SCE    ,
    CLK    ,
    SET_B  ,
    RESET_B,
    VPWR   ,
    VGND
);

    // Module ports
    output Q      ;
    output Q_N    ;
    input  D      ;
    input  SCD    ;
    input  SCE    ;
    input  CLK    ;
    input  SET_B  ;
    input  RESET_B;
    input  VPWR   ;
    input  VGND   ;

    // Local signals
    wire RESET  ;
    wire SET    ;
    wire buf_Q  ;
    wire mux_out;

    //                               Delay       Name              Output   Other arguments
    not                                          not0             (RESET  , RESET_B                             );
    not                                          not1             (SET    , SET_B                               );
    sky130_fd_sc_hs__u_mux_2_1                   u_mux_20         (mux_out, D, SCD, SCE                         );
    sky130_fd_sc_hs__u_dfb_setdom_pg `UNIT_DELAY u_dfb_setdom_pg0 (buf_Q  , SET, RESET, CLK, mux_out, VPWR, VGND);
    buf                                          buf0             (Q      , buf_Q                               );
    not                                          not2             (Q_N    , buf_Q                               );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HS__SDFBBP_FUNCTIONAL_PP_V
