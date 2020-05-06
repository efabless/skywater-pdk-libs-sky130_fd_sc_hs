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


`ifndef SKY130_FD_SC_HS__SDLCLKP_BEHAVIORAL_PP_V
`define SKY130_FD_SC_HS__SDLCLKP_BEHAVIORAL_PP_V

/**
 * sdlclkp: Scan gated clock.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import sub cells.
`include "../u_dl_p_no_pg/sky130_fd_sc_hs__u_dl_p_no_pg.v"

`celldefine
module sky130_fd_sc_hs__sdlclkp (
    VPWR,
    VGND,
    GCLK,
    SCE ,
    GATE,
    CLK
);

    // Module ports
    input  VPWR;
    input  VGND;
    output GCLK;
    input  SCE ;
    input  GATE;
    input  CLK ;

    // Local signals
    wire m0              ;
    wire m0n             ;
    wire clkn            ;
    wire CLK_delayed     ;
    wire SCE_delayed     ;
    wire GATE_delayed    ;
    wire SCE_gate_delayed;
    reg  notifier        ;
    wire awake           ;
    wire SCE_awake       ;
    wire GATE_awake      ;

    //                            Name           Output            Other arguments
    not                           not0          (m0n             , m0                                          );
    not                           not1          (clkn            , CLK_delayed                                 );
    nor                           nor0          (SCE_gate_delayed, GATE_delayed, SCE_delayed                   );
    sky130_fd_sc_hs__u_dl_p_no_pg u_dl_p_no_pg0 (m0              , SCE_gate_delayed, clkn, notifier, VPWR, VGND);
    and                           and0          (GCLK            , m0n, CLK_delayed                            );
    assign awake = ( VPWR === 1'b1 );
    assign SCE_awake = ( awake & ( GATE_delayed === 1'b0 ) );
    assign GATE_awake = ( awake & ( SCE_delayed === 1'b0 ) );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HS__SDLCLKP_BEHAVIORAL_PP_V