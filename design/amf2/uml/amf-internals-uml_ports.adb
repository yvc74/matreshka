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
with AMF.Elements;
with AMF.Internals.Element_Collections;
with AMF.Internals.Helpers;
with AMF.Internals.Tables.UML_Attributes;
with League.Strings.Internals;
with Matreshka.Internals.Strings;

package body AMF.Internals.UML_Ports is

   ---------------------
   -- Get_Is_Behavior --
   ---------------------

   overriding function Get_Is_Behavior
    (Self : not null access constant UML_Port_Proxy)
       return Boolean is
   begin
      return
        AMF.Internals.Tables.UML_Attributes.Internal_Get_Is_Behavior
         (Self.Id);
   end Get_Is_Behavior;

   ---------------------
   -- Set_Is_Behavior --
   ---------------------

   overriding procedure Set_Is_Behavior
    (Self : not null access UML_Port_Proxy;
     To   : Boolean) is
   begin
      AMF.Internals.Tables.UML_Attributes.Internal_Set_Is_Behavior
       (Self.Id, To);
   end Set_Is_Behavior;

   -----------------------
   -- Get_Is_Conjugated --
   -----------------------

   overriding function Get_Is_Conjugated
    (Self : not null access constant UML_Port_Proxy)
       return Boolean is
   begin
      return
        AMF.Internals.Tables.UML_Attributes.Internal_Get_Is_Conjugated
         (Self.Id);
   end Get_Is_Conjugated;

   -----------------------
   -- Set_Is_Conjugated --
   -----------------------

   overriding procedure Set_Is_Conjugated
    (Self : not null access UML_Port_Proxy;
     To   : Boolean) is
   begin
      AMF.Internals.Tables.UML_Attributes.Internal_Set_Is_Conjugated
       (Self.Id, To);
   end Set_Is_Conjugated;

   --------------------
   -- Get_Is_Service --
   --------------------

   overriding function Get_Is_Service
    (Self : not null access constant UML_Port_Proxy)
       return Boolean is
   begin
      return
        AMF.Internals.Tables.UML_Attributes.Internal_Get_Is_Service
         (Self.Id);
   end Get_Is_Service;

   --------------------
   -- Set_Is_Service --
   --------------------

   overriding procedure Set_Is_Service
    (Self : not null access UML_Port_Proxy;
     To   : Boolean) is
   begin
      AMF.Internals.Tables.UML_Attributes.Internal_Set_Is_Service
       (Self.Id, To);
   end Set_Is_Service;

   ------------------
   -- Get_Protocol --
   ------------------

   overriding function Get_Protocol
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Protocol_State_Machines.UML_Protocol_State_Machine_Access is
   begin
      return
        AMF.UML.Protocol_State_Machines.UML_Protocol_State_Machine_Access
         (AMF.Internals.Helpers.To_Element
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Protocol
             (Self.Id)));
   end Get_Protocol;

   ------------------
   -- Set_Protocol --
   ------------------

   overriding procedure Set_Protocol
    (Self : not null access UML_Port_Proxy;
     To   : AMF.UML.Protocol_State_Machines.UML_Protocol_State_Machine_Access) is
   begin
      raise Program_Error;
--        AMF.Internals.Tables.UML_Attributes.Internal_Set_Protocol
--         (Self.Id,
--          AMF.Internals.Helpers.To_Element
--           (AMF.Elements.Element_Access (To)));
   end Set_Protocol;

   ------------------
   -- Get_Provided --
   ------------------

   overriding function Get_Provided
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Interfaces.Collections.Set_Of_UML_Interface is
   begin
      return
        AMF.UML.Interfaces.Collections.Wrap
         (AMF.Internals.Element_Collections.Wrap
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Provided
             (Self.Id)));
   end Get_Provided;

   ------------------------
   -- Get_Redefined_Port --
   ------------------------

   overriding function Get_Redefined_Port
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Ports.Collections.Set_Of_UML_Port is
   begin
      return
        AMF.UML.Ports.Collections.Wrap
         (AMF.Internals.Element_Collections.Wrap
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Redefined_Port
             (Self.Id)));
   end Get_Redefined_Port;

   ------------------
   -- Get_Required --
   ------------------

   overriding function Get_Required
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Interfaces.Collections.Set_Of_UML_Interface is
   begin
      return
        AMF.UML.Interfaces.Collections.Wrap
         (AMF.Internals.Element_Collections.Wrap
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Required
             (Self.Id)));
   end Get_Required;

   ---------------------
   -- Get_Aggregation --
   ---------------------

   overriding function Get_Aggregation
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.UML_Aggregation_Kind is
   begin
      return
        AMF.Internals.Tables.UML_Attributes.Internal_Get_Aggregation
         (Self.Id);
   end Get_Aggregation;

   ---------------------
   -- Set_Aggregation --
   ---------------------

   overriding procedure Set_Aggregation
    (Self : not null access UML_Port_Proxy;
     To   : AMF.UML.UML_Aggregation_Kind) is
   begin
      AMF.Internals.Tables.UML_Attributes.Internal_Set_Aggregation
       (Self.Id, To);
   end Set_Aggregation;

   ---------------------
   -- Get_Association --
   ---------------------

   overriding function Get_Association
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Associations.UML_Association_Access is
   begin
      return
        AMF.UML.Associations.UML_Association_Access
         (AMF.Internals.Helpers.To_Element
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Association
             (Self.Id)));
   end Get_Association;

   ---------------------
   -- Set_Association --
   ---------------------

   overriding procedure Set_Association
    (Self : not null access UML_Port_Proxy;
     To   : AMF.UML.Associations.UML_Association_Access) is
   begin
      raise Program_Error;
