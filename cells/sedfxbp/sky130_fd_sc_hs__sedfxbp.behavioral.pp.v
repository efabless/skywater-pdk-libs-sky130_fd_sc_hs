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


`ifndef SKY130_FD_SC_HS__SEDFXBP_BEHAVIORAL_PP_V
`define SKY130_FD_SC_HS__SEDFXBP_BEHAVIORAL_PP_V

/**
 * sedfxbp: Scan delay flop, data enable, non-inverted clock,
 *          complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import sub cells.
`include "../u_mux_2/sky130_fd_sc_hs__u_mux_2.v"
`include "../u_df_p_no_pg/sky130_fd_sc_hs__u_df_p_no_pg.v"

`celldefine
module sky130_fd_sc_hs__sedfxbp (
    Q   ,
    Q_N ,
    CLK ,
    D   ,
    DE  ,
    SCD ,
    SCE ,
    VPWR,
    VGND
);

    // Module ports
    output Q   ;
    output Q_N ;
    input  CLK ;
    input  D   ;
    input  DE  ;
    input  SCD ;
    input  SCE ;
    input  VPWR;
    input  VGND;

    // Local signals
    wire buf_Q      ;
    reg  notifier   ;
    wire D_delayed  ;
    wire DE_delayed ;
    wire SCD_delayed;
    wire SCE_delayed;
    wire CLK_delayed;
    wire mux_out    ;
    wire de_d       ;
    wire awake      ;
    wire cond1      ;
    wire cond2      ;
    wire cond3      ;

    //                            Name           Output   Other arguments
    sky130_fd_sc_hs__u_mux_2_1    u_mux_20      (mux_out, de_d, SCD_delayed, SCE_delayed            );
    sky130_fd_sc_hs__u_mux_2_1    u_mux_21      (de_d   , buf_Q, D_delayed, DE_delayed              );
    sky130_fd_sc_hs__u_df_p_no_pg u_df_p_no_pg0 (buf_Q  , mux_out, CLK_delayed, notifier, VPWR, VGND);
    assign awake = ( VPWR === 1'b1 );
    assign cond1 = ( awake && ( SCE_delayed === 1'b0 ) && ( DE_delayed === 1'b1 ) );
    assign cond2 = ( awake && ( SCE_delayed === 1'b1 ) );
    assign cond3 = ( awake && ( DE_delayed === 1'b1 ) && ( D_delayed !== SCD_delayed ) );
    buf                           buf0          (Q      , buf_Q                                     );
    not                           not0          (Q_N    , buf_Q                                     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HS__SEDFXBP_BEHAVIORAL_PP_V