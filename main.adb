with Ada.Text_IO;

procedure Main is

   can_stop : boolean := false;
   pragma Atomic(can_stop);

   task type break_thread;
   task type main_thread;

   task body break_thread is
   begin
      delay 10.0;
      can_stop := true;
   end break_thread;

   task body main_thread is
      sum : Long_Long_Integer := 0;
      countn : Long_Long_Integer := 1;
   begin
      loop
         sum := sum + 1;
         countn := countn + 1;

         exit when can_stop;
      end loop;
      delay 1.0;

      Ada.Text_IO.Put_Line("Thread sum = " & sum'Img & ", number of terms = " & countn'Img);
   end main_thread;

   b1 : break_thread;
   t1 : main_thread;
   t2 : main_thread;
  -- t3 : main_thread;
   begin
   null;
end Main;
