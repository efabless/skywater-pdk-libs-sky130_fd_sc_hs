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

`ifndef SKY130_FD_SC_HS__UDP_DFF_PR_PP_SN_V
`define SKY130_FD_SC_HS__UDP_DFF_PR_PP_SN_V

/**
 * udp_dff$PR_pp$sN: Positive edge triggered D flip-flop with active
 *                   high
 *
 * Verilog primitive definition.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`ifdef NO_PRIMITIVES
`include "./sky130_fd_sc_hs__udp_dff_pr_pp_sn.blackbox.v"
`else
primitive sky130_fd_sc_hs__udp_dff$PR_pp$sN (
    Q       ,
    D       ,
    CLK     ,
    RESET   ,
    SLEEP_B ,
    NOTIFIER
);

    output Q       ;
    input  D       ;
    input  CLK     ;
    input  RESET   ;
    input  SLEEP_B ;
    input  NOTIFIER;

    reg Q;

    table
     //  D  CLK  RESET SLEEP_B NOTIFIER :  Qt : Qt+1
         ?   ?     ?      0       ?     :  ?  :  -    ; // Retain state during sleep
         ?   ?     ?     (01)     ?     :  ?  :  -    ; // Retain state during sleep
         1  (01)   0      1       ?     :  ?  :  1    ; // clocked data
         0  (01)   0      1       ?     :  ?  :  0    ;
         0  (01)   x      1       ?     :  ?  :  0    ; // pessimism
         0   ?     x      1       ?     :  0  :  0    ; // pessimism
         1   0     x      1       ?     :  0  :  0    ; // pessimism
         1   x    (?x)    1       ?     :  0  :  0    ; // pessimism
         1   1    (?x)    1       ?     :  0  :  0    ; // pessimism
         x   0     x      1       ?     :  0  :  0    ; // pessimism
         x   x    (?x)    1       ?     :  0  :  0    ; // pessimism
         x   1    (?x)    1       ?     :  0  :  0    ; // pessimism
         1  (x1)   0      1       ?     :  1  :  1    ; // reducing pessimism
         0  (x1)   0      1       ?     :  0  :  0    ;
         1  (0x)   0      1       ?     :  1  :  1    ;
         0  (0x)   0      1       ?     :  0  :  0    ;
         ?   ?     1      1       ?     :  ?  :  0    ; // asynchronous clear
         ?  (?0)   ?      1       ?     :  ?  :  -    ; // ignore falling clock
         ?  (1x)   ?      1       ?     :  ?  :  -    ; // ignore falling clock
         *   ?     ?      1       ?     :  ?  :  -    ; // ignore the edges on data
         ?   ?    (?0)    1       ?     :  ?  :  -    ; // ignore the edges on clear
         ?   ?     ?      1       *     :  ?  :  x    ;
    endtable
endprimitive
`endif // NO_PRIMITIVES

`default_nettype wire
`endif  // SKY130_FD_SC_HS__UDP_DFF_PR_PP_SN_V
