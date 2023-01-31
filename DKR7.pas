uses graphabc;

var
  a, k, SW, SH: integer; r: real;

procedure levy(x, y, a, r: real; k: integer);
begin
  if k > 0 then 
  begin
    r := r * sin(pi / 4);
    levy(x, y, a + pi / 4, r, k - 1);
    levy(x + r * cos(a + pi / 4), y - r * sin(a + pi / 4), a - pi / 4, r, k - 1);
  end 
  else
    line(trunc(x), trunc(y), trunc(x + r * cos(a)), trunc(y - r * sin(a))); 
end;

begin
  SetWindowWidth(1000);
  SetWindowHeight(700);
  SetWindowLeft(500);
  SetWindowTop(0);
  SW := 1000;
  SH := 700;
  println('Введите фрактал не больше 13'); readln(k);
  if k > 13 then
    CloseWindow
  else
    println('Введите масштаб не более 500 - '); read(r);
  if r > 500 then begin
    closewindow
  end;
  
  println('P.S');
  
  println('1 - Уменьшение фрактала');
  println('2 - Увеличение фрактала');
  println('3 - Увеличение масштабирования фрактала');
  print('4 - Уменьшение масштабирования фрактала');
  
  LockDrawing;
  for var i := 1 to 500 do
  begin
    NormalizeWindow();
    println('P.S');
    println('1 - Уменьшение фрактала');
    println('2 - Увеличение фрактала');
    println('3 - Увеличение масштабирования фрактала');
    print('4 - Уменьшение масштабирования фрактала');
    Window.Clear; 
    
    levy(SW / 2, SH / 2, 0, r, k);
    Redraw;
    Sleep(1);
    readln(a);
    if k >= 0 then
      case a of
        1: begin print('1 - Увеличение масштабирования фрактала'); r := r + 50; NormalizeWindow(); end; 
        2: begin print('2 - Вверх'); SH := SH + 75; NormalizeWindow(); end;
        3: begin print('3 - Уменьшение фрактала'); NormalizeWindow(); k := k - 1; end;
        4: begin print('4 - Влево'); SW := SW - 75; NormalizeWindow(); end;
        6: begin print('6 - Вправо'); SW := SW + 75; NormalizeWindow(); end;
        7: begin print('7 - Уменьшение масштабирования фрактала'); r := r - 50; NormalizeWindow(); end;
        8: begin print('8 - Вниз'); SH := SH - 75; NormalizeWindow(); end;
        9: begin print('9 - Увеличение фрактала'); k := k + 1; NormalizeWindow(); end;
      
      end
  end;
end.

//readln(k) //OnKeyDown := KeyDown; 