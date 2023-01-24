uses graphabc;
var a,k,SW,SH:integer; r:real;
{procedure KeyDown(Key: integer);
var k:integer; r: real;
begin
   case Key of
  VK_Left:  begin k:=k-1; redraw(); end;
  VK_Right: begin k:=k+1; redraw(); end;
  VK_Up:    Window.Top := Window.Top - 2;
  VK_Down:  Window.Top := Window.Top + 2;
   end;
end;}
procedure levy(x,y,a,r:real;k:integer); 
begin
if k>0 then 
 begin
  r:=r*sin(pi/4);
  levy(x,y,a+pi/4,r,k-1);
  levy(x+r*cos(a+pi/4),y-r*sin(a+pi/4),a-pi/4,r,k-1);
 end 
else
line(trunc(x),trunc(y),trunc(x+r*cos(a)),trunc(y-r*sin(a))); 
end; 
begin
SetWindowWidth(1366);
SetWindowHeight(768);
SW:=1366;
SH:=768;
  println('Введите фрактал не больше 15');readln(k);
  println('Введите масштаб - '); read(r);
  println('P.S');
  
  println('1 - Уменьшение фрактала');
  println('2 - Увеличение фрактала');
  println('3 - Увеличение масштабирования фрактала');
  print('4 - Уменьшение масштабирования фрактала');
  
  LockDrawing;
  for var i:=1 to 500 do
  begin
 NormalizeWindow();
 println('P.S');
  println('1 - Уменьшение фрактала');
  println('2 - Увеличение фрактала');
  println('3 - Увеличение масштабирования фрактала');
  print('4 - Уменьшение масштабирования фрактала');
    Window.Clear; 
    
    levy(SW/2,SH/2,0,r,k);
    Redraw;
    Sleep(1);
    
  
readln(a);
if k>=0 then
  case a of
 1:  if k>=1 then begin print('1 - Уменьшение фрактала'); NormalizeWindow();
 k:=k-1;
 end;
 2: begin print('2 - Увеличение фрактала'); k:=k+1; NormalizeWindow();end;
 3: begin print('3 - Увеличение масштабирования фрактала'); r:=r+20; NormalizeWindow();end;
 4: begin print('4 - Уменьшение масштабирования фрактала'); r:=r-20; NormalizeWindow();end;
 5: begin print('5 - Вверх'); SH:=SH+50; NormalizeWindow();end;
 6: begin print('6 - Вниз'); SH:=SH-50; NormalizeWindow();end;
 7: begin print('7 - Влево'); SW:=SW-50; NormalizeWindow();end;
 8: begin print('8 - Вправо'); SW:=SW+50; NormalizeWindow();end;
end
end;
end.

//readln(k) //OnKeyDown := KeyDown; 