--        AMF.Internals.Tables.UML_Attributes.Internal_Set_Association
--         (Self.Id,
--          AMF.Internals.Helpers.To_Element
--           (AMF.Elements.Element_Access (To)));
   end Set_Association;

   -------------------------
   -- Get_Association_End --
   -------------------------

   overriding function Get_Association_End
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Properties.UML_Property_Access is
   begin
      return
        AMF.UML.Properties.UML_Property_Access
         (AMF.Internals.Helpers.To_Element
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Association_End
             (Self.Id)));
   end Get_Association_End;

   -------------------------
   -- Set_Association_End --
   -------------------------

   overriding procedure Set_Association_End
    (Self : not null access UML_Port_Proxy;
     To   : AMF.UML.Properties.UML_Property_Access) is
   begin
      raise Program_Error;
--        AMF.Internals.Tables.UML_Attributes.Internal_Set_Association_End
--         (Self.Id,
--          AMF.Internals.Helpers.To_Element
--           (AMF.Elements.Element_Access (To)));
   end Set_Association_End;

   ---------------
   -- Get_Class --
   ---------------

   overriding function Get_Class
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Classes.UML_Class_Access is
   begin
      return
        AMF.UML.Classes.UML_Class_Access
         (AMF.Internals.Helpers.To_Element
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Class
             (Self.Id)));
   end Get_Class;

   ---------------
   -- Set_Class --
   ---------------

   overriding procedure Set_Class
    (Self : not null access UML_Port_Proxy;
     To   : AMF.UML.Classes.UML_Class_Access) is
   begin
      raise Program_Error;
--        AMF.Internals.Tables.UML_Attributes.Internal_Set_Class
--         (Self.Id,
--          AMF.Internals.Helpers.To_Element
--           (AMF.Elements.Element_Access (To)));
   end Set_Class;

   ------------------
   -- Get_Datatype --
   ------------------

   overriding function Get_Datatype
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Data_Types.UML_Data_Type_Access is
   begin
      return
        AMF.UML.Data_Types.UML_Data_Type_Access
         (AMF.Internals.Helpers.To_Element
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Datatype
             (Self.Id)));
   end Get_Datatype;

   ------------------
   -- Set_Datatype --
   ------------------

   overriding procedure Set_Datatype
    (Self : not null access UML_Port_Proxy;
     To   : AMF.UML.Data_Types.UML_Data_Type_Access) is
   begin
      raise Program_Error;
--        AMF.Internals.Tables.UML_Attributes.Internal_Set_Datatype
--         (Self.Id,
--          AMF.Internals.Helpers.To_Element
--           (AMF.Elements.Element_Access (To)));
   end Set_Datatype;

   -----------------
   -- Get_Default --
   -----------------

   overriding function Get_Default
    (Self : not null access constant UML_Port_Proxy)
       return AMF.Optional_String is
   begin
      declare
         use type Matreshka.Internals.Strings.Shared_String_Access;

         Aux : constant Matreshka.Internals.Strings.Shared_String_Access
           := AMF.Internals.Tables.UML_Attributes.Internal_Get_Default (Self.Id);

      begin
         if Aux = null then
            return (Is_Empty => True);

         else
            return (False, League.Strings.Internals.Create (Aux));
         end if;
      end;
   end Get_Default;

   -----------------
   -- Set_Default --
   -----------------

   overriding procedure Set_Default
    (Self : not null access UML_Port_Proxy;
     To   : AMF.Optional_String) is
   begin
      if To.Is_Empty then
         AMF.Internals.Tables.UML_Attributes.Internal_Set_Default
          (Self.Id, null);

      else
         AMF.Internals.Tables.UML_Attributes.Internal_Set_Default
          (Self.Id,
           League.Strings.Internals.Internal (To.Value));
      end if;
   end Set_Default;

   -----------------------
   -- Get_Default_Value --
   -----------------------

   overriding function Get_Default_Value
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Value_Specifications.UML_Value_Specification_Access is
   begin
      return
        AMF.UML.Value_Specifications.UML_Value_Specification_Access
         (AMF.Internals.Helpers.To_Element
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Default_Value
             (Self.Id)));
   end Get_Default_Value;

   -----------------------
   -- Set_Default_Value --
   -----------------------

   overriding procedure Set_Default_Value
    (Self : not null access UML_Port_Proxy;
     To   : AMF.UML.Value_Specifications.UML_Value_Specification_Access) is
   begin
      raise Program_Error;
--        AMF.Internals.Tables.UML_Attributes.Internal_Set_Default_Value
--         (Self.Id,
--          AMF.Internals.Helpers.To_Element
--           (AMF.Elements.Element_Access (To)));
   end Set_Default_Value;

   -------------------
   -- Get_Interface --
   -------------------

   overriding function Get_Interface
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Interfaces.UML_Interface_Access is
   begin
      return
        AMF.UML.Interfaces.UML_Interface_Access
         (AMF.Internals.Helpers.To_Element
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Interface
             (Self.Id)));
   end Get_Interface;

   -------------------
   -- Set_Interface --
   -------------------

   overriding procedure Set_Interface
    (Self : not null access UML_Port_Proxy;
     To   : AMF.UML.Interfaces.UML_Interface_Access) is
   begin
      raise Program_Error;
