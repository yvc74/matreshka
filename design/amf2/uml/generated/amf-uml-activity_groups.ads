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
--  ActivityGroup is an abstract class for defining sets of nodes and edges in 
--  an activity.
------------------------------------------------------------------------------
limited with AMF.UML.Activities;
limited with AMF.UML.Activity_Edges;
limited with AMF.UML.Activity_Nodes;
with AMF.UML.Named_Elements;

package AMF.UML.Activity_Groups is

   pragma Preelaborate;

   type UML_Activity_Group_Interface is limited interface
     and AMF.UML.Named_Elements.UML_Named_Element_Interface;

   type UML_Activity_Group is
     access all UML_Activity_Group_Interface'Class;

   type Set_Of_UML_Activity_Group is null record;
   type Ordered_Set_Of_UML_Activity_Group is null record;

   not overriding function Get_Contained_Edge
    (Self : not null access constant UML_Activity_Group_Interface)
       return AMF.UML.Activity_Edges.Set_Of_UML_Activity_Edge is abstract;
   --  Edges immediately contained in the group.

   not overriding function Get_Contained_Node
    (Self : not null access constant UML_Activity_Group_Interface)
       return AMF.UML.Activity_Nodes.Set_Of_UML_Activity_Node is abstract;
   --  Nodes immediately contained in the group.

   not overriding function Get_In_Activity
    (Self : not null access constant UML_Activity_Group_Interface)
       return AMF.UML.Activities.UML_Activity is abstract;
   --  Activity containing the group.

   not overriding procedure Set_In_Activity
    (Self : not null access UML_Activity_Group_Interface;
     To   : AMF.UML.Activities.UML_Activity) is abstract;

   not overriding function Get_Subgroup
    (Self : not null access constant UML_Activity_Group_Interface)
       return AMF.UML.Activity_Groups.Set_Of_UML_Activity_Group is abstract;
   --  Groups immediately contained in the group.

   not overriding function Get_Super_Group
    (Self : not null access constant UML_Activity_Group_Interface)
       return AMF.UML.Activity_Groups.UML_Activity_Group is abstract;
   --  Group immediately containing the group.

end AMF.UML.Activity_Groups;