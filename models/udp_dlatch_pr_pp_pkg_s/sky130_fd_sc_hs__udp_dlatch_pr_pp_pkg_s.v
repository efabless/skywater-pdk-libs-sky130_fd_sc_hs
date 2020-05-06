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

`ifndef SKY130_FD_SC_HS__UDP_DLATCH_PR_PP_PKG_S_V
`define SKY130_FD_SC_HS__UDP_DLATCH_PR_PP_PKG_S_V

/**
 * udp_dlatch$PR_pp$PKG$s: D-latch, gated clear direct / gate active
 *                         high (Q output UDP)
 *
 * Verilog primitive definition.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`ifdef NO_PRIMITIVES
`include "./sky130_fd_sc_hs__udp_dlatch_pr_pp_pkg_s.blackbox.v"
`else
primitive sky130_fd_sc_hs__udp_dlatch$PR_pp$PKG$s (
    Q      ,
    D      ,
    GATE   ,
    RESET  ,
    SLEEP_B,
    KAPWR  ,
    VGND   ,
    VPWR
);

    output Q      ;
    input  D      ;
    input  GATE   ;
    input  RESET  ;
    input  SLEEP_B;
    input  KAPWR  ;
    input  VGND   ;
    input  VPWR   ;

    reg Q;

    table
     //  D   GATE RESET SLEEP_B KAPWR VGND VPWR :  Qt : Qt+1
         ?    ?     ?      0      1    0    ?   :  ?  :  -    ; // Retain state during sleep
         ?    0     0      *      1    0    1   :  ?  :  -    ; // Retain state during sleep
         ?    0     1      *      1    0    1   :  ?  :  -    ; // Retain state during sleep
         ?    0     x      *      1    0    1   :  ?  :  x    ; // SLEEPB cannot change if clear is unknown
         ?    1     ?      *      1    0    1   :  ?  :  x    ; // SLEEPB cannot change unless GATE is low
         ?    x     ?      *      1    0    1   :  ?  :  x    ; // SLEEPB cannot change unless GATE is low
         ?    ?     ?      *      1    0    x   :  ?  :  x    ; // SLEEPB cannot change unless VPWR is high
         ?    ?     ?      *      1    0    0   :  ?  :  x    ; // SLEEPB cannot change unless VPWR is high
         *    0     0      1      1    0    1   :  ?  :  -    ;
         ?    ?     1      1      1    0    1   :  ?  :  0    ; // asynchro clear
         ?   (?0)   0      1      1    0    1   :  ?  :  -    ; // Changed R=? to R=0
         ?   (1x)   0      1      1    0    1   :  ?  :  -    ; // Changed R=? to R=0
         0   (0x)   0      1      1    0    1   :  0  :  0    ;
         1   (0x)   0      1      1    0    1   :  1  :  1    ;
         0   (x1)   0      1      1    0    1   :  ?  :  0    ;
         1   (x1)   0      1      1    0    1   :  ?  :  1    ;
        (?0)  1     0      1      1    0    1   :  ?  :  0    ;
        (?1)  1     0      1      1    0    1   :  ?  :  1    ;
         0   (01)   0      1      1    0    1   :  ?  :  0    ;
         1   (01)   0      1      1    0    1   :  ?  :  1    ;
         ?    0    (?x)    1      1    0    1   :  0  :  0    ; // Reducing pessimism.//AB
         *    0     x      1      1    0    1   :  0  :  0    ; // Reducing pessimism//AB
         0   (?1)   x      1      1    0    1   :  ?  :  0    ; // Reducing pessimism.
        (?0)  1     x      1      1    0    1   :  ?  :  0    ; // Reducing pessimism.
         0    1    (?x)    1      1    0    1   :  ?  :  0    ; // Reducing pessimism.//AB
         ?    0    (?0)    1      1    0    1   :  ?  :  -    ; // ignore edge on clear
         0    1    (?0)    1      1    0    1   :  ?  :  0    ; // pessimism .
         1    1    (?0)    1      1    0    1   :  ?  :  1    ;
        (?1)  x     0      1      1    0    1   :  1  :  1    ; // Reducing pessimism.
        (?0)  x     0      1      1    0    1   :  0  :  0    ; // Reducing pessimism.
         ?    ?     ?      ?      *    ?    1   :  ?  :  x    ; // unknown if kapwr changes
         ?    ?     ?      ?      ?    *    1   :  ?  :  x    ; // unknown if vgnd changes
    endtable
endprimitive
`endif // NO_PRIMITIVES

`default_nettype wire
`endif  // SKY130_FD_SC_HS__UDP_DLATCH_PR_PP_PKG_S_V
