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
-- Copyright © 2009-2011, Vadim Godunko <vgodunko@gmail.com>                --
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
--  This is GCC version for 64-bit target.
------------------------------------------------------------------------------
with Ada.Unchecked_Conversion;
with Interfaces;
with System;

function Matreshka.Atomics.Generic_Test_And_Set
 (Target         : not null access T_Access;
  Expected_Value : T_Access;
  New_Value      : T_Access)
    return Boolean
is
   pragma Assert (T_Access'Size = System.Address'Size);
   pragma Assert (T_Access'Size = 64);

   function To_Unsigned_64 is
     new Ada.Unchecked_Conversion (T_Access, Interfaces.Unsigned_64);

   function Sync_Bool_Compare_And_Swap_64
    (Ptr     : not null access T_Access;
     Old_Val : Interfaces.Unsigned_64;
     New_Val : Interfaces.Unsigned_64) return Boolean;
   pragma Import
    (Intrinsic,
     Sync_Bool_Compare_And_Swap_64,
     "__sync_bool_compare_and_swap_8");

begin
   return
     Sync_Bool_Compare_And_Swap_64
      (Target, To_Unsigned_64 (Expected_Value), To_Unsigned_64 (New_Value));
end Matreshka.Atomics.Generic_Test_And_Set;