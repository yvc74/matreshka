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
--  This package provides several constants to avoid duplication of 32-bit
--  and 64-bit optimized implementations of string management subprograms for
--  little-endian and big-endian platforms.
--
--  This package is for little-endian platforms.
------------------------------------------------------------------------------
with Interfaces;
with Matreshka.Internals.Utf16;

private package Matreshka.Internals.Strings.Constants is

   pragma Preelaborate;

   Terminator_Mask_32 : constant
     array (Matreshka.Internals.Utf16.Utf16_String_Index range 0 .. 1)
       of Interfaces.Unsigned_32
         := (0 => 16#0000_0000#,
             1 => 16#0000_FFFF#);
   --  This mask is used to set unused components of the element to zero on
   --  32-bits platforms.

   Terminator_Mask_64 : constant
     array (Matreshka.Internals.Utf16.Utf16_String_Index range 0 .. 3)
       of Interfaces.Unsigned_64
         := (0 => 16#0000_0000_0000_0000#,
             1 => 16#0000_0000_0000_FFFF#,
             2 => 16#0000_0000_FFFF_FFFF#,
             3 => 16#0000_FFFF_FFFF_FFFF#);
   --  This mask is used to set unused components of the element to zero on
   --  64-bits platforms.

end Matreshka.Internals.Strings.Constants;