--        AMF.Internals.Tables.UML_Attributes.Internal_Set_Interface
--         (Self.Id,
--          AMF.Internals.Helpers.To_Element
--           (AMF.Elements.Element_Access (To)));
   end Set_Interface;

   ----------------------
   -- Get_Is_Composite --
   ----------------------

   overriding function Get_Is_Composite
    (Self : not null access constant UML_Port_Proxy)
       return Boolean is
   begin
      return
        AMF.Internals.Tables.UML_Attributes.Internal_Get_Is_Composite
         (Self.Id);
   end Get_Is_Composite;

   ----------------------
   -- Set_Is_Composite --
   ----------------------

   overriding procedure Set_Is_Composite
    (Self : not null access UML_Port_Proxy;
     To   : Boolean) is
   begin
      AMF.Internals.Tables.UML_Attributes.Internal_Set_Is_Composite
       (Self.Id, To);
   end Set_Is_Composite;

   --------------------
   -- Get_Is_Derived --
   --------------------

   overriding function Get_Is_Derived
    (Self : not null access constant UML_Port_Proxy)
       return Boolean is
   begin
      return
        AMF.Internals.Tables.UML_Attributes.Internal_Get_Is_Derived
         (Self.Id);
   end Get_Is_Derived;

   --------------------
   -- Set_Is_Derived --
   --------------------

   overriding procedure Set_Is_Derived
    (Self : not null access UML_Port_Proxy;
     To   : Boolean) is
   begin
      AMF.Internals.Tables.UML_Attributes.Internal_Set_Is_Derived
       (Self.Id, To);
   end Set_Is_Derived;

   --------------------------
   -- Get_Is_Derived_Union --
   --------------------------

   overriding function Get_Is_Derived_Union
    (Self : not null access constant UML_Port_Proxy)
       return Boolean is
   begin
      return
        AMF.Internals.Tables.UML_Attributes.Internal_Get_Is_Derived_Union
         (Self.Id);
   end Get_Is_Derived_Union;

   --------------------------
   -- Set_Is_Derived_Union --
   --------------------------

   overriding procedure Set_Is_Derived_Union
    (Self : not null access UML_Port_Proxy;
     To   : Boolean) is
   begin
      AMF.Internals.Tables.UML_Attributes.Internal_Set_Is_Derived_Union
       (Self.Id, To);
   end Set_Is_Derived_Union;

   ---------------
   -- Get_Is_ID --
   ---------------

   overriding function Get_Is_ID
    (Self : not null access constant UML_Port_Proxy)
       return Boolean is
   begin
      return
        AMF.Internals.Tables.UML_Attributes.Internal_Get_Is_ID
         (Self.Id);
   end Get_Is_ID;

   ---------------
   -- Set_Is_ID --
   ---------------

   overriding procedure Set_Is_ID
    (Self : not null access UML_Port_Proxy;
     To   : Boolean) is
   begin
      AMF.Internals.Tables.UML_Attributes.Internal_Set_Is_ID
       (Self.Id, To);
   end Set_Is_ID;

   ----------------------
   -- Get_Is_Read_Only --
   ----------------------

   overriding function Get_Is_Read_Only
    (Self : not null access constant UML_Port_Proxy)
       return Boolean is
   begin
      return
        AMF.Internals.Tables.UML_Attributes.Internal_Get_Is_Read_Only
         (Self.Id);
   end Get_Is_Read_Only;

   ----------------------
   -- Set_Is_Read_Only --
   ----------------------

   overriding procedure Set_Is_Read_Only
    (Self : not null access UML_Port_Proxy;
     To   : Boolean) is
   begin
      AMF.Internals.Tables.UML_Attributes.Internal_Set_Is_Read_Only
       (Self.Id, To);
   end Set_Is_Read_Only;

   ------------------
   -- Get_Opposite --
   ------------------

   overriding function Get_Opposite
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Properties.UML_Property_Access is
   begin
      return
        AMF.UML.Properties.UML_Property_Access
         (AMF.Internals.Helpers.To_Element
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Opposite
             (Self.Id)));
   end Get_Opposite;

   ------------------
   -- Set_Opposite --
   ------------------

   overriding procedure Set_Opposite
    (Self : not null access UML_Port_Proxy;
     To   : AMF.UML.Properties.UML_Property_Access) is
   begin
      raise Program_Error;
--        AMF.Internals.Tables.UML_Attributes.Internal_Set_Opposite
--         (Self.Id,
--          AMF.Internals.Helpers.To_Element
--           (AMF.Elements.Element_Access (To)));
   end Set_Opposite;

   ----------------------------
   -- Get_Owning_Association --
   ----------------------------

   overriding function Get_Owning_Association
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Associations.UML_Association_Access is
   begin
      return
        AMF.UML.Associations.UML_Association_Access
         (AMF.Internals.Helpers.To_Element
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Owning_Association
             (Self.Id)));
   end Get_Owning_Association;

   ----------------------------
   -- Set_Owning_Association --
   ----------------------------

   overriding procedure Set_Owning_Association
    (Self : not null access UML_Port_Proxy;
     To   : AMF.UML.Associations.UML_Association_Access) is
   begin
      raise Program_Error;
