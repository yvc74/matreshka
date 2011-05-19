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
--  A template binding represents a relationship between a templateable 
--  element and a template. A template binding specifies the substitutions of 
--  actual parameters for the formal parameters of the template.
------------------------------------------------------------------------------
with AMF.UML.Directed_Relationships;
limited with AMF.UML.Template_Parameter_Substitutions;
limited with AMF.UML.Template_Signatures;
limited with AMF.UML.Templateable_Elements;

package AMF.UML.Template_Bindings is

   pragma Preelaborate;

   type UML_Template_Binding_Interface is limited interface
     and AMF.UML.Directed_Relationships.UML_Directed_Relationship_Interface;

   type UML_Template_Binding is
     access all UML_Template_Binding_Interface'Class;

   type Set_Of_UML_Template_Binding is null record;
   type Ordered_Set_Of_UML_Template_Binding is null record;

   not overriding function Get_Bound_Element
    (Self : not null access constant UML_Template_Binding_Interface)
       return AMF.UML.Templateable_Elements.UML_Templateable_Element is abstract;
   --  The element that is bound by this binding.

   not overriding procedure Set_Bound_Element
    (Self : not null access UML_Template_Binding_Interface;
     To   : AMF.UML.Templateable_Elements.UML_Templateable_Element) is abstract;

   not overriding function Get_Parameter_Substitution
    (Self : not null access constant UML_Template_Binding_Interface)
       return AMF.UML.Template_Parameter_Substitutions.Set_Of_UML_Template_Parameter_Substitution is abstract;
   --  The parameter substitutions owned by this template binding.

   not overriding function Get_Signature
    (Self : not null access constant UML_Template_Binding_Interface)
       return AMF.UML.Template_Signatures.UML_Template_Signature is abstract;
   --  The template signature for the template that is the target of the 
   --  binding.

   not overriding procedure Set_Signature
    (Self : not null access UML_Template_Binding_Interface;
     To   : AMF.UML.Template_Signatures.UML_Template_Signature) is abstract;

end AMF.UML.Template_Bindings;