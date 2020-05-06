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


`ifndef SKY130_FD_SC_HS__TAP_FUNCTIONAL_V
`define SKY130_FD_SC_HS__TAP_FUNCTIONAL_V

/**
 * tap: Tap cell with no tap connections (no contacts on metal1).
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_hs__tap (
    VGND,
    VPWR
);

    // Module ports
    input VGND;
    input VPWR;
     // No contents.
endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HS__TAP_FUNCTIONAL_V