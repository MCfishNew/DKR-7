uses graphabc;
var a,k:integer; r:real;
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
  print('Введите фрактал не больше 15');
  readln(k);
  LockDrawing;
  for var i:=1 to 500 do
  begin
    Window.Clear;
    levy(200,300,0,250,k);
    Redraw;
    Sleep(1);
readln(a);
if k>=0 then
  case a of
 1: begin print('1 - Уменьшение фрактала'); k:=k-1;levy(200,300,0,250,k); end ;
 2: begin print('1 - Увеличение фрактала'); k:=k+1;levy(200,300,0,250,k);end;
 3: ;
 4: ;
 else closewindow ;
end
end;
end.

//readln(k) //OnKeyDown := KeyDown; 


