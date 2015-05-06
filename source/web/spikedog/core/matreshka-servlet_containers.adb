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
-- Copyright © 2014-2015, Vadim Godunko <vgodunko@gmail.com>                --
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
with League.String_Vectors;
with Servlet.Generic_Servlets;

with Matreshka.Servlet_Defaults;

package body Matreshka.Servlet_Containers is

   use type League.Strings.Universal_String;

   package Loader is

      procedure Load (Context : in out Servlet.Contexts.Servlet_Context'Class);

   end Loader;

   package body Loader is separate;

   ------------------
   -- Add_Listener --
   ------------------

   overriding procedure Add_Listener
    (Self     : not null access Servlet_Container;
     Listener : not null Servlet.Event_Listeners.Event_Listener_Access)
   is
      Success : Boolean := False;

   begin
      if Self.State = Initialized then
         raise Servlet.Illegal_State_Exception
           with "servlet context has already been initialized";
      end if;

      --  Check for support of Servlet_Context_Listener interface and register
      --  listener in appropriate state of servlet context.

      if Listener.all
           in Servlet.Context_Listeners.Servlet_Context_Listener'Class
      then
         if Self.State = Uninitialized then
            Self.Context_Listeners.Append
             (Servlet.Context_Listeners.Servlet_Context_Listener_Access
               (Listener));
            Success := True;

         else
            raise Servlet.Illegal_State_Exception
              with "Servlet_Container_Listener can't be added";
         end if;
      end if;

      if not Success then
         raise Servlet.Illegal_Argument_Exception
           with "listener doesn't supports any of expected interfaces";
      end if;
   end Add_Listener;

   -----------------
   -- Add_Servlet --
   -----------------

   overriding function Add_Servlet
    (Self     : not null access Servlet_Container;
     Name     : League.Strings.Universal_String;
     Instance : not null access Servlet.Servlets.Servlet'Class)
       return access Servlet.Servlet_Registrations.Servlet_Registration'Class
   is
      use type Matreshka.Servlet_Registrations.Servlet_Access;

      Object       : constant Matreshka.Servlet_Registrations.Servlet_Access
        := Matreshka.Servlet_Registrations.Servlet_Access (Instance);
      Registration :
        Matreshka.Servlet_Registrations.Servlet_Registration_Access;

   begin
      if Self.State = Initialized then
         raise Servlet.Illegal_State_Exception
           with "servlet context has already been initialized";
      end if;

      if Name.Is_Empty then
         raise Servlet.Illegal_Argument_Exception with "servlet name is empty";
      end if;

      if Instance.all
           not in Servlet.Generic_Servlets.Generic_Servlet'Class
      then
         raise Servlet.Illegal_Argument_Exception
           with "not descedant of base servlet type";
      end if;

      --  Check whether servlet instance or servlet name was registered.

      for Registration of Self.Servlets loop
         if Registration.Servlet = Object or Registration.Name = Name then
            return null;
         end if;
      end loop;

      Registration :=
        new Matreshka.Servlet_Registrations.Servlet_Registration'
             (Context => Self,
              Name    => Name,
              Servlet => Object);
      Self.Servlets.Insert (Name, Registration);

      --  Initialize servlet.

      Registration.Servlet.Initialize (Registration);

      return Registration;
   end Add_Servlet;

   --------------
   -- Dispatch --
   --------------

   procedure Dispatch
    (Self     : not null access Servlet_Container'Class;
     Request  : not null
       Matreshka.Servlet_HTTP_Requests.HTTP_Servlet_Request_Access;
     Response : not null
       Matreshka.Servlet_HTTP_Responses.HTTP_Servlet_Response_Access)
   is
      Servlet : Matreshka.Servlet_Registrations.Servlet_Registration_Access;

   begin
      Self.Dispatch (Request.all, Request.Get_Path, 1, Servlet);
      Request.Set_Session_Manager (Self.Session_Manager);
      Request.Set_Servlet_Context (Self);
      Servlet.Servlet.Service (Request.all, Response.all);
   end Dispatch;

   --------------
   -- Finalize --
   --------------

   procedure Finalize (Self : not null access Servlet_Container'Class) is
   begin
      for Listener of reverse Self.Context_Listeners loop
         Listener.Context_Destroyed (Self);
      end loop;

      Self.State := Uninitialized;
   end Finalize;

   -------------------
   -- Get_MIME_Type --
   -------------------

   overriding function Get_MIME_Type
    (Self : Servlet_Container;
     Path : League.Strings.Universal_String)
       return League.Strings.Universal_String is
   begin
      if Path.Ends_With (".css") then
         return League.Strings.To_Universal_String ("text/css");

      elsif Path.Ends_With (".js") then
         return League.Strings.To_Universal_String ("text/javascript");

      elsif Path.Ends_With (".png") then
         return League.Strings.To_Universal_String ("image/png");

      elsif Path.Ends_With (".txt") then
         return League.Strings.To_Universal_String ("text/plain");

      elsif Path.Ends_With (".frag") then
         return League.Strings.To_Universal_String ("x-shader/x-fragment");

      elsif Path.Ends_With (".vert") then
         return League.Strings.To_Universal_String ("x-shader/x-vertex");

      else
         return League.Strings.Empty_Universal_String;
      end if;
   end Get_MIME_Type;
      
   -------------------
   -- Get_Real_Path --
   -------------------

   overriding function Get_Real_Path
    (Self : Servlet_Container;
     Path : League.Strings.Universal_String)
       return League.Strings.Universal_String is
   begin
      return "install" & Path;
   end Get_Real_Path;

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize
    (Self   : not null access Servlet_Container'Class;
     Server : not null Matreshka.Servlet_Servers.Server_Access)
   is
      Success : Boolean;

   begin
      Server.Set_Container (Self);

      Self.State := Initialization;

      --  Load application.

      Loader.Load (Self.all);

      for Listener of Self.Context_Listeners loop
         Listener.Context_Initialized (Self);
      end loop;

      Self.State := Initialized;

      --  Setup default servlet for context.

      Self.Add_Mapping
       (new Matreshka.Servlet_Registrations.Servlet_Registration'
             (Context => Self,
              Name    => League.Strings.Empty_Universal_String,
              Servlet => new Matreshka.Servlet_Defaults.Default_Servlet),
        League.Strings.To_Universal_String ("/"),
        Success);
   end Initialize;

   -------------------------
   -- Set_Session_Manager --
   -------------------------

   overriding procedure Set_Session_Manager
    (Self    : in out Servlet_Container;
     Manager :
       not null Spikedog.HTTP_Session_Managers.HTTP_Session_Manager_Access) is
   begin
      Self.Session_Manager := Manager;
   end Set_Session_Manager;

end Matreshka.Servlet_Containers;