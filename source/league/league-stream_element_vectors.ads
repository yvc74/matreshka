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
-- Copyright © 2010-2013, Vadim Godunko <vgodunko@gmail.com>                --
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
private with Ada.Finalization;
with Ada.Streams;

private with Matreshka.Internals.Stream_Element_Vectors;

package League.Stream_Element_Vectors is

   pragma Preelaborate;
   pragma Remote_Types;

   type Stream_Element_Vector is tagged private;
   pragma Preelaborable_Initialization (Stream_Element_Vector);

   Empty_Stream_Element_Vector : constant Stream_Element_Vector;

   function To_Stream_Element_Vector
    (Item : Ada.Streams.Stream_Element_Array) return Stream_Element_Vector;

   function To_Stream_Element_Array
    (Item : Stream_Element_Vector) return Ada.Streams.Stream_Element_Array;

   function Is_Empty (Self : Stream_Element_Vector) return Boolean;

   function Length
    (Self : Stream_Element_Vector) return Ada.Streams.Stream_Element_Offset;

   procedure Clear (Self : in out Stream_Element_Vector);

   function Hash (Self : Stream_Element_Vector) return League.Hash_Type;
   --  Returns hash for the data.

   function Element
    (Self  : Stream_Element_Vector'Class;
     Index : Ada.Streams.Stream_Element_Offset) return Ada.Streams.Stream_Element;
   --  Returns element at the specified position.

   procedure Append
    (Self : in out Stream_Element_Vector'Class;
     Item : Ada.Streams.Stream_Element);

   procedure Append
    (Self : in out Stream_Element_Vector'Class;
     Item : Ada.Streams.Stream_Element_Array);

   procedure Append
    (Self : in out Stream_Element_Vector'Class;
     Item : Stream_Element_Vector'Class);

   overriding function "="
    (Left  : Stream_Element_Vector;
     Right : Stream_Element_Vector) return Boolean;
   not overriding function "="
    (Left  : Stream_Element_Vector;
     Right : Ada.Streams.Stream_Element_Array) return Boolean;
   not overriding function "="
    (Left  : Ada.Streams.Stream_Element_Array;
     Right : Stream_Element_Vector) return Boolean;

private

   package MISEV renames Matreshka.Internals.Stream_Element_Vectors;

   procedure Read
    (Stream : not null access Ada.Streams.Root_Stream_Type'Class;
     Item   : out Stream_Element_Vector);

   procedure Write
    (Stream : not null access Ada.Streams.Root_Stream_Type'Class;
     Item   : Stream_Element_Vector);

   type Stream_Element_Vector is new Ada.Finalization.Controlled with record
      Data : MISEV.Shared_Stream_Element_Vector_Access
        := MISEV.Empty_Shared_Stream_Element_Vector'Access;
   end record;
   for Stream_Element_Vector'Read use Read;
   for Stream_Element_Vector'Write use Write;

   overriding procedure Adjust (Self : in out Stream_Element_Vector);

   overriding procedure Finalize (Self : in out Stream_Element_Vector);

   Empty_Stream_Element_Vector : constant Stream_Element_Vector
     := (Ada.Finalization.Controlled with Data => <>);

end League.Stream_Element_Vectors;
