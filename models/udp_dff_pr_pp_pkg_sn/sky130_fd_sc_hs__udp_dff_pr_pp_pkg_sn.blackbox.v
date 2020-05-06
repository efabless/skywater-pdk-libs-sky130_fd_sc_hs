/**
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

`ifndef SKY130_FD_SC_HS__UDP_DFF_PR_PP_PKG_SN_BLACKBOX_V
`define SKY130_FD_SC_HS__UDP_DFF_PR_PP_PKG_SN_BLACKBOX_V

/**
 * udp_dff$PR_pp$PKG$sN: Positive edge triggered D flip-flop with
 *                       active high
 *
 * Verilog stub definition (black box with power pins).
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

(* blackbox *)
module sky130_fd_sc_hs__udp_dff$PR_pp$PKG$sN (
    Q       ,
    D       ,
    CLK     ,
    RESET   ,
    SLEEP_B ,
    NOTIFIER,
    KAPWR   ,
    VGND    ,
    VPWR
);

    output Q       ;
    input  D       ;
    input  CLK     ;
    input  RESET   ;
    input  SLEEP_B ;
    input  NOTIFIER;
    input  KAPWR   ;
    input  VGND    ;
    input  VPWR    ;
endmodule

`default_nettype wire
`endif  // SKY130_FD_SC_HS__UDP_DFF_PR_PP_PKG_SN_BLACKBOX_V
