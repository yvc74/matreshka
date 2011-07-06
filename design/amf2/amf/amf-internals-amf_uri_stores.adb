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
with Ada.Wide_Wide_Text_IO;

with AMF.Factories.Registry;
with AMF.Internals.Element_Collections;
with AMF.Internals.Extents;
with AMF.Internals.Helpers;
with AMF.Internals.Links;
with AMF.Internals.Listener_Registry;
with CMOF.Internals.Attributes;
with CMOF.Internals.Metamodel;

package body AMF.Internals.AMF_URI_Stores is

   ------------
   -- Create --
   ------------

   overriding function Create
    (Self       : not null access AMF_URI_Store;
     Meta_Class : not null access AMF.CMOF.Classes.CMOF_Class'Class)
       return not null AMF.Elements.Element_Access
   is
      Enclosing_Package : AMF.CMOF.Packages.CMOF_Package_Access
--        := Meta_Class.Get_Package;
--  XXX Type:getPackage is derived property, it is not implemented now.
        := AMF.CMOF.Packages.CMOF_Package_Access
            (AMF.Internals.Helpers.To_Element
              (Standard.CMOF.Internals.Metamodel.MM_CMOF));
      Factory           : AMF.Factories.Factory_Access
        := AMF.Factories.Registry.Resolve (Enclosing_Package.Get_URI.Value);
      Element           : AMF.Elements.Element_Access
        := Factory.Create (Meta_Class);

   begin
      --  Add element to the store.

      AMF.Internals.Extents.Internal_Append
       (Self.Extent, AMF.Internals.Helpers.To_Element (Element));

      --  Notify about creation of element.

      AMF.Internals.Listener_Registry.Notify_Instance_Create (Element);

      return Element;
   end Create;

   -----------------
   -- Create_Link --
   -----------------

   overriding procedure Create_Link
    (Self           : not null access AMF_URI_Store;
     Association    :
       not null access AMF.CMOF.Associations.CMOF_Association'Class;
     First_Element  : not null AMF.Elements.Element_Access;
     Second_Element : not null AMF.Elements.Element_Access)
   is
      A          : CMOF_Element
        := AMF.Internals.Helpers.To_Element
            (AMF.Elements.Abstract_Element'Class (Association.all)'Access);
      Member_End : constant AMF_Collection_Of_Element
        := Standard.CMOF.Internals.Attributes.Internal_Get_Member_End (A);

   begin
      --  XXX This subprogram is not CMOF specific and can be refactored to be
      --  used with any metamodels.

      AMF.Internals.Links.Internal_Create_Link
       (A,
        AMF.Internals.Helpers.To_Element (First_Element),
        AMF.Internals.Element_Collections.Element (Member_End, 1),
        AMF.Internals.Helpers.To_Element (Second_Element),
        AMF.Internals.Element_Collections.Element (Member_End, 2));
   end Create_Link;

   ------------------------
   -- Create_From_String --
   ------------------------

   overriding function Create_From_String
    (Self      : not null access AMF_URI_Store;
     Data_Type : not null access AMF.CMOF.Data_Types.CMOF_Data_Type'Class;
     Image     : League.Strings.Universal_String)
       return League.Holders.Holder
   is
      Enclosing_Package : AMF.CMOF.Packages.CMOF_Package_Access
--        := Data_Type.Get_Package;
--  XXX Type:getPackage is derived property, it is not implemented now.
        := AMF.CMOF.Packages.CMOF_Package_Access
            (AMF.Internals.Helpers.To_Element
              (Standard.CMOF.Internals.Metamodel.MM_CMOF));
      Factory           : AMF.Factories.Factory_Access
        := AMF.Factories.Registry.Resolve (Enclosing_Package.Get_URI.Value);

   begin
      return Factory.Create_From_String (Data_Type, Image);
   end Create_From_String;

   -----------------------
   -- Convert_To_String --
   -----------------------

   overriding function Convert_To_String
    (Self      : not null access AMF_URI_Store;
     Data_Type : not null access AMF.CMOF.Data_Types.CMOF_Data_Type'Class;
     Value     : League.Holders.Holder)
       return League.Strings.Universal_String is
   begin
      raise Program_Error;
      return League.Strings.Empty_Universal_String;
   end Convert_To_String;

   -----------------
   -- Get_Package --
   -----------------

   overriding function Get_Package
    (Self : not null access constant AMF_URI_Store)
       return not null AMF.CMOF.Packages.CMOF_Package_Access is
   begin
      return
        AMF.CMOF.Packages.CMOF_Package_Access
         (AMF.Internals.Helpers.To_Element
           (Standard.CMOF.Internals.Metamodel.MM_CMOF));
   end Get_Package;

end AMF.Internals.AMF_URI_Stores;