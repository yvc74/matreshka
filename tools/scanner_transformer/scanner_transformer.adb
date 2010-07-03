------------------------------------------------------------------------------
--                                                                          --
--                            Matreshka Project                             --
--                                                                          --
--         Localization, Internationalization, Globalization for Ada        --
--                                                                          --
--                              Tools Component                             --
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
--  This program extracts data from the code generated by aflex, and generate
--  actual implementation of scanner for regular expression engine.

with Ada.Characters.Conversions;
with Ada.Command_Line;
with Asis.Ada_Environments;
with Asis.Compilation_Units;
with Asis.Elements;
with Asis.Implementation;

with Scanner_Extractor;
with Scanner_Generator;

procedure Scanner_Transformer is
   Transformer_Context : Asis.Context;
   Scanner_Unit        : Asis.Compilation_Unit;
   Scanner_Body        : Asis.Element;

begin
   Asis.Implementation.Initialize ("-asis05");
   Asis.Ada_Environments.Associate
    (Transformer_Context,
     "Transformer_Context",
     "-C1 "
       & Ada.Characters.Conversions.To_Wide_String
          (Ada.Command_Line.Argument (2)));
   Asis.Ada_Environments.Open (Transformer_Context);

   if Ada.Command_Line.Argument (1) = "regexp" then
      Scanner_Unit :=
        Asis.Compilation_Units.Compilation_Unit_Body
         ("Regexp_Scanner", Transformer_Context);
      Scanner_Body := Asis.Elements.Unit_Declaration (Scanner_Unit);

   elsif Ada.Command_Line.Argument (1) = "xml10" then
      Scanner_Unit :=
        Asis.Compilation_Units.Compilation_Unit_Body
         ("Xml_Scanner_10", Transformer_Context);
      Scanner_Body := Asis.Elements.Unit_Declaration (Scanner_Unit);

   elsif Ada.Command_Line.Argument (1) = "xml11" then
      Scanner_Unit :=
        Asis.Compilation_Units.Compilation_Unit_Body
         ("Xml_Scanner_11", Transformer_Context);
      Scanner_Body := Asis.Elements.Unit_Declaration (Scanner_Unit);
   end if;

   Scanner_Extractor.Extract (Scanner_Body);
   Scanner_Generator.Generate_Scanner_Code;
   Scanner_Generator.Generate_Scanner_Tables;

   Asis.Ada_Environments.Close (Transformer_Context);
   Asis.Ada_Environments.Dissociate (Transformer_Context);
   Asis.Implementation.Finalize;
end Scanner_Transformer;
