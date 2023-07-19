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


`ifndef SKY130_FD_SC_HS__DLXBN_2_TIMING_PP_V
`define SKY130_FD_SC_HS__DLXBN_2_TIMING_PP_V

/**
 * dlxbn: Delay latch, inverted enable, complementary outputs.
 *
 * Verilog simulation timing model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import sub cells.
`include "../u_dl_p_no_pg/sky130_fd_sc_hs__u_dl_p_no_pg.v"

`celldefine
module sky130_fd_sc_hs__dlxbn_2 (
    VPWR  ,
    VGND  ,
    Q     ,
    Q_N   ,
    D     ,
    GATE_N
);

    // Module ports
    input  VPWR  ;
    input  VGND  ;
    output Q     ;
    output Q_N   ;
    input  D     ;
    input  GATE_N;

    // Local signals
    wire GATE          ;
    wire buf_Q         ;
    wire GATE_N_delayed;
    wire D_delayed     ;
    reg  notifier      ;
    wire awake         ;

    //                            Name           Output  Other arguments
    not                           not0          (GATE  , GATE_N_delayed                       );
    sky130_fd_sc_hs__u_dl_p_no_pg u_dl_p_no_pg0 (buf_Q , D_delayed, GATE, notifier, VPWR, VGND);
    assign awake = ( VPWR === 1 );
    buf                           buf0          (Q     , buf_Q                                );
    not                           not1          (Q_N   , buf_Q                                );

specify
( D +=> Q ) = ( 0:0:0 , 0:0:0 ) ;  // delays are tris , tfall
( D -=> Q_N ) = ( 0:0:0 , 0:0:0 ) ;  // delays are tris , tfall
( negedge GATE_N => ( Q +: D ) ) = ( 0:0:0 , 0:0:0 ) ; // delays are tris , tfall
( negedge GATE_N => ( Q_N -: D ) ) = ( 0:0:0 , 0:0:0 ) ; // delays are  tris , tfall
$width ( posedge GATE_N &&& awake , 1.0:1.0:1.0 , 0 , notifier ) ;
$width ( negedge GATE_N &&& awake , 1.0:1.0:1.0 , 0 , notifier ) ;
$setuphold ( posedge GATE_N , posedge D , 0:0:0 , 0:0:0 , notifier , awake , awake , GATE_N_delayed , D_delayed ) ;
$setuphold ( posedge GATE_N , negedge D , 0:0:0 , 0:0:0 , notifier , awake , awake , GATE_N_delayed , D_delayed ) ;
endspecify
endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HS__DLXBN_2_TIMING_PP_V
