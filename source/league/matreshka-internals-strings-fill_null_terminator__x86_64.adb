------------------------------------------------------------------------------
--                                                                          --
--                            Matreshka Project                             --
--                                                                          --
--         Localization, Internationalization, Globalization for Ada        --
--                                                                          --
--                        Runtime Library Component                         --
--                                                                          --
------------------------------------------------------------------------------
--                                                                          --
-- Copyright © 2010, Vadim Godunko <vgodunko@gmail.com>                     --
-- All rights reserved.                                                     --
--                                                                          --
-- Redistribution and use in source and binary forms, with or without       --
-- modification, are permitted provided that the following conditions       --
-- are met:                                                                 --
--                                                                          --
--  * Redistributions of source code must retain the above copyright        --
--    notice, this list of conditions and the following disclaimer.         --
--                                                                          --
--  * Redistributions in binary form must reproduce the above copyright     --
--    notice, this list of conditions and the following disclaimer in the   --
--    documentation and/or other materials provided with the distribution.  --
--                                                                          --
--  * Neither the name of the Vadim Godunko, IE nor the names of its        --
--    contributors may be used to endorse or promote products derived from  --
--    this software without specific prior written permission.              --
--                                                                          --
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS      --
-- "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT        --
-- LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR    --
-- A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT     --
-- HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,   --
-- SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED --
-- TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR   --
-- PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF   --
-- LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING     --
-- NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS       --
-- SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.             --
--                                                                          --
------------------------------------------------------------------------------
--  $Revision$ $Date$
------------------------------------------------------------------------------
--  $Revision$ $Date$
------------------------------------------------------------------------------
with Interfaces;

with Matreshka.Internals.SIMD.Intel;

separate (Matreshka.Internals.Strings)
procedure Fill_Null_Terminator (Self : not null Shared_String_Access) is

   use Interfaces;
   use Matreshka.Internals.SIMD.Intel;

   Fill_Terminator_Mask : constant
     array (Utf16_String_Index range 0 .. 7) of v8hi :=
      (0 => (              others => 0),
       1 => (1      => -1, others => 0),
       2 => (1 .. 2 => -1, others => 0),
       3 => (1 .. 3 => -1, others => 0),
       4 => (1 .. 4 => -1, others => 0),
       5 => (1 .. 5 => -1, others => 0),
       6 => (1 .. 6 => -1, others => 0),
       7 => (1 .. 7 => -1, others => 0));

   type v8hi_Unrestricted_Array is array (Utf16_String_Index) of v8hi;

   Value  : v8hi_Unrestricted_Array;
   for Value'Address use Self.Value'Address;
   Index  : constant Utf16_String_Index := Self.Unused / 8;
   Offset : constant Utf16_String_Index := Self.Unused mod 8;

begin
   Value (Index) :=
     To_v8hi
      (mm_and_si128
        (To_v2di (Value (Index)), To_v2di (Fill_Terminator_Mask (Offset))));
end Fill_Null_Terminator;
