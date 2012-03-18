------------------------------------------------------------------------------
--                                                                          --
--                            Matreshka Project                             --
--                                                                          --
--                          Ada Modeling Framework                          --
--                                                                          --
--                        Runtime Library Component                         --
--                                                                          --
------------------------------------------------------------------------------
--                                                                          --
-- Copyright © 2012, Vadim Godunko <vgodunko@gmail.com>                     --
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
--  This file is generated, don't edit it.
------------------------------------------------------------------------------
with AMF.Internals.Element_Collections;
with AMF.Internals.MOF_Tags;
with AMF.Internals.Tables.MOF_Element_Table;
with AMF.Internals.Tables.MOF_Metamodel;
with AMF.Internals.Tables.MOF_Types;
with AMF.Internals.Tables.UML_Metamodel;
with Matreshka.Internals.Strings;

package body AMF.Internals.Tables.MOF_Constructors is

   use AMF.Internals.Tables;
   use type AMF.Internals.AMF_Collection_Of_Element;

   ----------------
   -- Create_Tag --
   ----------------

   function Create_Tag return AMF.Internals.MOF_Element is
      Self : AMF.Internals.MOF_Element;

   begin
      MOF_Element_Table.Increment_Last;
      Self := MOF_Element_Table.Last;

      MOF_Element_Table.Table (Self) :=
       (Kind     => AMF.Internals.Tables.MOF_Types.E_Tag,
        Extent   => 0,
        Proxy    =>
          new AMF.Internals.MOF_Tags.MOF_Tag_Proxy'(Id => Self),
        Member   =>
         (0      => (Kind => AMF.Internals.Tables.MOF_Types.M_None),
          1      => (AMF.Internals.Tables.MOF_Types.M_Element, No_AMF_Link),
                       --  owner
          2      => (AMF.Internals.Tables.MOF_Types.M_String, Matreshka.Internals.Strings.Shared_Empty'Access),
                       --  name
          3      => (AMF.Internals.Tables.MOF_Types.M_String, Matreshka.Internals.Strings.Shared_Empty'Access),
                       --  value
          4      => (AMF.Internals.Tables.MOF_Types.M_Element, No_AMF_Link),
                       --  tagOwner
          others => (Kind => AMF.Internals.Tables.MOF_Types.M_None)));
      MOF_Element_Table.Table (Self).Member (0) :=
       (AMF.Internals.Tables.MOF_Types.M_Collection_Of_Element,
        AMF.Internals.Element_Collections.Allocate_Collections (3));

      --  ownedComment

      AMF.Internals.Element_Collections.Initialize_Set_Collection
       (Self,
        AMF.Internals.Tables.UML_Metamodel.MP_UML_Element_Owned_Comment,
        MOF_Element_Table.Table (Self).Member (0).Collection + 1);

      --  ownedElement

      AMF.Internals.Element_Collections.Initialize_Set_Collection
       (Self,
        AMF.Internals.Tables.UML_Metamodel.MP_UML_Element_Owned_Element,
        MOF_Element_Table.Table (Self).Member (0).Collection + 2);

      --  element

      AMF.Internals.Element_Collections.Initialize_Set_Collection
       (Self,
        AMF.Internals.Tables.MOF_Metamodel.MP_MOF_Tag_Element,
        MOF_Element_Table.Table (Self).Member (0).Collection + 3);

      return Self;
   end Create_Tag;

end AMF.Internals.Tables.MOF_Constructors;