--        AMF.Internals.Tables.UML_Attributes.Internal_Set_Owning_Association
--         (Self.Id,
--          AMF.Internals.Helpers.To_Element
--           (AMF.Elements.Element_Access (To)));
   end Set_Owning_Association;

   -------------------
   -- Get_Qualifier --
   -------------------

   overriding function Get_Qualifier
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Properties.Collections.Ordered_Set_Of_UML_Property is
   begin
      return
        AMF.UML.Properties.Collections.Wrap
         (AMF.Internals.Element_Collections.Wrap
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Qualifier
             (Self.Id)));
   end Get_Qualifier;

   ----------------------------
   -- Get_Redefined_Property --
   ----------------------------

   overriding function Get_Redefined_Property
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Properties.Collections.Set_Of_UML_Property is
   begin
      return
        AMF.UML.Properties.Collections.Wrap
         (AMF.Internals.Element_Collections.Wrap
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Redefined_Property
             (Self.Id)));
   end Get_Redefined_Property;

   ----------------------------
   -- Get_Subsetted_Property --
   ----------------------------

   overriding function Get_Subsetted_Property
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Properties.Collections.Set_Of_UML_Property is
   begin
      return
        AMF.UML.Properties.Collections.Wrap
         (AMF.Internals.Element_Collections.Wrap
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Subsetted_Property
             (Self.Id)));
   end Get_Subsetted_Property;

   -------------
   -- Get_End --
   -------------

   overriding function Get_End
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Connector_Ends.Collections.Ordered_Set_Of_UML_Connector_End is
   begin
      return
        AMF.UML.Connector_Ends.Collections.Wrap
         (AMF.Internals.Element_Collections.Wrap
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_End
             (Self.Id)));
   end Get_End;

   ----------------------------
   -- Get_Template_Parameter --
   ----------------------------

   overriding function Get_Template_Parameter
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Connectable_Element_Template_Parameters.UML_Connectable_Element_Template_Parameter_Access is
   begin
      return
        AMF.UML.Connectable_Element_Template_Parameters.UML_Connectable_Element_Template_Parameter_Access
         (AMF.Internals.Helpers.To_Element
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Template_Parameter
             (Self.Id)));
   end Get_Template_Parameter;

   ----------------------------
   -- Set_Template_Parameter --
   ----------------------------

   overriding procedure Set_Template_Parameter
    (Self : not null access UML_Port_Proxy;
     To   : AMF.UML.Connectable_Element_Template_Parameters.UML_Connectable_Element_Template_Parameter_Access) is
   begin
      raise Program_Error;
--        AMF.Internals.Tables.UML_Attributes.Internal_Set_Template_Parameter
--         (Self.Id,
--          AMF.Internals.Helpers.To_Element
--           (AMF.Elements.Element_Access (To)));
   end Set_Template_Parameter;

   --------------
   -- Get_Type --
   --------------

   overriding function Get_Type
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Types.UML_Type_Access is
   begin
      return
        AMF.UML.Types.UML_Type_Access
         (AMF.Internals.Helpers.To_Element
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Type
             (Self.Id)));
   end Get_Type;

   --------------
   -- Set_Type --
   --------------

   overriding procedure Set_Type
    (Self : not null access UML_Port_Proxy;
     To   : AMF.UML.Types.UML_Type_Access) is
   begin
      raise Program_Error;
--        AMF.Internals.Tables.UML_Attributes.Internal_Set_Type
--         (Self.Id,
--          AMF.Internals.Helpers.To_Element
--           (AMF.Elements.Element_Access (To)));
   end Set_Type;

   ---------------------------
   -- Get_Client_Dependency --
   ---------------------------

   overriding function Get_Client_Dependency
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Dependencies.Collections.Set_Of_UML_Dependency is
   begin
      return
        AMF.UML.Dependencies.Collections.Wrap
         (AMF.Internals.Element_Collections.Wrap
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Client_Dependency
             (Self.Id)));
   end Get_Client_Dependency;

   --------------
   -- Get_Name --
   --------------

   overriding function Get_Name
    (Self : not null access constant UML_Port_Proxy)
       return AMF.Optional_String is
   begin
      declare
         use type Matreshka.Internals.Strings.Shared_String_Access;

         Aux : constant Matreshka.Internals.Strings.Shared_String_Access
           := AMF.Internals.Tables.UML_Attributes.Internal_Get_Name (Self.Id);

      begin
         if Aux = null then
            return (Is_Empty => True);

         else
            return (False, League.Strings.Internals.Create (Aux));
         end if;
      end;
   end Get_Name;

   --------------
   -- Set_Name --
   --------------

   overriding procedure Set_Name
    (Self : not null access UML_Port_Proxy;
     To   : AMF.Optional_String) is
   begin
      if To.Is_Empty then
         AMF.Internals.Tables.UML_Attributes.Internal_Set_Name
          (Self.Id, null);

      else
         AMF.Internals.Tables.UML_Attributes.Internal_Set_Name
          (Self.Id,
           League.Strings.Internals.Internal (To.Value));
      end if;
   end Set_Name;

   -------------------------
   -- Get_Name_Expression --
   -------------------------

   overriding function Get_Name_Expression
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.String_Expressions.UML_String_Expression_Access is
   begin
      return
        AMF.UML.String_Expressions.UML_String_Expression_Access
         (AMF.Internals.Helpers.To_Element
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Name_Expression
             (Self.Id)));
   end Get_Name_Expression;

   -------------------------
   -- Set_Name_Expression --
   -------------------------

   overriding procedure Set_Name_Expression
    (Self : not null access UML_Port_Proxy;
     To   : AMF.UML.String_Expressions.UML_String_Expression_Access) is
   begin
      raise Program_Error;
