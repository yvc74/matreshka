------------------------------------------------------------------------------
--                                                                          --
--                            Matreshka Project                             --
--                                                                          --
--                               XML Processor                              --
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
--  This package provides symbol table to store frequently used strings,
--  allocate identifier for them and reduce number of memory allocations by
--  reusing shared strings.
------------------------------------------------------------------------------
with Ada.Unchecked_Deallocation;

with League.Strings.Internals;
with Matreshka.Internals.Strings.Operations;
with Matreshka.Internals.Unicode;

package body Matreshka.Internals.XML.Symbol_Tables is

   First_Symbol : constant Symbol_Identifier := No_Symbol + 1;

   procedure Register_Predefined_Entity
    (Self   : in out Symbol_Table;
     Name   : League.Strings.Universal_String;
     Entity : Entity_Identifier);
   --  Registers predefined entity.

   procedure Free is
     new Ada.Unchecked_Deallocation
          (Symbol_Record_Array, Symbol_Record_Array_Access);

   --------------
   -- Finalize --
   --------------

   procedure Finalize (Self : in out Symbol_Table) is
      use type Matreshka.Internals.Strings.Shared_String_Access;

   begin
      for J in First_Symbol .. Self.Last loop
         Matreshka.Internals.Strings.Dereference (Self.Table (J).String);
      end loop;

      Free (Self.Table);
   end Finalize;

   --------------------
   -- General_Entity --
   --------------------

   function General_Entity
    (Self       : Symbol_Table;
     Identifier : Symbol_Identifier) return Entity_Identifier is
   begin
      return Self.Table (Identifier).General_Entity;
   end General_Entity;

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize (Self : in out Symbol_Table) is
   begin
      Self.Table := new Symbol_Record_Array (First_Symbol .. 256);
      Self.Last  := No_Symbol;

      --  Register predefined entities.

      Register_Predefined_Entity
       (Self   => Self,
        Name   => League.Strings.To_Universal_String ("lt"),
        Entity => Entity_lt);
      Register_Predefined_Entity
       (Self   => Self,
        Name   => League.Strings.To_Universal_String ("gt"),
        Entity => Entity_gt);
      Register_Predefined_Entity
       (Self   => Self,
        Name   => League.Strings.To_Universal_String ("amp"),
        Entity => Entity_amp);
      Register_Predefined_Entity
       (Self   => Self,
        Name   => League.Strings.To_Universal_String ("apos"),
        Entity => Entity_apos);
      Register_Predefined_Entity
       (Self   => Self,
        Name   => League.Strings.To_Universal_String ("quot"),
        Entity => Entity_quot);
   end Initialize;

   ------------
   -- Insert --
   ------------

   procedure Insert
    (Self       : in out Symbol_Table;
     String     : not null Matreshka.Internals.Strings.Shared_String_Access;
     First      : Matreshka.Internals.Utf16.Utf16_String_Index;
     Size       : Matreshka.Internals.Utf16.Utf16_String_Index;
     Length     : Positive;
     Identifier : out Symbol_Identifier)
   is
      use Matreshka.Internals.Unicode;
      use Matreshka.Internals.Utf16;

      N_Position : Utf16_String_Index;
      T_Position : Utf16_String_Index;

   begin
      for J in First_Symbol .. Self.Last loop
         if Self.Table (J).String.Unused = Size then
            N_Position := First;
            T_Position := 0;

            while N_Position < First + Size loop
               exit when
                 String.Value (N_Position)
                   /= Self.Table (J).String.Value (T_Position);

               N_Position := N_Position + 1;
               T_Position := T_Position + 1;
            end loop;

            if N_Position = First + Size then
               Identifier := J;

               return;
            end if;
         end if;
      end loop;

      Self.Last := Self.Last + 1;
      Self.Table (Self.Last) :=
       (String           =>
          Matreshka.Internals.Strings.Operations.Slice
           (String, First, Size, Length),
        Parameter_Entity => No_Entity,
        General_Entity   => No_Entity);
      Identifier := Self.Last;
   end Insert;

   ------------
   -- Lookup --
   ------------

   function Lookup
    (Self   : Symbol_Table;
     String : not null Matreshka.Internals.Strings.Shared_String_Access;
     First  : Matreshka.Internals.Utf16.Utf16_String_Index;
     Size   : Matreshka.Internals.Utf16.Utf16_String_Index;
     Length : Positive) return Symbol_Identifier is
   begin
      return No_Symbol;
   end Lookup;

   ----------
   -- Name --
   ----------

   function Name
    (Self       : Symbol_Table;
     Identifier : Symbol_Identifier)
       return not null Matreshka.Internals.Strings.Shared_String_Access is
   begin
      return Self.Table (Identifier).String;
   end Name;

   ----------
   -- Name --
   ----------

   function Name
    (Self       : Symbol_Table;
     Identifier : Symbol_Identifier) return League.Strings.Universal_String is
   begin
      return League.Strings.Internals.Create (Self.Table (Identifier).String);
   end Name;

   ----------------------
   -- Parameter_Entity --
   ----------------------

   function Parameter_Entity
    (Self       : Symbol_Table;
     Identifier : Symbol_Identifier) return Entity_Identifier is
   begin
      return Self.Table (Identifier).Parameter_Entity;
   end Parameter_Entity;

   --------------------------------
   -- Register_Predefined_Entity --
   --------------------------------

   procedure Register_Predefined_Entity
    (Self   : in out Symbol_Table;
     Name   : League.Strings.Universal_String;
     Entity : Entity_Identifier)
   is
      N : constant Matreshka.Internals.Strings.Shared_String_Access
        := League.Strings.Internals.Get_Shared (Name);

   begin
      Matreshka.Internals.Strings.Reference (N);

      Self.Last := Self.Last + 1;
      Self.Table (Self.Last) :=
       (String              => N,
        Parameter_Entity    => No_Entity,
        General_Entity      => Entity);
   end Register_Predefined_Entity;

   ------------------------
   -- Set_General_Entity --
   ------------------------

   procedure Set_General_Entity
    (Self       : in out Symbol_Table;
     Identifier : Symbol_Identifier;
     Entity     : Entity_Identifier) is
   begin
      Self.Table (Identifier).General_Entity := Entity;
   end Set_General_Entity;

   --------------------------
   -- Set_Parameter_Entity --
   --------------------------

   procedure Set_Parameter_Entity
    (Self       : in out Symbol_Table;
     Identifier : Symbol_Identifier;
     Entity     : Entity_Identifier) is
   begin
      Self.Table (Identifier).Parameter_Entity := Entity;
   end Set_Parameter_Entity;

end Matreshka.Internals.XML.Symbol_Tables;
