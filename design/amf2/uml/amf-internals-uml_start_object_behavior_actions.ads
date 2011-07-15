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
with AMF.Internals.UML_Elements;
with AMF.UML.Activities;
with AMF.UML.Activity_Edges.Collections;
with AMF.UML.Activity_Groups.Collections;
with AMF.UML.Activity_Nodes.Collections;
with AMF.UML.Activity_Partitions.Collections;
with AMF.UML.Classifiers.Collections;
with AMF.UML.Comments.Collections;
with AMF.UML.Constraints.Collections;
with AMF.UML.Dependencies.Collections;
with AMF.UML.Elements.Collections;
with AMF.UML.Exception_Handlers.Collections;
with AMF.UML.Input_Pins.Collections;
with AMF.UML.Interruptible_Activity_Regions.Collections;
with AMF.UML.Named_Elements;
with AMF.UML.Namespaces.Collections;
with AMF.UML.Output_Pins.Collections;
with AMF.UML.Packages.Collections;
with AMF.UML.Ports;
with AMF.UML.Redefinable_Elements.Collections;
with AMF.UML.Start_Object_Behavior_Actions;
with AMF.UML.String_Expressions;
with AMF.UML.Structured_Activity_Nodes;

package AMF.Internals.UML_Start_Object_Behavior_Actions is

   type UML_Start_Object_Behavior_Action_Proxy is
     limited new AMF.Internals.UML_Elements.UML_Element_Proxy
       and AMF.UML.Start_Object_Behavior_Actions.UML_Start_Object_Behavior_Action with null record;

   overriding function Get_Object
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return AMF.UML.Input_Pins.UML_Input_Pin_Access;

   overriding procedure Set_Object
    (Self : not null access UML_Start_Object_Behavior_Action_Proxy;
     To   : AMF.UML.Input_Pins.UML_Input_Pin_Access);

   overriding function Get_Is_Synchronous
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return Boolean;

   overriding procedure Set_Is_Synchronous
    (Self : not null access UML_Start_Object_Behavior_Action_Proxy;
     To   : Boolean);

   overriding function Get_Result
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return AMF.UML.Output_Pins.Collections.Ordered_Set_Of_UML_Output_Pin;

   overriding function Get_Argument
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return AMF.UML.Input_Pins.Collections.Ordered_Set_Of_UML_Input_Pin;

   overriding function Get_On_Port
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return AMF.UML.Ports.UML_Port_Access;

   overriding procedure Set_On_Port
    (Self : not null access UML_Start_Object_Behavior_Action_Proxy;
     To   : AMF.UML.Ports.UML_Port_Access);

   overriding function Get_Context
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return AMF.UML.Classifiers.UML_Classifier_Access;

   overriding function Get_Input
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return AMF.UML.Input_Pins.Collections.Ordered_Set_Of_UML_Input_Pin;

   overriding function Get_Is_Locally_Reentrant
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return Boolean;

   overriding procedure Set_Is_Locally_Reentrant
    (Self : not null access UML_Start_Object_Behavior_Action_Proxy;
     To   : Boolean);

   overriding function Get_Local_Postcondition
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return AMF.UML.Constraints.Collections.Set_Of_UML_Constraint;

   overriding function Get_Local_Precondition
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return AMF.UML.Constraints.Collections.Set_Of_UML_Constraint;

   overriding function Get_Output
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return AMF.UML.Output_Pins.Collections.Ordered_Set_Of_UML_Output_Pin;

   overriding function Get_Handler
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return AMF.UML.Exception_Handlers.Collections.Set_Of_UML_Exception_Handler;

   overriding function Get_Activity
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return AMF.UML.Activities.UML_Activity_Access;

   overriding procedure Set_Activity
    (Self : not null access UML_Start_Object_Behavior_Action_Proxy;
     To   : AMF.UML.Activities.UML_Activity_Access);

   overriding function Get_In_Group
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return AMF.UML.Activity_Groups.Collections.Set_Of_UML_Activity_Group;

   overriding function Get_In_Interruptible_Region
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return AMF.UML.Interruptible_Activity_Regions.Collections.Set_Of_UML_Interruptible_Activity_Region;

   overriding function Get_In_Partition
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return AMF.UML.Activity_Partitions.Collections.Set_Of_UML_Activity_Partition;

   overriding function Get_In_Structured_Node
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return AMF.UML.Structured_Activity_Nodes.UML_Structured_Activity_Node_Access;

   overriding procedure Set_In_Structured_Node
    (Self : not null access UML_Start_Object_Behavior_Action_Proxy;
     To   : AMF.UML.Structured_Activity_Nodes.UML_Structured_Activity_Node_Access);

   overriding function Get_Incoming
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return AMF.UML.Activity_Edges.Collections.Set_Of_UML_Activity_Edge;

   overriding function Get_Outgoing
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return AMF.UML.Activity_Edges.Collections.Set_Of_UML_Activity_Edge;

   overriding function Get_Redefined_Node
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return AMF.UML.Activity_Nodes.Collections.Set_Of_UML_Activity_Node;

   overriding function Get_Is_Leaf
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return Boolean;

   overriding procedure Set_Is_Leaf
    (Self : not null access UML_Start_Object_Behavior_Action_Proxy;
     To   : Boolean);

   overriding function Get_Redefined_Element
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return AMF.UML.Redefinable_Elements.Collections.Set_Of_UML_Redefinable_Element;

   overriding function Get_Redefinition_Context
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return AMF.UML.Classifiers.Collections.Set_Of_UML_Classifier;

   overriding function Get_Client_Dependency
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return AMF.UML.Dependencies.Collections.Set_Of_UML_Dependency;

   overriding function Get_Name
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return AMF.Optional_String;

   overriding procedure Set_Name
    (Self : not null access UML_Start_Object_Behavior_Action_Proxy;
     To   : AMF.Optional_String);

   overriding function Get_Name_Expression
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return AMF.UML.String_Expressions.UML_String_Expression_Access;

   overriding procedure Set_Name_Expression
    (Self : not null access UML_Start_Object_Behavior_Action_Proxy;
     To   : AMF.UML.String_Expressions.UML_String_Expression_Access);

   overriding function Get_Namespace
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return AMF.UML.Namespaces.UML_Namespace_Access;

   overriding function Get_Qualified_Name
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return AMF.Optional_String;

   overriding function Get_Visibility
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return AMF.UML.Optional_UML_Visibility_Kind;

   overriding procedure Set_Visibility
    (Self : not null access UML_Start_Object_Behavior_Action_Proxy;
     To   : AMF.UML.Optional_UML_Visibility_Kind);

   overriding function Get_Owned_Comment
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return AMF.UML.Comments.Collections.Set_Of_UML_Comment;

   overriding function Get_Owned_Element
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return AMF.UML.Elements.Collections.Set_Of_UML_Element;

   overriding function Get_Owner
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return AMF.UML.Elements.UML_Element_Access;

   overriding function Context
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return AMF.UML.Classifiers.UML_Classifier_Access;

   overriding function Is_Consistent_With
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy;
     Redefinee : AMF.UML.Redefinable_Elements.UML_Redefinable_Element_Access)
       return Boolean;

   overriding function Is_Redefinition_Context_Valid
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy;
     Redefined : AMF.UML.Redefinable_Elements.UML_Redefinable_Element_Access)
       return Boolean;

   overriding function All_Namespaces
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return AMF.UML.Namespaces.Collections.Ordered_Set_Of_UML_Namespace;

   overriding function All_Owning_Packages
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return AMF.UML.Packages.Collections.Set_Of_UML_Package;

   overriding function Is_Distinguishable_From
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy;
     N : AMF.UML.Named_Elements.UML_Named_Element_Access;
     Ns : AMF.UML.Namespaces.UML_Namespace_Access)
       return Boolean;

   overriding function Namespace
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return AMF.UML.Namespaces.UML_Namespace_Access;

   overriding function Qualified_Name
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return League.Strings.Universal_String;

   overriding function Separator
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return League.Strings.Universal_String;

   overriding function All_Owned_Elements
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return AMF.UML.Elements.Collections.Set_Of_UML_Element;

   overriding function Must_Be_Owned
    (Self : not null access constant UML_Start_Object_Behavior_Action_Proxy)
       return Boolean;

end AMF.Internals.UML_Start_Object_Behavior_Actions;