--        AMF.Internals.Tables.UML_Attributes.Internal_Set_Name_Expression
--         (Self.Id,
--          AMF.Internals.Helpers.To_Element
--           (AMF.Elements.Element_Access (To)));
   end Set_Name_Expression;

   -------------------
   -- Get_Namespace --
   -------------------

   overriding function Get_Namespace
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Namespaces.UML_Namespace_Access is
   begin
      return
        AMF.UML.Namespaces.UML_Namespace_Access
         (AMF.Internals.Helpers.To_Element
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Namespace
             (Self.Id)));
   end Get_Namespace;

   ------------------------
   -- Get_Qualified_Name --
   ------------------------

   overriding function Get_Qualified_Name
    (Self : not null access constant UML_Port_Proxy)
       return AMF.Optional_String is
   begin
      declare
         use type Matreshka.Internals.Strings.Shared_String_Access;

         Aux : constant Matreshka.Internals.Strings.Shared_String_Access
           := AMF.Internals.Tables.UML_Attributes.Internal_Get_Qualified_Name (Self.Id);

      begin
         if Aux = null then
            return (Is_Empty => True);

         else
            return (False, League.Strings.Internals.Create (Aux));
         end if;
      end;
   end Get_Qualified_Name;

   --------------------
   -- Get_Visibility --
   --------------------

   overriding function Get_Visibility
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Optional_UML_Visibility_Kind is
   begin
      return
        AMF.Internals.Tables.UML_Attributes.Internal_Get_Visibility
         (Self.Id);
   end Get_Visibility;

   --------------------
   -- Set_Visibility --
   --------------------

   overriding procedure Set_Visibility
    (Self : not null access UML_Port_Proxy;
     To   : AMF.UML.Optional_UML_Visibility_Kind) is
   begin
      AMF.Internals.Tables.UML_Attributes.Internal_Set_Visibility
       (Self.Id, To);
   end Set_Visibility;

   -----------------------
   -- Get_Owned_Comment --
   -----------------------

   overriding function Get_Owned_Comment
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Comments.Collections.Set_Of_UML_Comment is
   begin
      return
        AMF.UML.Comments.Collections.Wrap
         (AMF.Internals.Element_Collections.Wrap
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Owned_Comment
             (Self.Id)));
   end Get_Owned_Comment;

   -----------------------
   -- Get_Owned_Element --
   -----------------------

   overriding function Get_Owned_Element
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Elements.Collections.Set_Of_UML_Element is
   begin
      return
        AMF.UML.Elements.Collections.Wrap
         (AMF.Internals.Element_Collections.Wrap
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Owned_Element
             (Self.Id)));
   end Get_Owned_Element;

   ---------------
   -- Get_Owner --
   ---------------

   overriding function Get_Owner
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Elements.UML_Element_Access is
   begin
      return
        AMF.UML.Elements.UML_Element_Access
         (AMF.Internals.Helpers.To_Element
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Owner
             (Self.Id)));
   end Get_Owner;

   -----------------------------------
   -- Get_Owning_Template_Parameter --
   -----------------------------------

   overriding function Get_Owning_Template_Parameter
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Template_Parameters.UML_Template_Parameter_Access is
   begin
      return
        AMF.UML.Template_Parameters.UML_Template_Parameter_Access
         (AMF.Internals.Helpers.To_Element
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Owning_Template_Parameter
             (Self.Id)));
   end Get_Owning_Template_Parameter;

   -----------------------------------
   -- Set_Owning_Template_Parameter --
   -----------------------------------

   overriding procedure Set_Owning_Template_Parameter
    (Self : not null access UML_Port_Proxy;
     To   : AMF.UML.Template_Parameters.UML_Template_Parameter_Access) is
   begin
      raise Program_Error;
--        AMF.Internals.Tables.UML_Attributes.Internal_Set_Owning_Template_Parameter
--         (Self.Id,
--          AMF.Internals.Helpers.To_Element
--           (AMF.Elements.Element_Access (To)));
   end Set_Owning_Template_Parameter;

   ----------------------------
   -- Get_Template_Parameter --
   ----------------------------

   overriding function Get_Template_Parameter
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Template_Parameters.UML_Template_Parameter_Access is
   begin
      return
        AMF.UML.Template_Parameters.UML_Template_Parameter_Access
         (AMF.Internals.Helpers.To_Element
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Template_Parameter
             (Self.Id)));
   end Get_Template_Parameter;

   ----------------------------
   -- Set_Template_Parameter --
   ----------------------------

   overriding procedure Set_Template_Parameter
    (Self : not null access UML_Port_Proxy;
     To   : AMF.UML.Template_Parameters.UML_Template_Parameter_Access) is
   begin
      raise Program_Error;
