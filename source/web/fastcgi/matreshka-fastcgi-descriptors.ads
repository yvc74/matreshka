------------------------------------------------------------------------------
--                                                                          --
--                            Matreshka Project                             --
--                                                                          --
--                               Web Framework                              --
--                                                                          --
--                        Runtime Library Component                         --
--                                                                          --
------------------------------------------------------------------------------
--                                                                          --
-- Copyright © 2013, Vadim Godunko <vgodunko@gmail.com>                     --
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
with Ada.Streams;

with GNAT.Sockets;

with FastCGI.Field_Names;
with FastCGI.Field_Values;

package Matreshka.FastCGI.Descriptors is

   type Abstract_Descriptor is abstract tagged limited record
      Socket       : GNAT.Sockets.Socket_Type;
      Request_Id   : Matreshka.FastCGI.FCGI_Request_Identifier;

      Params_Done  : Boolean := False;
      --  FCGI_PARAMS was received completely.

      Headers_Done : Boolean := False;
      --  All headers was generated by application and output. Stdout data are
      --  send directly to the server.

      Stdout_Data  : League.Stream_Element_Vectors.Stream_Element_Vector;
      Stderr_Data : League.Stream_Element_Vectors.Stream_Element_Vector;
      --  Vectors to accumulate stdout and stderr data before flushing to
      --  the server.
   end record;

   type Descriptor_Access is access all Abstract_Descriptor'Class;

   not overriding procedure Internal_Begin_Request
    (Self       : in out Abstract_Descriptor;
     Socket     : GNAT.Sockets.Socket_Type;
     Request_Id : Matreshka.FastCGI.FCGI_Request_Identifier);

   procedure Internal_Params
    (Self   : in out Abstract_Descriptor'Class;
     Buffer : Ada.Streams.Stream_Element_Array);

   not overriding procedure Internal_Param
    (Self  : in out Abstract_Descriptor;
     Name  : Standard.FastCGI.Field_Names.Field_Name;
     Value : Standard.FastCGI.Field_Values.Field_Value) is abstract;

   not overriding procedure Internal_End_Params
    (Self : in out Abstract_Descriptor) is abstract;

   not overriding procedure Internal_Stdin
    (Self   : in out Abstract_Descriptor;
     Buffer : Ada.Streams.Stream_Element_Array) is abstract;

   procedure Internal_Header
    (Self  : in out Abstract_Descriptor'Class;
     Name  : Standard.FastCGI.Field_Names.Field_Name;
     Value : Standard.FastCGI.Field_Values.Field_Value);

   procedure Internal_End_Headers
    (Self : in out Abstract_Descriptor'Class);

   procedure Internal_Stdout
    (Self : in out Abstract_Descriptor'Class;
     Data : Ada.Streams.Stream_Element_Array);

   procedure Internal_Stderr
    (Self : in out Abstract_Descriptor'Class;
     Data : Ada.Streams.Stream_Element_Array);

end Matreshka.FastCGI.Descriptors;