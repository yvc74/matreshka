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
-- Copyright © 2011, Vadim Godunko <vgodunko@gmail.com>                     --
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
--  An association describes a set of tuples whose values refer to typed 
--  instances. An instance of an association is called a link.A link is a 
--  tuple with one value for each end of the association, where each value is 
--  an instance of the type of the end.
------------------------------------------------------------------------------
with AMF.CMOF.Classifiers;
limited with AMF.CMOF.Properties.Collections;
with AMF.CMOF.Relationships;
limited with AMF.CMOF.Types.Collections;

package AMF.CMOF.Associations is

   pragma Preelaborate;

   type CMOF_Association is limited interface
     and AMF.CMOF.Classifiers.CMOF_Classifier
     and AMF.CMOF.Relationships.CMOF_Relationship;

   type CMOF_Association_Access is
     access all CMOF_Association'Class;
   for CMOF_Association_Access'Storage_Size use 0;

   not overriding function Get_Is_Derived
    (Self : not null access constant CMOF_Association)
       return Boolean is abstract;
   --  Getter of Association::isDerived.
   --
   --  Specifies whether the association is derived from other model elements 
   --  such as other associations or constraints.

   not overriding procedure Set_Is_Derived
    (Self : not null access CMOF_Association;
     To   : Boolean) is abstract;
   --  Setter of Association::isDerived.
   --
   --  Specifies whether the association is derived from other model elements 
   --  such as other associations or constraints.

   not overriding function Get_Owned_End
    (Self : not null access constant CMOF_Association)
       return AMF.CMOF.Properties.Collections.Ordered_Set_Of_CMOF_Property is abstract;
   --  Getter of Association::ownedEnd.
   --
   --  The ends that are owned by the association itself.

   not overriding function Get_End_Type
    (Self : not null access constant CMOF_Association)
       return AMF.CMOF.Types.Collections.Set_Of_CMOF_Type is abstract;
   --  Getter of Association::endType.
   --
   --  References the classifiers that are used as types of the ends of the 
   --  association.

   not overriding function Get_Member_End
    (Self : not null access constant CMOF_Association)
       return AMF.CMOF.Properties.Collections.Ordered_Set_Of_CMOF_Property is abstract;
   --  Getter of Association::memberEnd.
   --
   --  Each end represents participation of instances of the classifier 
   --  connected to the end in links of the association.

   not overriding function Get_Navigable_Owned_End
    (Self : not null access constant CMOF_Association)
       return AMF.CMOF.Properties.Collections.Set_Of_CMOF_Property is abstract;
   --  Getter of Association::navigableOwnedEnd.
   --
   --  The navigable ends that are owned by the association itself.

   not overriding function End_Type
    (Self : not null access constant CMOF_Association)
       return AMF.CMOF.Types.Collections.Ordered_Set_Of_CMOF_Type is abstract;
   --  Operation Association::endType.
   --
   --  endType is derived from the types of the member ends.

end AMF.CMOF.Associations;