--        AMF.Internals.Tables.UML_Attributes.Internal_Set_Template_Parameter
--         (Self.Id,
--          AMF.Internals.Helpers.To_Element
--           (AMF.Elements.Element_Access (To)));
   end Set_Template_Parameter;

   --------------------------
   -- Get_Deployed_Element --
   --------------------------

   overriding function Get_Deployed_Element
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Packageable_Elements.Collections.Set_Of_UML_Packageable_Element is
   begin
      return
        AMF.UML.Packageable_Elements.Collections.Wrap
         (AMF.Internals.Element_Collections.Wrap
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Deployed_Element
             (Self.Id)));
   end Get_Deployed_Element;

   --------------------
   -- Get_Deployment --
   --------------------

   overriding function Get_Deployment
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Deployments.Collections.Set_Of_UML_Deployment is
   begin
      return
        AMF.UML.Deployments.Collections.Wrap
         (AMF.Internals.Element_Collections.Wrap
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Deployment
             (Self.Id)));
   end Get_Deployment;

   --------------------
   -- Get_Is_Ordered --
   --------------------

   overriding function Get_Is_Ordered
    (Self : not null access constant UML_Port_Proxy)
       return Boolean is
   begin
      return
        AMF.Internals.Tables.UML_Attributes.Internal_Get_Is_Ordered
         (Self.Id);
   end Get_Is_Ordered;

   --------------------
   -- Set_Is_Ordered --
   --------------------

   overriding procedure Set_Is_Ordered
    (Self : not null access UML_Port_Proxy;
     To   : Boolean) is
   begin
      AMF.Internals.Tables.UML_Attributes.Internal_Set_Is_Ordered
       (Self.Id, To);
   end Set_Is_Ordered;

   -------------------
   -- Get_Is_Unique --
   -------------------

   overriding function Get_Is_Unique
    (Self : not null access constant UML_Port_Proxy)
       return Boolean is
   begin
      return
        AMF.Internals.Tables.UML_Attributes.Internal_Get_Is_Unique
         (Self.Id);
   end Get_Is_Unique;

   -------------------
   -- Set_Is_Unique --
   -------------------

   overriding procedure Set_Is_Unique
    (Self : not null access UML_Port_Proxy;
     To   : Boolean) is
   begin
      AMF.Internals.Tables.UML_Attributes.Internal_Set_Is_Unique
       (Self.Id, To);
   end Set_Is_Unique;

   ---------------
   -- Get_Lower --
   ---------------

   overriding function Get_Lower
    (Self : not null access constant UML_Port_Proxy)
       return AMF.Optional_Integer is
   begin
      return
        AMF.Internals.Tables.UML_Attributes.Internal_Get_Lower
         (Self.Id);
   end Get_Lower;

   ---------------
   -- Set_Lower --
   ---------------

   overriding procedure Set_Lower
    (Self : not null access UML_Port_Proxy;
     To   : AMF.Optional_Integer) is
   begin
      AMF.Internals.Tables.UML_Attributes.Internal_Set_Lower
       (Self.Id, To);
   end Set_Lower;

   ---------------------
   -- Get_Lower_Value --
   ---------------------

   overriding function Get_Lower_Value
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Value_Specifications.UML_Value_Specification_Access is
   begin
      return
        AMF.UML.Value_Specifications.UML_Value_Specification_Access
         (AMF.Internals.Helpers.To_Element
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Lower_Value
             (Self.Id)));
   end Get_Lower_Value;

   ---------------------
   -- Set_Lower_Value --
   ---------------------

   overriding procedure Set_Lower_Value
    (Self : not null access UML_Port_Proxy;
     To   : AMF.UML.Value_Specifications.UML_Value_Specification_Access) is
   begin
      raise Program_Error;
--        AMF.Internals.Tables.UML_Attributes.Internal_Set_Lower_Value
--         (Self.Id,
--          AMF.Internals.Helpers.To_Element
--           (AMF.Elements.Element_Access (To)));
   end Set_Lower_Value;

   ---------------
   -- Get_Upper --
   ---------------

   overriding function Get_Upper
    (Self : not null access constant UML_Port_Proxy)
       return AMF.Optional_Unlimited_Natural is
   begin
      return
        AMF.Internals.Tables.UML_Attributes.Internal_Get_Upper
         (Self.Id);
   end Get_Upper;

   ---------------
   -- Set_Upper --
   ---------------

   overriding procedure Set_Upper
    (Self : not null access UML_Port_Proxy;
     To   : AMF.Optional_Unlimited_Natural) is
   begin
      AMF.Internals.Tables.UML_Attributes.Internal_Set_Upper
       (Self.Id, To);
   end Set_Upper;

   ---------------------
   -- Get_Upper_Value --
   ---------------------

   overriding function Get_Upper_Value
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Value_Specifications.UML_Value_Specification_Access is
   begin
      return
        AMF.UML.Value_Specifications.UML_Value_Specification_Access
         (AMF.Internals.Helpers.To_Element
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Upper_Value
             (Self.Id)));
   end Get_Upper_Value;

   ---------------------
   -- Set_Upper_Value --
   ---------------------

   overriding procedure Set_Upper_Value
    (Self : not null access UML_Port_Proxy;
     To   : AMF.UML.Value_Specifications.UML_Value_Specification_Access) is
   begin
      raise Program_Error;
