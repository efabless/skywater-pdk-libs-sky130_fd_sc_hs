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

`ifndef SKY130_FD_SC_HS__UDP_ISOLATCH_PP_PKG_SN_V
`define SKY130_FD_SC_HS__UDP_ISOLATCH_PP_PKG_SN_V

/**
 * udp_isolatch_pp$PKG$sN: Power isolating latch. Includes VPWR,
 *                         KAPWR, and VGND power pins with notifier
 *                         and active low sleep pin (SLEEP_B).
 *
 * Verilog primitive definition.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`ifdef NO_PRIMITIVES
`include "./sky130_fd_sc_hs__udp_isolatch_pp_pkg_sn.blackbox.v"
`else
primitive sky130_fd_sc_hs__udp_isolatch_pp$PKG$sN (
    Q       ,
    D       ,
    SLEEP_B ,
    NOTIFIER,
    KAPWR   ,
    VGND    ,
    VPWR
);

    output Q       ;
    input  D       ;
    input  SLEEP_B ;
    input  NOTIFIER;
    input  KAPWR   ;
    input  VGND    ;
    input  VPWR    ;

    reg Q;

    table
     //  D   SLEEP_B NOTIFIER KAPWR VGND VPWR : Qtn : Qtn+1
         *      0       ?       1    0    1   :  ?  :   -    ;
         ?     (?0)     ?       1    0    1   :  ?  :   -    ;
         ?     (1x)     ?       1    0    1   :  ?  :   -    ;
         0     (0x)     ?       1    0    1   :  0  :   0    ;
         1     (0x)     ?       1    0    1   :  1  :   1    ;
         0     (x1)     ?       1    0    1   :  ?  :   0    ;
         1     (x1)     ?       1    0    1   :  ?  :   1    ;
        (?0)    1       ?       1    0    1   :  ?  :   0    ;
        (?1)    1       ?       1    0    1   :  ?  :   1    ;
         0     (01)     ?       1    0    1   :  ?  :   0    ;
         1     (01)     ?       1    0    1   :  ?  :   1    ;
        (?1)    x       ?       1    0    1   :  1  :   1    ; // Reducing pessimism.
        (?0)    x       ?       1    0    1   :  0  :   0    ;
         ?      ?       *       1    0    1   :  ?  :   x    ; // any change on notifier
         ?      1       ?       1    0    *   :  ?  :   x    ; // any change on vpwr when not in sleep mode
         ?      x       ?       1    0    *   :  ?  :   x    ; // any change on vpwr when not in sleep mode
         ?      ?       ?       *    ?    1   :  ?  :   x    ; // any change on kapwr
         ?      ?       ?       ?    *    1   :  ?  :   x    ; // any change on vgnd
    endtable
endprimitive
`endif // NO_PRIMITIVES

`default_nettype wire
`endif  // SKY130_FD_SC_HS__UDP_ISOLATCH_PP_PKG_SN_V
