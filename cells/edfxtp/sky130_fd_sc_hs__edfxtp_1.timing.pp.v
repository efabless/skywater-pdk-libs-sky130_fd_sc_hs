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


`ifndef SKY130_FD_SC_HS__EDFXTP_1_TIMING_PP_V
`define SKY130_FD_SC_HS__EDFXTP_1_TIMING_PP_V

/**
 * edfxtp: Delay flop with loopback enable, non-inverted clock,
 *         single output.
 *
 * Verilog simulation timing model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import sub cells.
`include "../u_edf_p_no_pg/sky130_fd_sc_hs__u_edf_p_no_pg.v"

`celldefine
module sky130_fd_sc_hs__edfxtp_1 (
    Q   ,
    CLK ,
    D   ,
    DE  ,
    VPWR,
    VGND
);

    // Module ports
    output Q   ;
    input  CLK ;
    input  D   ;
    input  DE  ;
    input  VPWR;
    input  VGND;

    // Local signals
    wire buf_Q      ;
    reg  notifier   ;
    wire D_delayed  ;
    wire DE_delayed ;
    wire CLK_delayed;
    wire awake      ;
    wire cond0      ;

    //                             Name            Output  Other arguments
    sky130_fd_sc_hs__u_edf_p_no_pg u_edf_p_no_pg0 (buf_Q , D_delayed, CLK_delayed, DE_delayed, notifier, VPWR, VGND);
    assign awake = ( VPWR === 1'b1 );
    assign cond0 = ( awake && ( DE_delayed === 1'b1 ) );
    buf                            buf0           (Q     , buf_Q                                                   );

specify
( posedge CLK => ( Q : CLK ) ) = ( 0:0:0 , 0:0:0 ) ; // delays are tris , tfall
$width ( posedge CLK &&& awake , 1.0:1.0:1.0 , 0 , notifier ) ;
$width ( negedge CLK &&& awake , 1.0:1.0:1.0 , 0 , notifier ) ;
$setuphold ( posedge CLK , posedge DE , 0:0:0 , 0:0:0 , notifier , awake , awake , CLK_delayed , DE_delayed ) ;
$setuphold ( posedge CLK , negedge DE , 0:0:0 , 0:0:0 , notifier , awake , awake , CLK_delayed , DE_delayed ) ;
$setuphold ( posedge CLK , posedge D , 0:0:0 , 0:0:0 , notifier , cond0 ,  cond0 , CLK_delayed , D_delayed ) ;
$setuphold ( posedge CLK , negedge D , 0:0:0 , 0:0:0 , notifier , cond0 ,  cond0 , CLK_delayed , D_delayed ) ;
endspecify
endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HS__EDFXTP_1_TIMING_PP_V