--        AMF.Internals.Tables.UML_Attributes.Internal_Set_Upper_Value
--         (Self.Id,
--          AMF.Internals.Helpers.To_Element
--           (AMF.Elements.Element_Access (To)));
   end Set_Upper_Value;

   ------------------------------
   -- Get_Featuring_Classifier --
   ------------------------------

   overriding function Get_Featuring_Classifier
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Classifiers.Collections.Set_Of_UML_Classifier is
   begin
      return
        AMF.UML.Classifiers.Collections.Wrap
         (AMF.Internals.Element_Collections.Wrap
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Featuring_Classifier
             (Self.Id)));
   end Get_Featuring_Classifier;

   -------------------
   -- Get_Is_Static --
   -------------------

   overriding function Get_Is_Static
    (Self : not null access constant UML_Port_Proxy)
       return Boolean is
   begin
      return
        AMF.Internals.Tables.UML_Attributes.Internal_Get_Is_Static
         (Self.Id);
   end Get_Is_Static;

   -------------------
   -- Set_Is_Static --
   -------------------

   overriding procedure Set_Is_Static
    (Self : not null access UML_Port_Proxy;
     To   : Boolean) is
   begin
      AMF.Internals.Tables.UML_Attributes.Internal_Set_Is_Static
       (Self.Id, To);
   end Set_Is_Static;

   -----------------
   -- Get_Is_Leaf --
   -----------------

   overriding function Get_Is_Leaf
    (Self : not null access constant UML_Port_Proxy)
       return Boolean is
   begin
      return
        AMF.Internals.Tables.UML_Attributes.Internal_Get_Is_Leaf
         (Self.Id);
   end Get_Is_Leaf;

   -----------------
   -- Set_Is_Leaf --
   -----------------

   overriding procedure Set_Is_Leaf
    (Self : not null access UML_Port_Proxy;
     To   : Boolean) is
   begin
      AMF.Internals.Tables.UML_Attributes.Internal_Set_Is_Leaf
       (Self.Id, To);
   end Set_Is_Leaf;

   ---------------------------
   -- Get_Redefined_Element --
   ---------------------------

   overriding function Get_Redefined_Element
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Redefinable_Elements.Collections.Set_Of_UML_Redefinable_Element is
   begin
      return
        AMF.UML.Redefinable_Elements.Collections.Wrap
         (AMF.Internals.Element_Collections.Wrap
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Redefined_Element
             (Self.Id)));
   end Get_Redefined_Element;

   ------------------------------
   -- Get_Redefinition_Context --
   ------------------------------

   overriding function Get_Redefinition_Context
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Classifiers.Collections.Set_Of_UML_Classifier is
   begin
      return
        AMF.UML.Classifiers.Collections.Wrap
         (AMF.Internals.Element_Collections.Wrap
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Redefinition_Context
             (Self.Id)));
   end Get_Redefinition_Context;

   --------------
   -- Provided --
   --------------

   overriding function Provided
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Interfaces.Collections.Set_Of_UML_Interface is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Provided unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Port_Proxy.Provided";
      return Provided (Self);
   end Provided;

   --------------
   -- Required --
   --------------

   overriding function Required
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Interfaces.Collections.Set_Of_UML_Interface is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Required unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Port_Proxy.Required";
      return Required (Self);
   end Required;

   -------------
   -- Default --
   -------------

   overriding function Default
    (Self : not null access constant UML_Port_Proxy)
       return AMF.Optional_String is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Default unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Port_Proxy.Default";
      return Default (Self);
   end Default;

   ------------------
   -- Is_Attribute --
   ------------------

   overriding function Is_Attribute
    (Self : not null access constant UML_Port_Proxy;
     P : AMF.UML.Properties.UML_Property_Access)
       return Boolean is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Is_Attribute unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Port_Proxy.Is_Attribute";
      return Is_Attribute (Self, P);
   end Is_Attribute;

   ------------------------
   -- Is_Compatible_With --
   ------------------------

   overriding function Is_Compatible_With
    (Self : not null access constant UML_Port_Proxy;
     P : AMF.UML.Parameterable_Elements.UML_Parameterable_Element_Access)
       return Boolean is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Is_Compatible_With unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Port_Proxy.Is_Compatible_With";
      return Is_Compatible_With (Self, P);
   end Is_Compatible_With;

   ------------------
   -- Is_Composite --
   ------------------

   overriding function Is_Composite
    (Self : not null access constant UML_Port_Proxy)
       return Boolean is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Is_Composite unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Port_Proxy.Is_Composite";
      return Is_Composite (Self);
   end Is_Composite;

   ------------------------
   -- Is_Consistent_With --
   ------------------------

   overriding function Is_Consistent_With
    (Self : not null access constant UML_Port_Proxy;
     Redefinee : AMF.UML.Redefinable_Elements.UML_Redefinable_Element_Access)
       return Boolean is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Is_Consistent_With unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Port_Proxy.Is_Consistent_With";
      return Is_Consistent_With (Self, Redefinee);
   end Is_Consistent_With;

   ------------------
   -- Is_Navigable --
   ------------------

   overriding function Is_Navigable
    (Self : not null access constant UML_Port_Proxy)
       return Boolean is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Is_Navigable unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Port_Proxy.Is_Navigable";
      return Is_Navigable (Self);
   end Is_Navigable;

   --------------
   -- Opposite --
   --------------

   overriding function Opposite
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Properties.UML_Property_Access is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Opposite unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Port_Proxy.Opposite";
      return Opposite (Self);
   end Opposite;

   ------------------------
   -- Subsetting_Context --
   ------------------------

   overriding function Subsetting_Context
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Types.Collections.Set_Of_UML_Type is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Subsetting_Context unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Port_Proxy.Subsetting_Context";
      return Subsetting_Context (Self);
   end Subsetting_Context;

   ----------
   -- Ends --
   ----------

   overriding function Ends
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Connector_Ends.Collections.Set_Of_UML_Connector_End is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Ends unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Port_Proxy.Ends";
      return Ends (Self);
   end Ends;

   --------------------
   -- All_Namespaces --
   --------------------

   overriding function All_Namespaces
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Namespaces.Collections.Ordered_Set_Of_UML_Namespace is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "All_Namespaces unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Port_Proxy.All_Namespaces";
      return All_Namespaces (Self);
   end All_Namespaces;

   -------------------------
   -- All_Owning_Packages --
   -------------------------

   overriding function All_Owning_Packages
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Packages.Collections.Set_Of_UML_Package is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "All_Owning_Packages unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Port_Proxy.All_Owning_Packages";
      return All_Owning_Packages (Self);
   end All_Owning_Packages;

   -----------------------------
   -- Is_Distinguishable_From --
   -----------------------------

   overriding function Is_Distinguishable_From
    (Self : not null access constant UML_Port_Proxy;
     N : AMF.UML.Named_Elements.UML_Named_Element_Access;
     Ns : AMF.UML.Namespaces.UML_Namespace_Access)
       return Boolean is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Is_Distinguishable_From unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Port_Proxy.Is_Distinguishable_From";
      return Is_Distinguishable_From (Self, N, Ns);
   end Is_Distinguishable_From;

   ---------------
   -- Namespace --
   ---------------

   overriding function Namespace
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Namespaces.UML_Namespace_Access is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Namespace unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Port_Proxy.Namespace";
      return Namespace (Self);
   end Namespace;

   --------------------
   -- Qualified_Name --
   --------------------

   overriding function Qualified_Name
    (Self : not null access constant UML_Port_Proxy)
       return League.Strings.Universal_String is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Qualified_Name unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Port_Proxy.Qualified_Name";
      return Qualified_Name (Self);
   end Qualified_Name;

   ---------------
   -- Separator --
   ---------------

   overriding function Separator
    (Self : not null access constant UML_Port_Proxy)
       return League.Strings.Universal_String is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Separator unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Port_Proxy.Separator";
      return Separator (Self);
   end Separator;

   ------------------------
   -- All_Owned_Elements --
   ------------------------

   overriding function All_Owned_Elements
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Elements.Collections.Set_Of_UML_Element is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "All_Owned_Elements unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Port_Proxy.All_Owned_Elements";
      return All_Owned_Elements (Self);
   end All_Owned_Elements;

   -------------------
   -- Must_Be_Owned --
   -------------------

   overriding function Must_Be_Owned
    (Self : not null access constant UML_Port_Proxy)
       return Boolean is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Must_Be_Owned unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Port_Proxy.Must_Be_Owned";
      return Must_Be_Owned (Self);
   end Must_Be_Owned;

   ---------------------------
   -- Is_Template_Parameter --
   ---------------------------

   overriding function Is_Template_Parameter
    (Self : not null access constant UML_Port_Proxy)
       return Boolean is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Is_Template_Parameter unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Port_Proxy.Is_Template_Parameter";
      return Is_Template_Parameter (Self);
   end Is_Template_Parameter;

   ----------------------
   -- Deployed_Element --
   ----------------------

   overriding function Deployed_Element
    (Self : not null access constant UML_Port_Proxy)
       return AMF.UML.Packageable_Elements.Collections.Set_Of_UML_Packageable_Element is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Deployed_Element unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Port_Proxy.Deployed_Element";
      return Deployed_Element (Self);
   end Deployed_Element;

   ---------------------
   -- Compatible_With --
   ---------------------

   overriding function Compatible_With
    (Self : not null access constant UML_Port_Proxy;
     Other : AMF.UML.Multiplicity_Elements.UML_Multiplicity_Element_Access)
       return Boolean is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Compatible_With unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Port_Proxy.Compatible_With";
      return Compatible_With (Self, Other);
   end Compatible_With;

   --------------------------
   -- Includes_Cardinality --
   --------------------------

   overriding function Includes_Cardinality
    (Self : not null access constant UML_Port_Proxy;
     C : Integer)
       return Boolean is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Includes_Cardinality unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Port_Proxy.Includes_Cardinality";
      return Includes_Cardinality (Self, C);
   end Includes_Cardinality;

   ---------------------------
   -- Includes_Multiplicity --
   ---------------------------

   overriding function Includes_Multiplicity
    (Self : not null access constant UML_Port_Proxy;
     M : AMF.UML.Multiplicity_Elements.UML_Multiplicity_Element_Access)
       return Boolean is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Includes_Multiplicity unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Port_Proxy.Includes_Multiplicity";
      return Includes_Multiplicity (Self, M);
   end Includes_Multiplicity;

   ---------
   -- Iss --
   ---------

   overriding function Iss
    (Self : not null access constant UML_Port_Proxy;
     Lowerbound : Integer;
     Upperbound : Integer)
       return Boolean is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Iss unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Port_Proxy.Iss";
      return Iss (Self, Lowerbound, Upperbound);
   end Iss;

   --------------------
   -- Is_Multivalued --
   --------------------

   overriding function Is_Multivalued
    (Self : not null access constant UML_Port_Proxy)
       return Boolean is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Is_Multivalued unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Port_Proxy.Is_Multivalued";
      return Is_Multivalued (Self);
   end Is_Multivalued;

   -----------
   -- Lower --
   -----------

   overriding function Lower
    (Self : not null access constant UML_Port_Proxy)
       return AMF.Optional_Integer is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Lower unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Port_Proxy.Lower";
      return Lower (Self);
   end Lower;

   -----------------
   -- Lower_Bound --
   -----------------

   overriding function Lower_Bound
    (Self : not null access constant UML_Port_Proxy)
       return AMF.Optional_Integer is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Lower_Bound unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Port_Proxy.Lower_Bound";
      return Lower_Bound (Self);
   end Lower_Bound;

   -----------
   -- Upper --
   -----------

   overriding function Upper
    (Self : not null access constant UML_Port_Proxy)
       return AMF.Optional_Unlimited_Natural is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Upper unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Port_Proxy.Upper";
      return Upper (Self);
   end Upper;

   -----------------
   -- Upper_Bound --
   -----------------

   overriding function Upper_Bound
    (Self : not null access constant UML_Port_Proxy)
       return AMF.Optional_Unlimited_Natural is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Upper_Bound unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Port_Proxy.Upper_Bound";
      return Upper_Bound (Self);
   end Upper_Bound;

   -----------------------------------
   -- Is_Redefinition_Context_Valid --
   -----------------------------------

   overriding function Is_Redefinition_Context_Valid
    (Self : not null access constant UML_Port_Proxy;
     Redefined : AMF.UML.Redefinable_Elements.UML_Redefinable_Element_Access)
       return Boolean is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Is_Redefinition_Context_Valid unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Port_Proxy.Is_Redefinition_Context_Valid";
      return Is_Redefinition_Context_Valid (Self, Redefined);
   end Is_Redefinition_Context_Valid;

end AMF.Internals.UML_Ports;
