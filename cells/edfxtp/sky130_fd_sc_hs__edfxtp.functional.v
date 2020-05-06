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


`ifndef SKY130_FD_SC_HS__EDFXTP_FUNCTIONAL_V
`define SKY130_FD_SC_HS__EDFXTP_FUNCTIONAL_V

/**
 * edfxtp: Delay flop with loopback enable, non-inverted clock,
 *         single output.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import sub cells.
`include "../u_edf_p_pg/sky130_fd_sc_hs__u_edf_p_pg.v"

`celldefine
module sky130_fd_sc_hs__edfxtp (
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
    wire buf_Q;

    //                          Delay       Name         Output  Other arguments
    sky130_fd_sc_hs__u_edf_p_pg `UNIT_DELAY u_edf_p_pg0 (buf_Q , D, CLK, DE, VPWR, VGND);
    buf                                     buf0        (Q     , buf_Q                 );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HS__EDFXTP_FUNCTIONAL_V