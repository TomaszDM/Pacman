program Pacman;

uses crt,wincrt, graph,dos;

var
  ster, tryb : integer;

  pkts,wyraz, go,mi,se,sse,c,uzytkownik,uzytkownik2,zxc,uzytkownikbe: string;

  x, y, i,j,i2, zmiana,vxp, vyp, iv,vxd1,vyd1,vxd4,vyd4, vxd2,vyd2,vxd3,vyd3, x1,xd,yd,
  y1,linijka,ko,kolorop,diflvl,speedd,muzyka,tr,xk,yk, vxdp1,vydp1,vxdp2,vydp2,vxdp3,vydp3 : integer;

  switch, godz,min,sek,godz2,min2,sek2,ssek,ssek2,hb1,hb2,mb1,pkt, licznik, mb2,sb1,sb2,ssb1,ssb2:word;

  ss,g,m,s : longint;



  l: int64;  //wyniki czs

  kd, kierunek, kd1,kd2,kd3 : byte;

  adel,tomek:boolean;

  k,kt,km:int64;

  v:longint;

  uzytkownikb: array[1..2,1..6] of string;

  przycisk,n,z,przycisktryb,przyciskmap,przyciskekran:char;

  koniec, essc,enteer,entertryb,entermap,graj,enterko,esc,entero, kpress : boolean;

  kolor : array[0..7] of integer;

  tp : array[1..10,1..100] of integer;

  bestt : array[1..2,1..10,1..100] of string;

  ts : array[1..10,1..100] of integer;

  wena : array[1..2,0..10,0..100] of string;

  wynik : int64;

  wynikplik1 : file of int64;

  map1: file of int64;

  cojarobie : array[1..2,1..10,1..100] of longint;
  cojarobie2 : array[1..2,1..10,1..100] of longint;
  opcje : array[1..5] of integer;

  sett,sur,adv,hero, hero2 : text;
  xtekst,ytekst,vxd1tekst,vyd1tekst,vxd2tekst,vyd2tekst,vxd3tekst,vyd3tekst:string;

  const
  kk=0;

procedure testmap;
  begin
    setcolor(black);
    setfillstyle(1,red);
    bar(1,1,1280,1024);
    setfillstyle(1,black);
    bar(300,300,500,340);
    bar(300,300,340,420);
    bar(300,380,540,420);
    bar(460,240,420,420);
  end;


procedure siateczka;
var
pozw1,pozw2:boolean;
begin
for i:=1 to 41 do
 begin
  for j:=1 to 41 do
    begin
     setfillstyle(1,white);
     pozw1:=false;
     pozw2:=false;

     if (getpixel(30*i,30*j)=black) and (getpixel(30*i-2,30*j)=black) and (getpixel(30*i+2,30*j)=black) then pozw1:=true;
     if (getpixel(30*i,30*j-2)=black) and (getpixel(30*i,30*j+2)=black) then pozw2:=true;
     if pozw1 and pozw2 then
       begin
        setcolor(white);
        fillellipse(30*i,30*j,3,3);
       end;
     setcolor(black);
     setfillstyle(1,black);
     bar(490,450,790,564);
     bar(565,564,700,596);
     setcolor(white);
   end;
   end;
end;
function siatka(x,y,pkt:longint):integer;
var
xsiatka,ysiatka,i,j,k:integer;
znajdzki: array[1..1682] of integer;
znajdzki2: array[1..1682] of integer;
pozw1,pozw2:boolean;
punkty: array[1..1682] of boolean;
begin
i:=1;
if getpixel(30,30)=black then for xsiatka:=1 to 41 do
 begin
  for ysiatka:=1 to 41 do
    begin
        znajdzki[i]:=30*xsiatka;
        znajdzki2[i]:=30*ysiatka;
        punkty[i]:=false;
        inc(i);
    end;
  end;

j:=(x div 30);
k:=(y div 30);
if (znajdzki[j]=x) and (znajdzki2[k]=y)  then
      begin
        punkty[j*k]:=true;
        pkt:=pkt+10;
      end;


j:=1;
for xsiatka:=1 to 41 do
 begin
  for ysiatka:=1 to 41 do
    begin
     setfillstyle(1,white);
     pozw1:=false;
     pozw2:=false;

     if (getpixel(30*xsiatka,30*ysiatka)=black) and (getpixel(30*xsiatka-2,30*ysiatka)=black) and (getpixel(30*xsiatka+2,30*ysiatka)=black) then pozw1:=true;
     if (getpixel(30*xsiatka,30*ysiatka-2)=black) and (getpixel(30*xsiatka,30*ysiatka+2)=black) then pozw2:=true;
     if pozw1 and pozw2 then
         if punkty[j]=false then fillellipse(30*xsiatka,30*ysiatka,3,3);
     setcolor(black);
     setfillstyle(1,black);
     bar(490,450,790,564);
     bar(565,564,700,596);
     setcolor(white);
     inc(j);
    end;
 end;

end;

function pokazvki(vxd1,vyd1,x,y,vxd2,vxd3,vyd2,vyd3:integer):integer;
begin
     str(x,xtekst);
     str(vxd1,vxd1tekst);
     str(vyd1,vyd1tekst);
     str(y,ytekst);
     str(vxd2,vxd2tekst);
     str(vxd3,vxd3tekst);
     str(vyd2,vyd2tekst);
     str(vyd3,vyd3tekst);
     setcolor(white);
     settextstyle(TriplexFont,HorizDir,3);
     outtextxy(50,100,xtekst);
     outtextxy(50,130,vxd1tekst);
     outtextxy(50,160,vyd1tekst);
     outtextxy(50,190,ytekst);
     outtextxy(50,220,vxd2tekst);
     outtextxy(50,250,vxd3tekst);
     outtextxy(50,280,vyd2tekst);
     outtextxy(50,310,vyd3tekst);
     delay(100);
     setcolor(black);
     settextstyle(TriplexFont,HorizDir,3);
     outtextxy(50,100,xtekst);
     outtextxy(50,130,vxd1tekst);
     outtextxy(50,160,vyd1tekst);
     outtextxy(50,190,ytekst);
     outtextxy(50,220,vxd2tekst);
     outtextxy(50,250,vxd3tekst);
     outtextxy(50,280,vyd2tekst);
     outtextxy(50,310,vyd3tekst);

end;


procedure P(kierunek, kolor : byte);

begin
  if kierunek=1 then
  begin
  setcolor(kolor);             //pacman d
  setfillstyle(1,kolor);
  pieslice(x,y,35,320,9);
  setcolor(black);
  setfillstyle(1,black);
  fillellipse(x+3,y-6,2,2);
  end
  else
  if kierunek=2 then
  begin
  setcolor(kolor);             //pacman a
  setfillstyle(1,kolor);
  fillellipse(x,y,9,9);
  setcolor(black);
  setfillstyle(1,black);
  pieslice(x,y,145,220,9);
  setcolor(black);
  setfillstyle(1,black);
  fillellipse(x-3,y-6,2,2);
  end
  else
  if kierunek=3 then
  begin
  setcolor(kolor);             //pacman w
  setfillstyle(1,kolor);
  fillellipse(x,y,9,9);
  setcolor(black);
  setfillstyle(1,black);
  pieslice(x,y,125,50,9);
  setcolor(black);
  setfillstyle(1,black);
  fillellipse(x-6, y+1,2,2);
  end
  else
  begin
  setcolor(kolor);             //pacman s
  setfillstyle(1,kolor);
  fillellipse(x,y,9,9);
  setcolor(black);
  setfillstyle(1,black);
  pieslice(x,y,235,310,9);
  setcolor(black);
  setfillstyle(1,black);
  fillellipse(x+6,y+1,2,2);
  end;
end;



procedure P2(kierunek, kolor : byte);

begin
  if kierunek=1 then
  begin
  setcolor(kolor);             //pacman d
  setfillstyle(1,kolor);
  pieslice(x,y,35,320,15);
  setcolor(black);
  setfillstyle(1,black);
  fillellipse(x+3,y-10,2,2);
  end
  else
  if kierunek=2 then
  begin
  setcolor(kolor);             //pacman a
  setfillstyle(1,kolor);
  fillellipse(x,y,15,15);
  setcolor(black);
  setfillstyle(1,black);
  pieslice(x,y,145,220,15);
  setcolor(black);
  setfillstyle(1,black);
  fillellipse(x-3,y-10,2,2);
  end
  else
  if kierunek=3 then
  begin
  setcolor(black);             //pacman w
  setfillstyle(1,kolor);
  fillellipse(x,y,15,15);
  setcolor(black);
  setfillstyle(1,black);
  pieslice(x,y,125,50,15);
  setcolor(black);
  setfillstyle(1,black);
  fillellipse(x-10, y+1,2,2);
  end
  else
  begin
  setcolor(kolor);             //pacman s
  setfillstyle(1,kolor);
  fillellipse(x,y,15,15);
  setcolor(black);
  setfillstyle(1,black);
  pieslice(x,y,235,310,15);
  setcolor(black);
  setfillstyle(1,black);
  fillellipse(x+10,y+1,2,2);
  end;
end;

procedure duch(vxd,vyd, c, ec, kd:integer);
var
m,q:integer;

begin
  setcolor(c);                                    //duszek 1
   if kd=1 then
   begin
     setcolor(c);                                    //duszek a  basic
     setfillstyle(1,c);
     bar((216 div 2)+vxd,(204 div 2)+vyd,(244 div 2)+vxd,(210 div 2)+vyd);
     bar((218 div 2)+vxd,(198 div 2)+vyd,(242 div 2)+vxd,(204 div 2)+vyd);
     bar((220 div 2)+vxd,(194 div 2)+vyd,(240 div 2)+vxd,(198 div 2)+vyd);
     bar((222 div 2)+vxd,(192 div 2)+vyd,(238 div 2)+vxd,(196 div 2)+vyd);
     bar((226 div 2)+vxd,(190 div 2)+vyd,(234 div 2)+vxd,(192 div 2)+vyd);
     bar((216 div 2)+vxd,(210 div 2)+vyd,(220 div 2)+vxd,(214 div 2)+vyd);
     bar((222 div 2)+vxd,(210 div 2)+vyd,(228 div 2)+vxd,(214 div 2)+vyd);
     bar((232 div 2)+vxd,(210 div 2)+vyd,(238 div 2)+vxd,(214 div 2)+vyd);
     bar((240 div 2)+vxd,(210 div 2)+vyd,(244 div 2)+vxd,(214 div 2)+vyd);
     setfillstyle(1,black);
     bar((218 div 2)+vxd,(212 div 2)+vyd,(223 div 2)+vxd,(214 div 2)+vyd);
     bar((236 div 2)+vxd,(212 div 2)+vyd,(242 div 2)+vxd,(214 div 2)+vyd);


     setfillstyle(1,ec);                        //OCZY
     bar((222 div 2)+vxd,(196 div 2)+vyd,(226 div 2)+vxd,(206 div 2)+vyd);
     bar((220 div 2)+vxd,(198 div 2)+vyd,(228 div 2)+vxd,(204 div 2)+vyd);
     bar((234 div 2)+vxd,(196 div 2)+vyd,(238 div 2)+vxd,(206 div 2)+vyd);
     bar((232 div 2)+vxd,(198 div 2)+vyd,(240 div 2)+vxd,(204 div 2)+vyd);
     setfillstyle(1,black);
     bar((219 div 2)+vxd,(200 div 2)+vyd,(223 div 2)+vxd,(204 div 2)+vyd);
     bar((231 div 2)+vxd,(200 div 2)+vyd,(235 div 2)+vxd,(204 div 2)+vyd);
   end
   else
   if kd=2 then
   begin
      m:=vyd;
      q:=vxd;
   setcolor(c);                                    //duszek s  basic
   setfillstyle(1,c);
   bar((216 div 2)+q,(204 div 2)+m,(244 div 2)+q,(210 div 2)+m);
   bar((218 div 2)+q,(198 div 2)+m,(242 div 2)+q,(204 div 2)+m);
   bar((220 div 2)+q,(194 div 2)+m,(240 div 2)+q,(198 div 2)+m);
   bar((222 div 2)+q,(192 div 2)+m,(238 div 2)+q,(196 div 2)+m);
   bar((226 div 2)+q,(190 div 2)+m,(234 div 2)+q,(192 div 2)+m);
   bar((216 div 2)+q,(210 div 2)+m,(220 div 2)+q,(214 div 2)+m);
   bar((222 div 2)+q,(210 div 2)+m,(228 div 2)+q,(214 div 2)+m);
   bar((232 div 2)+q,(210 div 2)+m,(238 div 2)+q,(214 div 2)+m);
   bar((240 div 2)+q,(210 div 2)+m,(244 div 2)+q,(214 div 2)+m);
   setfillstyle(1,black);
   bar((218 div 2)+q,(212 div 2)+m,(223 div 2)+q,(214 div 2)+m);
   bar((236 div 2)+q,(212 div 2)+m,(242 div 2)+q,(214 div 2)+m);


   setfillstyle(1, ec);                        //OCZY
   bar((222 div 2)+q,(196 div 2)+m,(226 div 2)+q,(206 div 2)+m);
   bar((220 div 2)+q,(198 div 2)+m,(228 div 2)+q,(204 div 2)+m);
   bar((234 div 2)+q,(196 div 2)+m,(238 div 2)+q,(206 div 2)+m);
   bar((232 div 2)+q,(198 div 2)+m,(240 div 2)+q,(204 div 2)+m);
   setfillstyle(1,black);
   bar((222 div 2)+q,(201 div 2)+m,(226 div 2)+q,(205 div 2)+m);
   bar((234 div 2)+q,(201 div 2)+m,(238 div 2)+q,(205 div 2)+m);


   end
   else
   if kd=3 then
   begin
     m:=vyd;
     q:=vxd;
   setcolor(c);                                    //duszek d  basic
   setfillstyle(1,c);
   bar((216 div 2)+q,(204 div 2)+m,(244 div 2)+q,(210 div 2)+m);
   bar((218 div 2)+q,(198 div 2)+m,(242 div 2)+q,(204 div 2)+m);
   bar((220 div 2)+q,(194 div 2)+m,(240 div 2)+q,(198 div 2)+m);
   bar((222 div 2)+q,(192 div 2)+m,(238 div 2)+q,(196 div 2)+m);
   bar((226 div 2)+q,(190 div 2)+m,(234 div 2)+q,(192 div 2)+m);
   bar((216 div 2)+q,(210 div 2)+m,(220 div 2)+q,(214 div 2)+m);
   bar((222 div 2)+q,(210 div 2)+m,(228 div 2)+q,(214 div 2)+m);
   bar((232 div 2)+q,(210 div 2)+m,(238 div 2)+q,(214 div 2)+m);
   bar((240 div 2)+q,(210 div 2)+m,(244 div 2)+q,(214 div 2)+m);
   setfillstyle(1,black);
   bar((218 div 2)+q,(212 div 2)+m,(223 div 2)+q,(214 div 2)+m);
   bar((236 div 2)+q,(212 div 2)+m,(242 div 2)+q,(214 div 2)+m);


   setfillstyle(1, ec);                        //OCZY
   bar((222 div 2)+q,(196 div 2)+m,(226 div 2)+q,(206 div 2)+m);
   bar((220 div 2)+q,(198 div 2)+m,(228 div 2)+q,(204 div 2)+m);
   bar((234 div 2)+q,(196 div 2)+m,(238 div 2)+q,(206 div 2)+m);
   bar((232 div 2)+q,(198 div 2)+m,(240 div 2)+q,(204 div 2)+m);
   setfillstyle(1,black);
   bar((223 div 2)+q,(200 div 2)+m,(227 div 2)+q,(204 div 2)+m);
   bar((235 div 2)+q,(200 div 2)+m,(239 div 2)+q,(204 div 2)+m);
   end
   else
   if kd=4 then
   begin
      m:=vyd;
      q:=vxd;
   setcolor(c);                                    //duszek w  basic
   setfillstyle(1,c);
   bar((216 div 2)+q,(204 div 2)+m,(244 div 2)+q,(210 div 2)+m);
   bar((218 div 2)+q,(198 div 2)+m,(242 div 2)+q,(204 div 2)+m);
   bar((220 div 2)+q,(194 div 2)+m,(240 div 2)+q,(198 div 2)+m);
   bar((222 div 2)+q,(192 div 2)+m,(238 div 2)+q,(196 div 2)+m);
   bar((226 div 2)+q,(190 div 2)+m,(234 div 2)+q,(192 div 2)+m);
   bar((216 div 2)+q,(210 div 2)+m,(220 div 2)+q,(214 div 2)+m);
   bar((222 div 2)+q,(210 div 2)+m,(228 div 2)+q,(214 div 2)+m);
   bar((232 div 2)+q,(210 div 2)+m,(238 div 2)+q,(214 div 2)+m);
   bar((240 div 2)+q,(210 div 2)+m,(244 div 2)+q,(214 div 2)+m);
   setfillstyle(1,black);
   bar((218 div 2)+q,(212 div 2)+m,(223 div 2)+q,(214 div 2)+m);
   bar((236 div 2)+q,(212 div 2)+m,(242 div 2)+q,(214 div 2)+m);


   setfillstyle(1,ec);                        //OCZY
   bar((222 div 2)+q,(196 div 2)+m,(226 div 2)+q,(206 div 2)+m);
   bar((220 div 2)+q,(198 div 2)+m,(228 div 2)+q,(204 div 2)+m);
   bar((234 div 2)+q,(196 div 2)+m,(238 div 2)+q,(206 div 2)+m);
   bar((232 div 2)+q,(198 div 2)+m,(240 div 2)+q,(204 div 2)+m);
   setfillstyle(1,black);
   bar((222 div 2)+q,(198 div 2)+m,(226 div 2)+q,(202 div 2)+m);
   bar((234 div 2)+q,(198 div 2)+m,(238 div 2)+q,(202 div 2)+m);


   end;


end;

procedure duch2(vxd,vyd, c, ec, kd:integer);
var
m,q:integer;

begin
  setcolor(c);                                    //duszek 1
   if kd=1 then
   begin
     setcolor(c);                                    //duszek a  basic
     setfillstyle(1,c);
     bar(216+vxd,204+vyd,244+vxd,210+vyd);
     bar(218+vxd,198+vyd,242+vxd,204+vyd);
     bar(220+vxd,194+vyd,240+vxd,198+vyd);
     bar(222+vxd,192+vyd,238+vxd,196+vyd);
     bar(226+vxd,190+vyd,234+vxd,192+vyd);
     bar(216+vxd,210+vyd,220+vxd,214+vyd);
     bar(222+vxd,210+vyd,228+vxd,214+vyd);
     bar(232+vxd,210+vyd,238+vxd,214+vyd);
     bar(240+vxd,210+vyd,244+vxd,214+vyd);
     setfillstyle(1,black);
     bar(218+vxd,212+vyd,223+vxd,214+vyd);
     bar(236+vxd,212+vyd,242+vxd,214+vyd);


     setfillstyle(1,ec);                        //OCZY
     bar(222+vxd,196+vyd,226+vxd,206+vyd);
     bar(220+vxd,198+vyd,228+vxd,204+vyd);
     bar(234+vxd,196+vyd,238+vxd,206+vyd);
     bar(232+vxd,198+vyd,240+vxd,204+vyd);
     setfillstyle(1,black);
     bar(219+vxd,200+vyd,223+vxd,204+vyd);
     bar(231+vxd,200+vyd,235+vxd,204+vyd);
   end
   else
   if kd=2 then
   begin
      m:=vyd;
      q:=vxd;
   setcolor(c);                                    //duszek s  basic
   setfillstyle(1,c);
   bar(216+q,204+m,244+q,210+m);
   bar(218+q,198+m,242+q,204+m);
   bar(220+q,194+m,240+q,198+m);
   bar(222+q,192+m,238+q,196+m);
   bar(226+q,190+m,234+q,192+m);
   bar(216+q,210+m,220+q,214+m);
   bar(222+q,210+m,228+q,214+m);
   bar(232+q,210+m,238+q,214+m);
   bar(240+q,210+m,244+q,214+m);
   setfillstyle(1,black);
   bar(218+q,212+m,223+q,214+m);
   bar(236+q,212+m,242+q,214+m);


   setfillstyle(1, ec);                        //OCZY
   bar(222+q,196+m,226+q,206+m);
   bar(220+q,198+m,228+q,204+m);
   bar(234+q,196+m,238+q,206+m);
   bar(232+q,198+m,240+q,204+m);
   setfillstyle(1,black);
   bar(222+q,201+m,226+q,205+m);
   bar(234+q,201+m,238+q,205+m);


   end
   else
   if kd=3 then
   begin
     m:=vyd;
     q:=vxd;
   setcolor(c);                                    //duszek d  basic
   setfillstyle(1,c);
   bar(216+q,204+m,244+q,210+m);
   bar(218+q,198+m,242+q,204+m);
   bar(220+q,194+m,240+q,198+m);
   bar(222+q,192+m,238+q,196+m);
   bar(226+q,190+m,234+q,192+m);
   bar(216+q,210+m,220+q,214+m);
   bar(222+q,210+m,228+q,214+m);
   bar(232+q,210+m,238+q,214+m);
   bar(240+q,210+m,244+q,214+m);
   setfillstyle(1,black);
   bar(218+q,212+m,223+q,214+m);
   bar(236+q,212+m,242+q,214+m);


   setfillstyle(1, ec);                        //OCZY
   bar(222+q,196+m,226+q,206+m);
   bar(220+q,198+m,228+q,204+m);
   bar(234+q,196+m,238+q,206+m);
   bar(232+q,198+m,240+q,204+m);
   setfillstyle(1,black);
   bar(223+q,200+m,227+q,204+m);
   bar(235+q,200+m,239+q,204+m);
   end
   else
   if kd=4 then
   begin
      m:=vyd;
      q:=vxd;
   setcolor(c);                                    //duszek w  basic
   setfillstyle(1,c);
   bar(216+q,204+m,244+q,210+m);
   bar(218+q,198+m,242+q,204+m);
   bar(220+q,194+m,240+q,198+m);
   bar(222+q,192+m,238+q,196+m);
   bar(226+q,190+m,234+q,192+m);
   bar(216+q,210+m,220+q,214+m);
   bar(222+q,210+m,228+q,214+m);
   bar(232+q,210+m,238+q,214+m);
   bar(240+q,210+m,244+q,214+m);
   setfillstyle(1,black);
   bar(218+q,212+m,223+q,214+m);
   bar(236+q,212+m,242+q,214+m);


   setfillstyle(1,ec);                        //OCZY
   bar(222+q,196+m,226+q,206+m);
   bar(220+q,198+m,228+q,204+m);
   bar(234+q,196+m,238+q,206+m);
   bar(232+q,198+m,240+q,204+m);
   setfillstyle(1,black);
   bar(222+q,198+m,226+q,202+m);
   bar(234+q,198+m,238+q,202+m);


   end;


end;

procedure motion;

begin


    if keypressed then
       begin
         z:=readkey;
         z:=Upcase(z);
         if ord(z)=83 then
            begin
              kierunek:=4;
              y1:=1;
              x1:=0;
            end
            else
            if ord(z)=65 then
               begin
                 kierunek:=2;
                 y1:=0;
                 x1:=-1;
               end
               else
               if ord(z)=87 then
                  begin
                    kierunek:=3;
                    y1:=-1;
                    x1:=0;
                  end
                  else
                  if ord(z)=68 then
                     begin
                       kierunek:=1;
                       y1:=0;
                       x1:=1;
                     end;
       end;



    if (getpixel(x+20, y) <> kk) then
    begin
      x1:=-1;
      y1:=0;
      kierunek:=2;
    end;

    if (getpixel(x, y+20) <> kk) then
    begin
      x1:=0;
      y1:=-1;
      kierunek:=3;
    end;

    if (getpixel(x, y-20) <> kk) then
    begin
      x1:=0;
      y1:=1;
      kierunek:=4;
    end;

    if (getpixel(x-20, y) <> kk) then
    begin
      x1:=1;
      y1:=0;
      kierunek:=1;
    end;

end;

procedure motionduch(vxd,vyd,kd:integer);

begin
    if (getpixel(vxd+20+230, vyd+202) <> kk) then
    begin
      xd:=-10;
      yd:=0;
      kd:=1;
    end;

    if (getpixel(vxd+230, vyd+20+202) <> kk) then
    begin
      xd:=0;
      yd:=-10;
      kd:=2;
    end;

    if (getpixel(vxd+230, vyd-20+202) <> kk) then
    begin
      xd:=0;
      yd:=10;
      kd:=4;
    end;

    if (getpixel(vxd-20+230, vyd+202) <> kk) then
    begin
      xd:=10;
      yd:=0;
      kd:=3;
    end;

end;

procedure gonitwa(vxd,vyd,kd : integer);

begin
if (((abs(vxd+230-x)<abs(vyd-y)+202)))
    and  (abs(vxd+230-x)>2) then
   begin
    if  x>vxd+230 then
           begin
             xd:=10;
             yd:=0;
             kd:=3;
           end
           else
              if x<vxd+230  then
               begin
                xd:=-10;
                yd:=0;
                kd:=1;
               end;
    end
    else
        begin

        if (vyd+202<y) then
            begin
              xd:=0;
              yd:=10;
              kd:=2;
            end
            else
             begin
              xd:=0;
              yd:=-10;
              kd:=4;
             end;

        if (vyd+202<y) then
            begin
              xd:=0;
              yd:=10;
              kd:=2;
            end
            else
             if  (vyd+202>y) then
              begin
               xd:=0;
               yd:=-10;
               kd:=4;
              end
              else
               if x>vxd+230 then
                begin
                 xd:=10;
                 yd:=0;
                 kd:=3;
                end
                else
                 if x<vxd+230 then
                  begin
                   xd:=-10;
                   yd:=0;
                   kd:=1;
                  end;
        end;

 end;


const
vdg=10;




procedure menu;  // ka¾dy kolor ktory jest losowany musi by† inny
  begin

                  setfillstyle(1,black);
                     bar(1,1,getmaxx,getmaxy);

                     kolor[1]:=random(10-1+1)+1;

                     setcolor(kolor[1]);
                     settextstyle(TriplexFont,HorizDir,10);
                     outtextxy(310,100,'MENU');

                     kolor[2]:=random(10-1+1)+1;
                     while kolor[2]=kolor[1] do
                      kolor[2]:=random(10-1+1)+1;

                     setcolor(kolor[2]);
                     settextstyle(TriplexFont,HorizDir,3);
                     outtextxy(50,300,'PRESS:');

                     kolor[3]:=random(10-1+1)+1;
                     while kolor[3]=kolor[2] do
                      kolor[3]:=random(10-1+1)+1;

                     setcolor(kolor[3]);
                     settextstyle(TriplexFont,HorizDir,3);
                     outtextxy(150,400,' PLAY');

                     kolor[4]:=random(10-1+1)+1;
                     while kolor[4]=kolor[3] do
                      kolor[4]:=random(10-1+1)+1;

                     setcolor(kolor[4]);
                     settextstyle(TriplexFont,HorizDir,3);
                     outtextxy(150,500,' HIGHSCORE');

                     kolor[5]:=random(10-1+1)+1;
                     while kolor[5]=kolor[4] do
                      kolor[5]:=random(10-1+1)+1;

                     setcolor(kolor[5]);
                     settextstyle(TriplexFont,HorizDir,3);
                     outtextxy(150,600,' INSTRUCTION');

                     kolor[6]:=random(10-1+1)+1;
                     while kolor[6]=kolor[5] do
                      kolor[6]:=random(10-1+1)+1;

                     setcolor(kolor[6]);
                     settextstyle(TriplexFont,HorizDir,3);
                     outtextxy(150,700,' Creators');

                     kolor[7]:=random(10-1+1)+1;
                     while kolor[7]=kolor[6] do
                      kolor[7]:=random(10-1+1)+1;

                     setcolor(kolor[7]);
                     settextstyle(TriplexFont,HorizDir,3);
                     outtextxy(150,800,' OPTIONS');

                     setcolor(kolor[6]);
                     settextstyle(TriplexFont,HorizDir,3);
                     outtextxy(150,900,' END GAME');
  end;

procedure map6;
   begin
    setcolor(black);
    setfillstyle(1,random(5-1+1)+1);

    bar(20,20,40,1000);  //obramowanie
    bar(20,20,1260,40);
    bar(1240,20,1260,1000);
    bar(20,980,1260,1000);
    setfillstyle(1,random(5-1+1)+1);
    bar(40,75,110,110);
    bar(75,75,110,180);
    setfillstyle(1,random(5-1+1)+1);
    bar(145,75,250,110);
    bar(180,75,215,180);
    bar(215,75,250,145);
    setfillstyle(1,random(5-1+1)+1);
    bar(285,75,355,110);
    setfillstyle(1,random(5-1+1)+1);
    bar(425,40,495,75);
    bar(460,40,495,180);
    bar(460,145,530,180);
    setfillstyle(1,random(5-1+1)+1);
    bar(565,40,705,75);
    bar(565,110,600,180);
    bar(565,145,635,180);
    setfillstyle(1,random(5-1+1)+1);
    bar(565,215,600,285);
    bar(530,250,670,285);
    setfillstyle(1,random(5-1+1)+1);
    bar(495,320,530,390);
    bar(495,320,600,355);
    setfillstyle(1,random(5-1+1)+1);
    bar(530,425,425,460);
    bar(425,460,460,390);
    setfillstyle(1,random(5-1+1)+1);
    bar(425,355,460,250);
    bar(495,285,390,250);
    setfillstyle(1,random(5-1+1)+1);
    bar(390,320,320,390);
    setfillstyle(1,random(5-1+1)+1);
    bar(390,425,355,495);
    bar(355,460,320,565);
    setfillstyle(1,random(5-1+1)+1);
    bar(285,530,180,495);
    bar(215,565,250,460);
    setfillstyle(1,random(5-1+1)+1);
    bar(180,460,75,425);
    bar(110,425,145,495);
    setfillstyle(1,random(5-1+1)+1);
    bar(180,355,250,390);
    bar(215,390,285,425);
    setfillstyle(1,random(5-1+1)+1);
    bar(75,390,110,285);
    bar(75,285,145,320);
    setfillstyle(1,random(5-1+1)+1);
    bar(180,285,285,320);
    bar(285,285,250,250);
    setfillstyle(1,random(5-1+1)+1);
    bar(75,250,215,215);
    setfillstyle(1,random(5-1+1)+1);
    bar(250,215,425,180);
    bar(285,215,320,145);
    bar(390,215,425,110);
    bar(320,215,355,285);
    setfillstyle(1,random(5-1+1)+1);
    bar(75,945,110,840);
    bar(75,875,145,910);
    setfillstyle(1,random(5-1+1)+1);
    bar(145,980,250,945);
    bar(215,980,180,875);
    setfillstyle(1,random(5-1+1)+1);
    bar(285,980,425,945);
    setfillstyle(1,random(5-1+1)+1);
    bar(495,945,565,910);
    setfillstyle(1,random(5-1+1)+1);
    bar(425,910,460,805);
    bar(425,875,635,840);
    bar(600,910,635,805);
    setfillstyle(1,random(5-1+1)+1);
    bar(495,805,565,770);
    bar(495,805,530,700);
    setfillstyle(1,random(5-1+1)+1);
    bar(390,665,425,525);
    setfillstyle(1,random(5-1+1)+1);
    bar(425,700,460,770);
    bar(425,700,390,735);
    setfillstyle(1,random(5-1+1)+1);
    bar(390,770,355,910);
    bar(390,770,285,805);
    setfillstyle(1,random(5-1+1)+1);
    bar(320,910,250,840);
    setfillstyle(1,random(5-1+1)+1);
    bar(250,770,180,805);
    bar(145,805,215,840);
    setfillstyle(1,random(5-1+1)+1);
    bar(40,805,75,630);
    bar(40,630,110,665);
    bar(40,700,145,735);
    bar(110,700,145,770);
    setfillstyle(1,random(5-1+1)+1);
    bar(75,595,110,525);
    bar(75,525,145,560);
    setfillstyle(1,random(5-1+1)+1);
    bar(180,735,215,630);
    bar(145,665,180,595);
    setfillstyle(1,random(5-1+1)+1);
    bar(250,595,320,630);
    bar(250,595,285,665);
    setfillstyle(1,random(5-1+1)+1);
    bar(250,700,355,735);
    bar(320,735,355,665);
    setfillstyle(1,random(5-1+1)+1);
    bar(1205,945,1170,805);
    setfillstyle(1,random(5-1+1)+1);
    bar(1135,915,1065,880);
    bar(1100,880,1065,980);
    setfillstyle(1,random(5-1+1)+1);
    bar(1135,845,1030,810);
    bar(1065,845,1100,775);
    setfillstyle(1,random(5-1+1)+1);
    bar(1030,945,995,875);
    bar(995,910,960,805);
    setfillstyle(1,random(5-1+1)+1);
    bar(925,945,855,910);
    bar(855,945,890,805);
    bar(925,840,820,805);
    setfillstyle(1,random(5-1+1)+1);
    bar(820,945,785,875);
    bar(820,910,680,945);
    setfillstyle(1,random(5-1+1)+1);
    bar(680,840,785,805);
    bar(715,875,750,770);
    setfillstyle(1,random(5-1+1)+1);
    bar(680,770,610,735);
    bar(645,735,575,700);
    setfillstyle(1,random(5-1+1)+1);
    bar(715,735,820,700);
    bar(785,770,890,735);
    setfillstyle(1,random(5-1+1)+1);
    bar(925,770,995,735);
    bar(960,770,995,700);
    setfillstyle(1,random(5-1+1)+1);
    bar(1030,700,1170,735);
    bar(1135,700,1170,770);
    setfillstyle(1,random(5-1+1)+1);
    bar(1205,700,1240,630);
    bar(1205,665,1170,595);
    setfillstyle(1,random(5-1+1)+1);
    bar(1135,665,960,630);
    bar(1030,665,1065,560);
    setfillstyle(1,random(5-1+1)+1);
    bar(855,630,925,700);
    setfillstyle(1,random(5-1+1)+1);
    bar(855,595,995,560);
    bar(960,595,925,525);
    setfillstyle(1,random(5-1+1)+1);
    bar(1205,75,1065,110);
    setfillstyle(1,random(5-1+1)+1);
    bar(1205,145,1170,215);
    bar(1205,215,1135,180);
    setfillstyle(1,random(5-1+1)+1);
    bar(1100,215,1030,145);
    setfillstyle(1,random(5-1+1)+1);
    bar(1135,285,1030,320);
    bar(1065,250,1100,390);
    setfillstyle(1,random(5-1+1)+1);
    bar(1240,285,1205,320);
    bar(1205,250,1170,355);
    setfillstyle(1,random(5-1+1)+1);
    bar(1205,390,1170,460);
    bar(1205,460,1100,425);
    setfillstyle(1,random(5-1+1)+1);
    bar(1170,495,1065,530);
    bar(1100,530,1205,565);
    bar(1100,565,1135,600);
    setfillstyle(1,random(5-1+1)+1);
    bar(1030,530,995,425);
    bar(1065,425,960,460);
    setfillstyle(1,random(5-1+1)+1);
    bar(925,460,855,495);
    bar(855,460,890,530);
    setfillstyle(1,random(5-1+1)+1);
    bar(925,425,890,355);
    bar(890,355,995,390);
    setfillstyle(1,random(5-1+1)+1);
    bar(995,250,925,285);
    bar(960,285,855,320);
    setfillstyle(1,random(5-1+1)+1);
    bar(995,215,960,75);
    bar(1030,75,925,110);
    bar(925,110,960,145);
    setfillstyle(1,random(5-1+1)+1);
    bar(890,75,750,110);
    bar(855,75,820,145);
    setfillstyle(1,random(5-1+1)+1);
    bar(785,145,680,180);
    bar(680,215,715,110);
    setfillstyle(1,random(5-1+1)+1);
    bar(820,180,925,215);
    bar(890,215,855,250);
    setfillstyle(1,random(5-1+1)+1);
    bar(820,250,715,285);
    bar(785,250,750,215);
    setfillstyle(1,random(5-1+1)+1);
    bar(680,420,575,385);
    bar(645,420,610,455);
    setfillstyle(1,random(5-1+1)+1);
    bar(750,320,645,355);
    bar(750,320,715,455);
    setfillstyle(1,random(5-1+1)+1);
    bar(785,455,820,385);
    bar(820,420,855,350);
    setfillstyle(1,random(5-1+1)+1);
    bar(460,490,820,665); //srodek
    setfillstyle(1,black);
    bar(565,490,715,525);
    bar(495,522,785,633);

   end;

procedure map5;
   begin
    setcolor(black);
    setfillstyle(1,6);

    bar(20,20,40,1000);  //obramowanie
    bar(20,20,1260,40);
    bar(1240,20,1260,1000);
    bar(20,980,1260,1000);

    bar(75,72,145,104); //od lewego gornego rogu
    bar(75,72,110,200);
    bar(75,136,145,200);
    bar(40,232,285,264);
    bar(40,232,75,296);
    bar(110,296,145,328);
    bar(75,328,110,388);
    bar(75,328,215,356);
    bar(180,356,145,388);
    bar(320,356,425,328);
    bar(390,356,425,420);
    bar(320,420,425,388);
    bar(320,420,355,452);
    bar(250,356,285,452);
    bar(250,388,215,452);
    bar(250,420,75,452);
    bar(250,232,285,328);
    bar(180,264,285,296);
    bar(390,264,530,232);
    bar(495,264,460,360);
    bar(320,264,530,296);
    bar(530,328,565,360);
    bar(565,264,635,296);
    bar(600,264,635,360);
    bar(675,264,745,296);
    bar(675,264,710,360);
    bar(75,136,215,168);
    bar(180,40,215,104);
    bar(180,136,215,200);
    bar(180,168,390,200);
    bar(320,168,355,232);
    bar(250,72,320,136);
    bar(250,72,460,104);
   // bar(355,72,390,200);
    bar(425,200,600,168);
    bar(565,200,600,232);
    bar(565,200,775,232);
    bar(748,200,713,136);
    bar(495,40,600,72);
    bar(425,104,680,136);
    bar(645,72,680,168);
    bar(715,40,750,104);
    bar(715,72,855,104);
    bar(890,72,1030,104);
    bar(995,40,1030,104);
    bar(1065,72,1205,104);
    bar(1170,72,1205,168);
    bar(1205,136,1100,168);
    bar(1100,136,1135,232);
    bar(1100,200,1065,232);
    bar(1065,136,785,168);
    bar(1030,136,995,232);
    bar(1030,200,925,232);
    bar(925,232,960,296);
    bar(995,264,1135,296);
    bar(1170,200,1205,296);
    bar(1170,200,1240,232);
    bar(1100,264,1135,392);
    bar(1135,360,1065,328);
    bar(1170,360,1240,328);
    bar(1170,392,1205,520);
    bar(1170,488,1240,520);
    bar(1240,552,1065,584);
    bar(1205,552,1170,648);
    bar(1170,616,1065,648);
    bar(1205,948,1100,916);
    bar(1205,948,1170,852);
    bar(1135,916,1065,884);
    bar(1135,948,1100,756);
    bar(1135,788,995,756);
    bar(1240,820,1170,788);
    bar(1205,820,1170,692);
    bar(1205,724,1100,692);
    bar(1065,980,890,948);
    bar(1030,948,925,916);
    bar(1030,948,995,820);
    bar(995,852,1065,820);
    bar(855,948,785,916);
    bar(890,916,820,884);
    bar(890,916,855,820);
    bar(890,852,960,884);
    bar(960,820,925,756);
    bar(960,788,855,756);
    bar(890,788,855,692);
    bar(890,724,785,692);
    bar(820,724,785,596);
    bar(855,564,890,660); //
    bar(855,660,1030,628);
    bar(960,660,925,724);
    bar(960,724,1065,692);
    bar(855,532,960,500);   //
    bar(925,532,960,596);
    bar(925,596,1030,564);
    bar(995,564,1030,500);
    bar(1030,500,1135,532);
    bar(1100,500,1135,436);
    bar(1135,436,1030,468);
    bar(1030,436,1065,404);
    bar(995,436,960,404);
    bar(995,436,855,468);
    bar(855,394,925,362);
    bar(820,362,1030,330);
    bar(785,298,890,266);
    bar(855,330,890,202);
    bar(890,202,820,234);
    bar(785,362,750,330);
    bar(75,948,110,884);  //dol
    bar(40,852,110,820);
    bar(75,820,110,692);
    bar(75,692,180,724);
    bar(75,628,180,660);
    bar(145,692,180,628);
    bar(215,692,250,660);
    bar(215,692,320,724);
    bar(285,724,320,596);
    bar(215,596,320,628);
    bar(320,596,355,660);
    bar(355,692,425,724);
    bar(425,596,460,628);
    bar(425,724,390,532);
    bar(425,468,390,500);
    bar(425,564,320,532);
    bar(355,564,320,500);
    bar(355,532,215,500);
    bar(250,500,215,564);
    bar(40,500,180,532);
    bar(75,500,110,596);
    bar(75,596,180,564);
    bar(75,948,180,916);
    bar(145,948,180,820);
    bar(285,852,250,756);
    bar(285,756,145,788);
    bar(145,852,320,820);
    bar(215,884,250,980);
    bar(215,948,355,916);
    bar(285,820,320,884);
    bar(285,884,390,852);
    bar(355,884,390,756);
    bar(320,788,460,756);
    bar(425,756,460,948);
    bar(425,948,390,916);
    bar(425,884,530,852);
    bar(495,884,530,820);
    bar(705,980,635,948);
    bar(495,948,740,916);
    bar(565,916,635,884);
    bar(600,884,705,852);
    bar(670,852,810,820);
    bar(775,852,740,884);
    bar(495,852,565,820);
    bar(495,788,565,756);
    bar(495,788,530,596);
    bar(495,660,460,724);
    bar(670,660,635,596);
    bar(565,596,600,724);
    bar(705,596,740,724);
    bar(565,724,740,692);
    bar(600,724,635,820);
    bar(600,788,810,756);

    bar(460,392,820,424); //srodek
    bar(460,564,820,532);
    bar(460,392,495,564);
    bar(820,392,785,564);
    setfillstyle(1,black);
    bar(565,392,715,424);



   end;

procedure map4;
   begin
    setcolor(black);
    setfillstyle(1,4);

    bar(20,20,40,1000);  //obramowanie
    bar(20,20,1260,40);
    bar(1240,20,1260,1000);
    bar(20,980,1260,1000);

    bar(75,72,145,200);
    bar(75,104,320,168);

    bar(40,232,215,264);
    bar(215,232,180,456);
    bar(215,552,180,776);
    bar(180,776,40,744);

    bar(75,712,145,680);
    bar(145,712,110,648);
    bar(40,648,75,584);
    bar(40,584,145,616);

    bar(40,552,75,456);
    bar(110,552,145,456);
    bar(110,488,180,520);

    bar(40,424,145,392);
    bar(40,424,75,360);
    bar(145,360,110,296);
    bar(75,296,145,328);


    bar(180,40,285,72);

    bar(355,72,390,232);
    bar(355,72,495,104);

    bar(425,136,495,200);

    bar(530,136,565,40);

    bar(530,168,565,264);
    bar(495,232,530,296);

    bar(460,232,425,296);
    bar(460,296,320,264);

    bar(320,232,250,200);
    bar(250,200,285,328);

    bar(250,360,355,392);
    bar(355,392,320,328);

    bar(390,328,530,360);

    bar(390,392,425,616);
    bar(250,424,425,456);
    bar(250,584,425,616);
    bar(250,552,355,488);

    bar(250,648,320,680);
    bar(250,648,285,712);

    bar(355,648,530,680);
    bar(460,680,495,600);//

    bar(495,712,460,776);
    bar(495,712,390,744);

    bar(495,808,425,840);
    bar(425,808,460,872);

    bar(425,904,530,936);

    bar(355,904,390,1000);

    bar(390,872,355,776);
    bar(355,808,320,712);
    bar(320,746,250,778);

    bar(75,872,145,808);

    bar(75,936,320,904);
    bar(180,936,215,808);

    bar(320,872,250,840);
    bar(250,872,285,808);

    bar(1205,72,1135,200);
    bar(1205,104,960,168);

    bar(1240,232,1065,264);
    bar(1065,232,1100,456);
    bar(1065,552,1100,776);
    bar(1100,776,1240,744);

    bar(1205,712,1135,680);
    bar(1135,712,1170,648);
    bar(1240,648,1205,584);
    bar(1204,584,1135,616);

    bar(1240,552,1205,456);
    bar(1170,552,1135,456);
    bar(1170,488,1100,520);

    bar(1240,424,1135,392);
    bar(1240,424,1205,360);
    bar(1135,360,1170,296);
    bar(1205,296,1125,328);


    bar(1100,40,995,72);

    bar(925,72,890,232);
    bar(925,72,785,104);

    bar(855,136,785,200);

    bar(750,136,715,40);

    bar(750,168,715,264);
    bar(785,232,750,296);

    bar(820,232,855,296);
    bar(820,296,960,264);

    bar(960,232,1030,200);
    bar(1030,200,995,328);

    bar(1030,360,925,392);
    bar(925,392,960,328);

    bar(890,328,750,360);

    bar(890,392,855,616);
    bar(1030,424,855,456);
    bar(1030,584,855,616);
    bar(1030,552,925,488);

    bar(1030,648,960,680);
    bar(1030,648,995,712);

    bar(925,648,750,680);
    bar(820,680,785,600);//

    bar(785,712,820,776);
    bar(785,712,890,744);

    bar(785,808,855,840);
    bar(855,808,820,872);

    bar(750,904,855,936);

    bar(890,904,925,1000);

    bar(890,872,925,776);
    bar(925,808,960,712);
    bar(960,746,1030,778);

    bar(1205,872,1135,808);

    bar(1205,936,960,904);
    bar(1100,936,1065,808);

    bar(960,872,1030,840);
    bar(1030,872,995,808);

    bar(565,936,715,902);
    bar(600,902,680,870);

    bar(600,838,530,806);
    bar(530,838,565,774);

    bar(680,838,750,806);
    bar(750,838,725,774);

    bar(530,742,750,710);
    bar(565,710,715,678);

    bar(565,646,715,602);


    bar(565,328,715,296);
    bar(600,328,680,360);

    bar(600,72,680,264);

    bar(460,392,820,424); //srodek
    bar(460,564,820,532);
    bar(460,392,495,564);
    bar(820,392,785,564);
    setfillstyle(1,black);
    bar(565,392,715,424);
   end;

procedure map3;
   begin
    setcolor(black);
    setfillstyle(1,3);

    bar(20,20,40,1000);  //obramowanie
    bar(20,20,1260,40);
    bar(1240,20,1260,1000);
    bar(20,980,1260,1000);

    bar(75,72,215,136);
    bar(75,72,145,200);

    bar(250,72,285,136);

    bar(320,72,355,136);
    bar(320,104,460,136);
    bar(390,40,425,72);
    bar(460,72,495,136);

    bar(530,72,565,136);
    bar(530,72,750,104);
    bar(715,72,750,136);

    bar(1205,72,1065,136);
    bar(1205,72,1135,200);

    bar(1030,72,995,136);

    bar(960,72,925,136);
    bar(960,104,820,136);
    bar(890,40,855,72);
    bar(785,72,820,136);

    bar(600,136,680,392); //krzyz gorny
    bar(390,168,890,232);

    bar(925,168,960,232);
    bar(925,168,1100,200);

    bar(1100,232,1065,296);
    bar(1100,296,960,264);

    bar(1135,264,1210,296);
    bar(1170,232,1210,360);

    bar(1065,328,1135,360);

    bar(1030,328,960,456);
    bar(995,392,1100,456);

    bar(1135,392,1205,456);

    bar(925,456,890,264);
    bar(925,264,820,296);
    bar(890,296,855,318);

    bar(785,264,750,392);
    bar(715,360,820,328);

    bar(355,168,320,232);
    bar(355,168,180,200);

    bar(180,232,215,296);
    bar(180,296,320,264);

    bar(145,264,70,296);
    bar(100,232,70,360);

    bar(215,328,145,360);

    bar(250,328,320,456);
    bar(285,392,180,456);

    bar(145,392,75,456);

    bar(355,456,390,264);
    bar(355,264,460,296);
    bar(390,296,425,318);

    bar(495,264,530,392);
    bar(565,360,460,328);


    bar(75,948,215,884);
    bar(75,948,145,820);

    bar(250,948,285,884);

    bar(320,884,355,948);
    bar(320,884,495,916);
    bar(495,884,460,948);
    bar(425,948,390,1000);

    bar(530,884,565,948);
    bar(530,948,750,916);
    bar(715,884,750,948);

    bar(785,948,820,884);
    bar(785,884,960,916);
    bar(925,884,960,948);
    bar(890,1000,855,948);

    bar(995,884,1030,948);

    bar(1065,884,1205,948);
    bar(1205,948,1135,820);

    bar(1100,852,925,820);
    bar(960,852,925,788);

    bar(1100,788,1065,724);
    bar(1100,724,960,756);

    bar(1135,724,1205,756);
    bar(1170,788,1205,660);

    bar(1135,660,1065,692);

    bar(1135,628,1205,564);

    bar(1100,564,960,628);
    bar(960,564,1030,692);

    bar(925,564,893,756);
    bar(925,756,858,692);
    bar(925,756,821,724);

    bar(820,692,715,660);//may krzyz
    bar(750,628,785,756);

    bar(600,884,680,628); //krzyz dolny
    bar(390,852,890,788);

    bar(565,692,460,660);//may krzyz
    bar(530,628,495,756);

    bar(355,564,390,756);
    bar(355,756,425,692);
    bar(355,756,460,724);

    bar(320,564,180,628);
    bar(320,564,250,692);

    bar(75,724,145,756);
    bar(75,788,110,660);

    bar(145,660,225,692);

    bar(75,628,145,564);

    bar(180,724,320,756);
    bar(180,724,215,788);

    bar(180,820,355,852);
    bar(320,788,355,852);

    bar(40,492,145,528);
    bar(180,492,285,528);
    bar(320,492,425,528);

    bar(1240,492,1135,528);
    bar(1100,492,995,528);
    bar(960,492,855,528);

    bar(460,424,820,456); //srodek
    bar(460,596,820,564);
    bar(460,424,495,596);
    bar(820,424,785,596);
    setfillstyle(1,black);
    bar(565,564,715,596);
   end;

procedure map2;
   begin
    setcolor(black);
    setfillstyle(1,5);
    bar(20,20,1260,39);//obramowanie
    bar(20,20,39,1004);
    bar(1241,20,1260,1004);
    bar(39,985,1260,1004);

    bar(70,70,186,99); //lewy gorny
    bar(70,70,99,186);

    bar(70,246,99,362);
    bar(70,333,186,362);

    bar(246,70,362,99);
    bar(333,70,362,186);

    bar(333,246,362,362);
    bar(246,333,362,362);

    bar(129,129,303,158);
    bar(129,129,158,187);
    bar(303,187,274,129);

    bar(129,247,158,305);
    bar(303,247,274,305);
    bar(129,276,303,305);

    bar(187,187,245,245);

    bar(70,422,128,509);//lewy srodek
    bar(188,422,246,509);
    bar(306,422,364,509); //632

    bar(70,540,128,632);
    bar(188,540,246,632);
    bar(306,540,364,632);

    bar(70,954,186,925); //lewy dol
    bar(70,954,99,838);

    bar(246,954,362,925);
    bar(333,954,362,838);

    bar(70,662,99,778);
    bar(70,662,186,691);

    bar(246,662,362,691);
    bar(333,662,362,778);

    bar(129,895,158,838);
    bar(129,895,303,866);
    bar(303,866,274,838);

    bar(129,720,158,778);
    bar(129,720,303,749);
    bar(303,778,274,720);

    bar(188,778,246,836);

    bar(1210,70,1094,99);//prawy gorny
    bar(1210,70,1181,186);

    bar(1210,246,1181,362);
    bar(1210,362,1094,333);

    bar(1034,362,918,333);
    bar(918,362,947,246);

    bar(918,70,947,186);
    bar(918,70,1034,99);

    bar(1152,128,978,157);
    bar(1152,128,1123,186);
    bar(978,128,1007,186);

    bar(1152,303,978,274);
    bar(1152,303,1123,245);
    bar(978,303,1007,245);

    bar(1037,186,1095,245);

    bar(1210,954,1181,838); //prawy dolny
    bar(1210,954,1094,925);

    bar(1210,778,1181,662);
    bar(1210,662,1094,691);


    bar(918,778,947,662);
    bar(918,662,1034,691);

    bar(1034,954,918,925);
    bar(918,954,947,838);

    bar(1152,896,978,867);
    bar(1152,896,1123,838);
    bar(978,896,1007,838);

    bar(1152,720,978,749);
    bar(1152,720,1123,778);
    bar(978,720,1007,778);

    bar(1037,778,1095,838);

    bar(1210,422,1152,509);//prawy srodek
    bar(1092,422,1034,509);
    bar(974,422,916,509); //632   60

    bar(1210,540,1152,632);
    bar(1092,540,1034,632);
    bar(974,540,916,632);

    bar(424,954,856,922);//srodek srodek dol

    bar(586,865,694,827);
    bar(694,827,640,775);
    bar(640,775,586,733);
    bar(586,733,694,694);

    bar(423,615,856,647);

    bar(393,679,531,711);
    bar(393,679,425,890);
    bar(393,890,531,858);

    bar(454,826,518,741);

    bar(886,679,748,711);
    bar(886,679,850,890);
    bar(886,890,748,858);

    bar(748,826,819,741);


    bar(424,70,856,102);//srodek srodek gora
    bar(586,159,640,322);
    bar(586,159,670,249);
    bar(640,168,685,240);
    bar(640,177,695,231);
    bar(423,379,856,406);

    bar(393,345,531,313);
    bar(393,345,425,134);
    bar(393,134,531,166);

    bar(454,198,518,283);

    bar(886,345,748,313);
    bar(886,345,850,134);
    bar(886,134,748,166);

    bar(748,198,819,283);

    bar(402,437,878,449);//srodek srodkow
    bar(402,437,414,584);
    bar(878,437,866,584);
    bar(402,584,878,572);
    setfillstyle(1,black);
    bar(586,437,694,449);
 end;
procedure maap1;
   begin
    setcolor(black);
    setfillstyle(1,1);

    bar(20,20,40,1003);  //obramowanie
    bar(20,20,1260,40);
    bar(1240,20,1260,1003);
    bar(20,980,1260,1003);
    bar(360,40,380,100);
    bar(879,40,899,100);
    bar(879,983,899,923);
    bar(360,983,380,923);

    bar(120,923,300,883); //L lewy dolny rog
    bar(120,923,160,562);

    bar(120,100,300,140);
    bar(120,100,160,461);   //L lewy gorny rog

    bar(440,863,819,903); //duzy dolny prostokat
    bar(440,140,819,180); //duzy gorny prostokat

    bar(1159,923,959,883); //L prawy dolny rog
    bar(1159,923,1119,562);

    bar(1159,100,959,140); //L prawy gorny rog
    bar(1159,100,1119,461);

    bar(240,240,554,280); //maly gorny prostokat lewy
    bar(999,240,685,280); //maly gorny ptostokat prawy

    bar(240,783,554,743); //maly dolny prostokat lewy
    bar(999,783,685,743); //maly dolny prostokat prawy

    bar(240,340,280,683); //pionowy prostoka lewy
    bar(959,340,999,683); //puonowy prostokat prawy

    bar(350,340,530,380);//srodek
    bar(350,340,390,643);
    bar(879,340,710,380);
    bar(879,683,350,643);
    bar(879,684,839,340);
   end;
 procedure options;
   begin
            setcolor(random(5-1+1)+1);
            settextstyle(TriplexFont,HorizDir,10);
            outtextxy(350,70,'OPTIONS');
             setcolor(yellow);             //pacman d     gora
                setfillstyle(1,yellow);
                pieslice(100,100,35,320,30);
                setcolor(black);
                setfillstyle(1,black);
                fillellipse(105,80,5,5);
                 setcolor(yellow);             //pacman a     dol
                setfillstyle(1,yellow);
                fillellipse(1180,923,30,30);
                setcolor(black);
                setfillstyle(1,black);
                pieslice(1180,923,145,220,30);
                setcolor(black);
                setfillstyle(1,black);
                fillellipse(1175,903,5,5);
                    setcolor(yellow);             //pacman d  dol
                setfillstyle(1,yellow);
                pieslice(100,923,35,320,30);
                setcolor(black);
                setfillstyle(1,black);
                fillellipse(105,903,5,5);
                 setcolor(yellow);             //pacman a   gora  100 80
                setfillstyle(1,yellow);
                fillellipse(1180,100,30,30);
                setcolor(black);
                setfillstyle(1,black);
                pieslice(1180,100,145,220,30);
                setcolor(black);
                setfillstyle(1,black);
                fillellipse(1175,80,5,5);

                  for i:=1 to 5 do
               begin

                 setcolor(random(13-9+1)+9);                                    //duszek 1
                 setfillstyle(1,random(13-9+1)+9);
                 bar(510+100*i,910,580+100*i,925);    //+70 x
                 bar(515+100*i,895,575+100*i,910);
                 bar(520+100*i,885,570+100*i,895);
                 bar(525+100*i,880,565+100*i,890);
                 bar(535+100*i,875,555+100*i,880);
                 bar(510+100*i,925,520+100*i,935);
                 bar(525+100*i,925,540+100*i,935);
                 bar(550+100*i,925,565+100*i,935);
                 bar(570+100*i,925,580+100*i,935);
                 setfillstyle(1,black);
                 bar(515+100*i,930,530+100*i,935);
                 bar(560+100*i,930,575+100*i,935);
                 setfillstyle(1,white);                        //OCZY
                 bar(525+100*i,890,535+100*i,915);
                 bar(520+100*i,895,540+100*i,910);
                 bar(555+100*i,890,565+100*i,915);
                 bar(550+100*i,895,570+100*i,910);
                 setfillstyle(1,black);
                 bar(525+100*i,900,535+100*i,910);
                 bar(555+100*i,900,565+100*i,910);

              end;

              for i:=1 to 4 do
               begin

                 setcolor(random(13-9+1)+9);                                    //duszek 1
                 setfillstyle(1,random(13-9+1)+9);
                 bar(580-100*i,910,650-100*i,925);    //+70 x
                 bar(585-100*i,895,645-100*i,910);
                 bar(590-100*i,885,640-100*i,895);
                 bar(595-100*i,880,635-100*i,890);
                 bar(605-100*i,875,625-100*i,880);
                 bar(580-100*i,925,590-100*i,935);
                 bar(595-100*i,925,610-100*i,935);
                 bar(620-100*i,925,635-100*i,935);
                 bar(640-100*i,925,650-100*i,935);
                 setfillstyle(1,black);
                 bar(585-100*i,930,600-100*i,935);
                 bar(630-100*i,930,645-100*i,935);
                 setfillstyle(1,white);                        //OCZY
                 bar(595-100*i,890,605-100*i,915);
                 bar(590-100*i,895,610-100*i,910);
                 bar(625-100*i,890,635-100*i,915);
                 bar(620-100*i,895,640-100*i,910);
                 setfillstyle(1,black);
                 bar(595-100*i,900,605-100*i,910);
                 bar(625-100*i,900,635-100*i,910);

              end;

            setcolor(random(5-1+1)+1);
            settextstyle(TriplexFont,HorizDir,6);
            outtextxy(350,270,'CHANGE NAME');
            setcolor(random(5-1+1)+1);
            settextstyle(TriplexFont,HorizDir,6);
            outtextxy(350,370,'DIFFICULT LEVEL');
            setcolor(random(5-1+1)+1);
            settextstyle(TriplexFont,HorizDir,6);
            outtextxy(350,470,'SPEED OF GHOSTS');
            setcolor(random(5-1+1)+1);
            settextstyle(TriplexFont,HorizDir,6);
            outtextxy(350,570,'COLOUR OF PACMAN');
            setcolor(random(5-1+1)+1);
            settextstyle(TriplexFont,HorizDir,6);
            outtextxy(350,670,'MUSIC');


    end;

function kursoroption(yk:word):word;
 begin
   setcolor(kolorop);             //pacman d     gora
                setfillstyle(1,kolorop);
                pieslice(270,190+yk,35,320,30);
                setcolor(black);
                setfillstyle(1,black);
                fillellipse(275,170+yk,5,5);
                pieslice(270,190+yk,320,360,30);
                pieslice(270,190+yk,0,35,30);
                delay(400);
                setfillstyle(1,kolorop);
                pieslice(270,190+yk,0,360,30);
                setfillstyle(1,black);
                fillellipse(275,170+yk,05,5);
                delay(300);
                fillellipse(270,190+yk,30,30);
 end;



 procedure minimapy;
  begin
             setcolor(yellow);             //pacman d     gora
                setfillstyle(1,yellow);
                pieslice(100,100,35,320,30);
                setcolor(black);
                setfillstyle(1,black);
                fillellipse(105,80,5,5);
                 setcolor(yellow);             //pacman a     dol
                setfillstyle(1,yellow);
                fillellipse(1180,923,30,30);
                setcolor(black);
                setfillstyle(1,black);
                pieslice(1180,923,145,220,30);
                setcolor(black);
                setfillstyle(1,black);
                fillellipse(1175,903,5,5);
                    setcolor(yellow);             //pacman d  dol
                setfillstyle(1,yellow);
                pieslice(100,923,35,320,30);
                setcolor(black);
                setfillstyle(1,black);
                fillellipse(105,903,5,5);
                 setcolor(yellow);             //pacman a   gora  100 80
                setfillstyle(1,yellow);
                fillellipse(1180,100,30,30);
                setcolor(black);
                setfillstyle(1,black);
                pieslice(1180,100,145,220,30);
                setcolor(black);
                setfillstyle(1,black);
                fillellipse(1175,80,5,5);

    i:=200;      //map1
    j:=300;
    setcolor(black);
    setfillstyle(1,1);

    bar((20 div 10)+i,(20 div 10)+j,(40 div 10)+i,(1003 div 10)+j);  //obramowanie
    bar((20 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(40 div 10)+j);
    bar((1240 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(1003 div 10)+j);
    bar((20 div 10)+i,(980 div 10)+j,(1260 div 10)+i,(1003 div 10)+j);
    bar((360 div 10)+i,(40 div 10)+j,(380 div 10)+i,(100 div 10)+j);
    bar((879 div 10)+i,(40 div 10)+j,(899 div 10)+i,(100 div 10)+j);
    bar((879 div 10)+i,(983 div 10)+j,(899 div 10)+i,(923 div 10)+j);
    bar((360 div 10)+i,(983 div 10)+j,(380 div 10)+i,(923 div 10)+j);

    bar((120 div 10)+i,(923 div 10)+j,(300 div 10)+i,(883 div 10)+j); //L lewy dolny rog
    bar((120 div 10)+i,(923 div 10)+j,(160 div 10)+i,(562 div 10)+j);

    bar((120 div 10)+i,(100 div 10)+j,(300 div 10)+i,(140 div 10)+j);
    bar((120 div 10)+i,(100 div 10)+j,(160 div 10)+i,(461 div 10)+j);   //L lewy gorny rog

    bar((440 div 10)+i,(863 div 10)+j,(819 div 10)+i,(903 div 10)+j); //duzy dolny prostokat
    bar((440 div 10)+i,(140 div 10)+j,(819 div 10)+i,(180 div 10)+j); //duzy gorny prostokat

    bar((1159 div 10)+i,(923 div 10)+j,(959 div 10)+i,(883 div 10)+j); //L prawy dolny rog
    bar((1159 div 10)+i,(923 div 10)+j,(1119 div 10)+i,(562 div 10)+j);

    bar((1159 div 10)+i,(100 div 10)+j,(959 div 10)+i,(140 div 10)+j); //L prawy gorny rog
    bar((1159 div 10)+i,(100 div 10)+j,(1119 div 10)+i,(461 div 10)+j);

    bar((240 div 10)+i,(240 div 10)+j,(554 div 10)+i,(280 div 10)+j); //maly gorny prostokat lewy
    bar((999 div 10)+i,(240 div 10)+j,(685 div 10)+i,(280 div 10)+j); //maly gorny ptostokat prawy

    bar((240 div 10)+i,(783 div 10)+j,(554 div 10)+i,(743 div 10)+j); //maly dolny prostokat lewy
    bar((999 div 10)+i,(783 div 10)+j,(685 div 10)+i,(743 div 10)+j); //maly dolny prostokat prawy

    bar((240 div 10)+i,(340 div 10)+j,(280 div 10)+i,(683 div 10)+j); //pionowy prostoka lewy
    bar((959 div 10)+i,(340 div 10)+j,(999 div 10)+i,(683 div 10)+j); //puonowy prostokat prawy

    bar((350 div 10)+i,(340 div 10)+j,(530 div 10)+i,(380 div 10)+j);//srodek
    bar((350 div 10)+i,(340 div 10)+j,(390 div 10)+i,(643 div 10)+j);
    bar((879 div 10)+i,(340 div 10)+j,(710 div 10)+i,(380 div 10)+j);
    bar((879 div 10)+i,(683 div 10)+j,(350 div 10)+i,(643 div 10)+j);
    bar((879 div 10)+i,(684 div 10)+j,(839 div 10)+i,(340 div 10)+j);

    setcolor(black);    //map2
    setfillstyle(1,5);
    i:=620;
    j:=300;
    bar((20 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(39 div 10)+j);//obramowanie
    bar((20 div 10)+i,(20 div 10)+j,(39 div 10)+i,(1004 div 10)+j);
    bar((1241 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(1004 div 10)+j);
    bar((39 div 10)+i,(985 div 10)+j,(1260 div 10)+i,(1004 div 10)+j);

    bar((70 div 10)+i,(70 div 10)+j,(186 div 10)+i,(99 div 10)+j); //lewy gorny
    bar((70 div 10)+i,(70 div 10)+j,(99 div 10)+i,(186 div 10)+j);

    bar((70 div 10)+i,(246 div 10)+j,(99 div 10)+i,(362 div 10)+j);
    bar((70 div 10)+i,(333 div 10)+j,(186 div 10)+i,(362 div 10)+j);

    bar((246 div 10)+i,(70 div 10)+j,(362 div 10)+i,(99 div 10)+j);
    bar((333 div 10)+i,(70 div 10)+j,(362 div 10)+i,(186 div 10)+j);

    bar((333 div 10)+i,(246 div 10)+j,(362 div 10)+i,(362 div 10)+j);
    bar((246 div 10)+i,(333 div 10)+j,(362 div 10)+i,(362 div 10)+j);

    bar((129 div 10)+i,(129 div 10)+j,(303 div 10)+i,(158 div 10)+j);
    bar((129 div 10)+i,(129 div 10)+j,(158 div 10)+i,(187 div 10)+j);
    bar((303 div 10)+i,(187 div 10)+j,(274 div 10)+i,(129 div 10)+j);

    bar((129 div 10)+i,(247 div 10)+j,(158 div 10)+i,(305 div 10)+j);
    bar((303 div 10)+i,(247 div 10)+j,(274 div 10)+i,(305 div 10)+j);
    bar((129 div 10)+i,(276 div 10)+j,(303 div 10)+i,(305 div 10)+j);

    bar((187 div 10)+i,(187 div 10)+j,(245 div 10)+i,(245 div 10)+j);

    bar((70 div 10)+i,(422 div 10)+j,(128 div 10)+i,(509 div 10)+j);//lewy srodek
    bar((188 div 10)+i,(422 div 10)+j,(246 div 10)+i,(509 div 10)+j);
    bar((306 div 10)+i,(422 div 10)+j,(364 div 10)+i,(509 div 10)+j); //632

    bar((70 div 10)+i,(540 div 10)+j,(128 div 10)+i,(632 div 10)+j);
    bar((188 div 10)+i,(540 div 10)+j,(246 div 10)+i,(632 div 10)+j);
    bar((306 div 10)+i,(540 div 10)+j,(364 div 10)+i,(632 div 10)+j);

    bar((70 div 10)+i,(954 div 10)+j,(186 div 10)+i,(925 div 10)+j); //lewy dol
    bar((70 div 10)+i,(954 div 10)+j,(99 div 10)+i,(838 div 10)+j);

    bar((246 div 10)+i,(954 div 10)+j,(362 div 10)+i,(925 div 10)+j);
    bar((333 div 10)+i,(954 div 10)+j,(362 div 10)+i,(838 div 10)+j);

    bar((70 div 10)+i,(662 div 10)+j,(99 div 10)+i,(778 div 10)+j);
    bar((70 div 10)+i,(662 div 10)+j,(186 div 10)+i,(691 div 10)+j);

    bar((246 div 10)+i,(662 div 10)+j,(362 div 10)+i,(691 div 10)+j);
    bar((333 div 10)+i,(662 div 10)+j,(362 div 10)+i,(778 div 10)+j);

    bar((129 div 10)+i,(895 div 10)+j,(158 div 10)+i,(838 div 10)+j);
    bar((129 div 10)+i,(895 div 10)+j,(303 div 10)+i,(866 div 10)+j);
    bar((303 div 10)+i,(866 div 10)+j,(274 div 10)+i,(838 div 10)+j);

    bar((129 div 10)+i,(720 div 10)+j,(158 div 10)+i,(778 div 10)+j);
    bar((129 div 10)+i,(720 div 10)+j,(303 div 10)+i,(749 div 10)+j);
    bar((303 div 10)+i,(778 div 10)+j,(274 div 10)+i,(720 div 10)+j);

    bar((188 div 10)+i,(778 div 10)+j,(246 div 10)+i,(836 div 10)+j);

    bar((1210 div 10)+i,(70 div 10)+j,(1094 div 10)+i,(99 div 10)+j);//prawy gorny
    bar((1210 div 10)+i,(70 div 10)+j,(1181 div 10)+i,(186 div 10)+j);

    bar((1210 div 10)+i,(246 div 10)+j,(1181 div 10)+i,(362 div 10)+j);
    bar((1210 div 10)+i,(362 div 10)+j,(1094 div 10)+i,(333 div 10)+j);

    bar((1034 div 10)+i,(362 div 10)+j,(918 div 10)+i,(333 div 10)+j);
    bar((918 div 10)+i,(362 div 10)+j,(947 div 10)+i,(246 div 10)+j);

    bar((918 div 10)+i,(70 div 10)+j,(947 div 10)+i,(186 div 10)+j);
    bar((918 div 10)+i,(70 div 10)+j,(1034 div 10)+i,(99 div 10)+j);

    bar((1152 div 10)+i,(128 div 10)+j,(978 div 10)+i,(157 div 10)+j);
    bar((1152 div 10)+i,(128 div 10)+j,(1123 div 10)+i,(186 div 10)+j);
    bar((978 div 10)+i,(128 div 10)+j,(1007 div 10)+i,(186 div 10)+j);

    bar((1152 div 10)+i,(303 div 10)+j,(978 div 10)+i,(274 div 10)+j);
    bar((1152 div 10)+i,(303 div 10)+j,(1123 div 10)+i,(245 div 10)+j);
    bar((978 div 10)+i,(303 div 10)+j,(1007 div 10)+i,(245 div 10)+j);

    bar((1037 div 10)+i,(186 div 10)+j,(1095 div 10)+i,(245 div 10)+j);

    bar((1210 div 10)+i,(954 div 10)+j,(1181 div 10)+i,(838 div 10)+j); //prawy dolny
    bar((1210 div 10)+i,(954 div 10)+j,(1094 div 10)+i,(925 div 10)+j);

    bar((1210 div 10)+i,(778 div 10)+j,(1181 div 10)+i,(662 div 10)+j);
    bar((1210 div 10)+i,(662 div 10)+j,(1094 div 10)+i,(691 div 10)+j);


    bar((918 div 10)+i,(778 div 10)+j,(947 div 10)+i,(662 div 10)+j);
    bar((918 div 10)+i,(662 div 10)+j,(1034 div 10)+i,(691 div 10)+j);

    bar((1034 div 10)+i,(954 div 10)+j,(918 div 10)+i,(925 div 10)+j);
    bar((918 div 10)+i,(954 div 10)+j,(947 div 10)+i,(838 div 10)+j);

    bar((1152 div 10)+i,(896 div 10)+j,(978 div 10)+i,(867 div 10)+j);
    bar((1152 div 10)+i,(896 div 10)+j,(1123 div 10)+i,(838 div 10)+j);
    bar((978 div 10)+i,(896 div 10)+j,(1007 div 10)+i,(838 div 10)+j);

    bar((1152 div 10)+i,(720 div 10)+j,(978 div 10)+i,(749 div 10)+j);
    bar((1152 div 10)+i,(720 div 10)+j,(1123 div 10)+i,(778 div 10)+j);
    bar((978 div 10)+i,(720 div 10)+j,(1007 div 10)+i,(778 div 10)+j);

    bar((1037 div 10)+i,(778 div 10)+j,(1095 div 10)+i,(838 div 10)+j);

    bar((1210 div 10)+i,(422 div 10)+j,(1152 div 10)+i,(509 div 10)+j);//prawy srodek
    bar((1092 div 10)+i,(422 div 10)+j,(1034 div 10)+i,(509 div 10)+j);
    bar((974 div 10)+i,(422 div 10)+j,(916 div 10)+i,(509 div 10)+j); //632   60

    bar((1210 div 10)+i,(540 div 10)+j,(1152 div 10)+i,(632 div 10)+j);
    bar((1092 div 10)+i,(540 div 10)+j,(1034 div 10)+i,(632 div 10)+j);
    bar((974 div 10)+i,(540 div 10)+j,(916 div 10)+i,(632 div 10)+j);

    bar((424 div 10)+i,(954 div 10)+j,(856 div 10)+i,(922 div 10)+j);//srodek srodek dol

    bar((586 div 10)+i,(865 div 10)+j,(694 div 10)+i,(827 div 10)+j);
    bar((694 div 10)+i,(827 div 10)+j,(640 div 10)+i,(775 div 10)+j);
    bar((640 div 10)+i,(775 div 10)+j,(586 div 10)+i,(733 div 10)+j);
    bar((586 div 10)+i,(733 div 10)+j,(694 div 10)+i,(694 div 10)+j);

    bar((423 div 10)+i,(615 div 10)+j,(856 div 10)+i,(647 div 10)+j);

    bar((393 div 10)+i,(679 div 10)+j,(531 div 10)+i,(711 div 10)+j);
    bar((393 div 10)+i,(679 div 10)+j,(425 div 10)+i,(890 div 10)+j);
    bar((393 div 10)+i,(890 div 10)+j,(531 div 10)+i,(858 div 10)+j);

    bar((454 div 10)+i,(826 div 10)+j,(518 div 10)+i,(741 div 10)+j);

    bar((886 div 10)+i,(679 div 10)+j,(748 div 10)+i,(711 div 10)+j);
    bar((886 div 10)+i,(679 div 10)+j,(850 div 10)+i,(890 div 10)+j);
    bar((886 div 10)+i,(890 div 10)+j,(748 div 10)+i,(858 div 10)+j);

    bar((748 div 10)+i,(826 div 10)+j,(819 div 10)+i,(741 div 10)+j);


    bar((424 div 10)+i,(70 div 10)+j,(856 div 10)+i,(102 div 10)+j);//srodek srodek gora
    bar((586 div 10)+i,(159 div 10)+j,(640 div 10)+i,(322 div 10)+j);
    bar((586 div 10)+i,(159 div 10)+j,(670 div 10)+i,(249 div 10)+j);
    bar((640 div 10)+i,(168 div 10)+j,(685 div 10)+i,(240 div 10)+j);
    bar((640 div 10)+i,(177 div 10)+j,(695 div 10)+i,(231 div 10)+j);
    bar((423 div 10)+i,(379 div 10)+j,(856 div 10)+i,(406 div 10)+j);

    bar((393 div 10)+i,(345 div 10)+j,(531 div 10)+i,(313 div 10)+j);
    bar((393 div 10)+i,(345 div 10)+j,(425 div 10)+i,(134 div 10)+j);
    bar((393 div 10)+i,(134 div 10)+j,(531 div 10)+i,(166 div 10)+j);

    bar((454 div 10)+i,(198 div 10)+j,(518 div 10)+i,(283 div 10)+j);

    bar((886 div 10)+i,(345 div 10)+j,(748 div 10)+i,(313 div 10)+j);
    bar((886 div 10)+i,(345 div 10)+j,(850 div 10)+i,(134 div 10)+j);
    bar((886 div 10)+i,(134 div 10)+j,(748 div 10)+i,(166 div 10)+j);

    bar((748 div 10)+i,(198 div 10)+j,(819 div 10)+i,(283 div 10)+j);

    bar((402 div 10)+i,(437 div 10)+j,(878 div 10)+i,(449 div 10)+j);//srodek srodkow
    bar((402 div 10)+i,(437 div 10)+j,(414 div 10)+i,(584 div 10)+j);
    bar((878 div 10)+i,(437 div 10)+j,(866 div 10)+i,(584 div 10)+j);
    bar((402 div 10)+i,(584 div 10)+j,(878 div 10)+i,(572 div 10)+j);
    setfillstyle(1,black);
    bar((586 div 10)+i,(437 div 10)+j,(694 div 10)+i,(449 div 10)+j);

     setcolor(black);//map3
    setfillstyle(1,3);
    i:=1000;
    j:=300;

    bar((20 div 10)+i,(20 div 10)+j,(40 div 10)+i,(1000 div 10)+j);  //obramowanie
    bar((20 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(40 div 10)+j);
    bar((1240 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(1000 div 10)+j);
    bar((20 div 10)+i,(980 div 10)+j,(1260 div 10)+i,(1000 div 10)+j);

    bar((75 div 10)+i,(72 div 10)+j,(215 div 10)+i,(136 div 10)+j);
    bar((75 div 10)+i,(72 div 10)+j,(145 div 10)+i,(200 div 10)+j);

    bar((250 div 10)+i,(72 div 10)+j,(285 div 10)+i,(136 div 10)+j);

    bar((320 div 10)+i,(72 div 10)+j,(355 div 10)+i,(136 div 10)+j);
    bar((320 div 10)+i,(104 div 10)+j,(460 div 10)+i,(136 div 10)+j);
    bar((390 div 10)+i,(40 div 10)+j,(425 div 10)+i,(72 div 10)+j);
    bar((460 div 10)+i,(72 div 10)+j,(495 div 10)+i,(136 div 10)+j);

    bar((530 div 10)+i,(72 div 10)+j,(565 div 10)+i,(136 div 10)+j);
    bar((530 div 10)+i,(72 div 10)+j,(750 div 10)+i,(104 div 10)+j);
    bar((715 div 10)+i,(72 div 10)+j,(750 div 10)+i,(136 div 10)+j);

    bar((1205 div 10)+i,(72 div 10)+j,(1065 div 10)+i,(136 div 10)+j);
    bar((1205 div 10)+i,(72 div 10)+j,(1135 div 10)+i,(200 div 10)+j);

    bar((1030 div 10)+i,(72 div 10)+j,(995 div 10)+i,(136 div 10)+j);

    bar((960 div 10)+i,(72 div 10)+j,(925 div 10)+i,(136 div 10)+j);
    bar((960 div 10)+i,(104 div 10)+j,(820 div 10)+i,(136 div 10)+j);
    bar((890 div 10)+i,(40 div 10)+j,(855 div 10)+i,(72 div 10)+j);
    bar((785 div 10)+i,(72 div 10)+j,(820 div 10)+i,(136 div 10)+j);

    bar((600 div 10)+i,(136 div 10)+j,(680 div 10)+i,(392 div 10)+j); //krzyz gorny
    bar((390 div 10)+i,(168 div 10)+j,(890 div 10)+i,(232 div 10)+j);

    bar((925 div 10)+i,(168 div 10)+j,(960 div 10)+i,(232 div 10)+j);
    bar((925 div 10)+i,(168 div 10)+j,(1100 div 10)+i,(200 div 10)+j);

    bar((1100 div 10)+i,(232 div 10)+j,(1065 div 10)+i,(296 div 10)+j);
    bar((1100 div 10)+i,(296 div 10)+j,(960 div 10)+i,(264 div 10)+j);

    bar((1135 div 10)+i,(264 div 10)+j,(1210 div 10)+i,(296 div 10)+j);
    bar((1170 div 10)+i,(232 div 10)+j,(1210 div 10)+i,(360 div 10)+j);

    bar((1065 div 10)+i,(328 div 10)+j,(1135 div 10)+i,(360 div 10)+j);

    bar((1030 div 10)+i,(328 div 10)+j,(960 div 10)+i,(456 div 10)+j);
    bar((995 div 10)+i,(392 div 10)+j,(1100 div 10)+i,(456 div 10)+j);

    bar((1135 div 10)+i,(392 div 10)+j,(1205 div 10)+i,(456 div 10)+j);

    bar((925 div 10)+i,(456 div 10)+j,(890 div 10)+i,(264 div 10)+j);
    bar((925 div 10)+i,(264 div 10)+j,(820 div 10)+i,(296 div 10)+j);
    bar((890 div 10)+i,(296 div 10)+j,(855 div 10)+i,(318 div 10)+j);

    bar((785 div 10)+i,(264 div 10)+j,(750 div 10)+i,(392 div 10)+j);
    bar((715 div 10)+i,(360 div 10)+j,(820 div 10)+i,(328 div 10)+j);

    bar((355 div 10)+i,(168 div 10)+j,(320 div 10)+i,(232 div 10)+j);
    bar((355 div 10)+i,(168 div 10)+j,(180 div 10)+i,(200 div 10)+j);

    bar((180 div 10)+i,(232 div 10)+j,(215 div 10)+i,(296 div 10)+j);
    bar((180 div 10)+i,(296 div 10)+j,(320 div 10)+i,(264 div 10)+j);

    bar((145 div 10)+i,(264 div 10)+j,(70 div 10)+i,(296 div 10)+j);
    bar((100 div 10)+i,(232 div 10)+j,(70 div 10)+i,(360 div 10)+j);

    bar((215 div 10)+i,(328 div 10)+j,(145 div 10)+i,(360 div 10)+j);

    bar((250 div 10)+i,(328 div 10)+j,(320 div 10)+i,(456 div 10)+j);
    bar((285 div 10)+i,(392 div 10)+j,(180 div 10)+i,(456 div 10)+j);

    bar((145 div 10)+i,(392 div 10)+j,(75 div 10)+i,(456 div 10)+j);

    bar((355 div 10)+i,(456 div 10)+j,(390 div 10)+i,(264 div 10)+j);
    bar((355 div 10)+i,(264 div 10)+j,(460 div 10)+i,(296 div 10)+j);
    bar((390 div 10)+i,(296 div 10)+j,(425 div 10)+i,(318 div 10)+j);

    bar((495 div 10)+i,(264 div 10)+j,(530 div 10)+i,(392 div 10)+j);
    bar((565 div 10)+i,(360 div 10)+j,(460 div 10)+i,(328 div 10)+j);


    bar((75 div 10)+i,(948 div 10)+j,(215 div 10)+i,(884 div 10)+j);
    bar((75 div 10)+i,(948 div 10)+j,(145 div 10)+i,(820 div 10)+j);

    bar((250 div 10)+i,(948 div 10)+j,(285 div 10)+i,(884 div 10)+j);

    bar((320 div 10)+i,(884 div 10)+j,(355 div 10)+i,(948 div 10)+j);
    bar((320 div 10)+i,(884 div 10)+j,(495 div 10)+i,(916 div 10)+j);
    bar((495 div 10)+i,(884 div 10)+j,(460 div 10)+i,(948 div 10)+j);
    bar((425 div 10)+i,(948 div 10)+j,(390 div 10)+i,(1000 div 10)+j);

    bar((530 div 10)+i,(884 div 10)+j,(565 div 10)+i,(948 div 10)+j);
    bar((530 div 10)+i,(948 div 10)+j,(750 div 10)+i,(916 div 10)+j);
    bar((715 div 10)+i,(884 div 10)+j,(750 div 10)+i,(948 div 10)+j);

    bar((785 div 10)+i,(948 div 10)+j,(820 div 10)+i,(884 div 10)+j);
    bar((785 div 10)+i,(884 div 10)+j,(960 div 10)+i,(916 div 10)+j);
    bar((925 div 10)+i,(884 div 10)+j,(960 div 10)+i,(948 div 10)+j);
    bar((890 div 10)+i,(1000 div 10)+j,(855 div 10)+i,(948 div 10)+j);

    bar((995 div 10)+i,(884 div 10)+j,(1030 div 10)+i,(948 div 10)+j);

    bar((1065 div 10)+i,(884 div 10)+j,(1205 div 10)+i,(948 div 10)+j);
    bar((1205 div 10)+i,(948 div 10)+j,(1135 div 10)+i,(820 div 10)+j);

    bar((1100 div 10)+i,(852 div 10)+j,(925 div 10)+i,(820 div 10)+j);
    bar((960 div 10)+i,(852 div 10)+j,(925 div 10)+i,(788 div 10)+j);

    bar((1100 div 10)+i,(788 div 10)+j,(1065 div 10)+i,(724 div 10)+j);
    bar((1100 div 10)+i,(724 div 10)+j,(960 div 10)+i,(756 div 10)+j);

    bar((1135 div 10)+i,(724 div 10)+j,(1205 div 10)+i,(756 div 10)+j);
    bar((1170 div 10)+i,(788 div 10)+j,(1205 div 10)+i,(660 div 10)+j);

    bar((1135 div 10)+i,(660 div 10)+j,(1065 div 10)+i,(692 div 10)+j);

    bar((1135 div 10)+i,(628 div 10)+j,(1205 div 10)+i,(564 div 10)+j);

    bar((1100 div 10)+i,(564 div 10)+j,(960 div 10)+i,(628 div 10)+j);
    bar((960 div 10)+i,(564 div 10)+j,(1030 div 10)+i,(692 div 10)+j);

    bar((925 div 10)+i,(564 div 10)+j,(893 div 10)+i,(756 div 10)+j);
    bar((925 div 10)+i,(756 div 10)+j,(858 div 10)+i,(692 div 10)+j);
    bar((925 div 10)+i,(756 div 10)+j,(821 div 10)+i,(724 div 10)+j);

    bar((820 div 10)+i,(692 div 10)+j,(715 div 10)+i,(660 div 10)+j);//may krzyz
    bar((750 div 10)+i,(628 div 10)+j,(785 div 10)+i,(756 div 10)+j);

    bar((600 div 10)+i,(884 div 10)+j,(680 div 10)+i,(628 div 10)+j); //krzyz dolny
    bar((390 div 10)+i,(852 div 10)+j,(890 div 10)+i,(788 div 10)+j);

    bar((565 div 10)+i,(692 div 10)+j,(460 div 10)+i,(660 div 10)+j);//may krzyz
    bar((530 div 10)+i,(628 div 10)+j,(495 div 10)+i,(756 div 10)+j);

    bar((355 div 10)+i,(564 div 10)+j,(390 div 10)+i,(756 div 10)+j);
    bar((355 div 10)+i,(756 div 10)+j,(425 div 10)+i,(692 div 10)+j);
    bar((355 div 10)+i,(756 div 10)+j,(460 div 10)+i,(724 div 10)+j);

    bar((320 div 10)+i,(564 div 10)+j,(180 div 10)+i,(628 div 10)+j);
    bar((320 div 10)+i,(564 div 10)+j,(250 div 10)+i,(692 div 10)+j);

    bar((75 div 10)+i,(724 div 10)+j,(145 div 10)+i,(756 div 10)+j);
    bar((75 div 10)+i,(788 div 10)+j,(110 div 10)+i,(660 div 10)+j);

    bar((145 div 10)+i,(660 div 10)+j,(225 div 10)+i,(692 div 10)+j);

    bar((75 div 10)+i,(628 div 10)+j,(145 div 10)+i,(564 div 10)+j);

    bar((180 div 10)+i,(724 div 10)+j,(320 div 10)+i,(756 div 10)+j);
    bar((180 div 10)+i,(724 div 10)+j,(215 div 10)+i,(788 div 10)+j);

    bar((180 div 10)+i,(820 div 10)+j,(355 div 10)+i,(852 div 10)+j);
    bar((320 div 10)+i,(788 div 10)+j,(355 div 10)+i,(852 div 10)+j);

    bar((40 div 10)+i,(492 div 10)+j,(145 div 10)+i,(528 div 10)+j);
    bar((180 div 10)+i,(492 div 10)+j,(285 div 10)+i,(528 div 10)+j);
    bar((320 div 10)+i,(492 div 10)+j,(425 div 10)+i,(528 div 10)+j);

    bar((1240 div 10)+i,(492 div 10)+j,(1135 div 10)+i,(528 div 10)+j);
    bar((1100 div 10)+i,(492 div 10)+j,(995 div 10)+i,(528 div 10)+j);
    bar((960 div 10)+i,(492 div 10)+j,(855 div 10)+i,(528 div 10)+j);

    bar((460 div 10)+i,(424 div 10)+j,(820 div 10)+i,(456 div 10)+j); //srodek
    bar((460 div 10)+i,(596 div 10)+j,(820 div 10)+i,(564 div 10)+j);
    bar((460 div 10)+i,(424 div 10)+j,(495 div 10)+i,(596 div 10)+j);
    bar((820 div 10)+i,(424 div 10)+j,(785 div 10)+i,(596 div 10)+j);
    setfillstyle(1,black);
    bar((565 div 10)+i,(564 div 10)+j,(715 div 10)+i,(596 div 10)+j);

    setcolor(black);  //map4
    setfillstyle(1,4);
    i:=200;
    j:=600;

    bar((20 div 10)+i,(20 div 10)+j,(40 div 10)+i,(1000 div 10)+j);  //obramowanie
    bar((20 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(40 div 10)+j);
    bar((1240 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(1000 div 10)+j);
    bar((20 div 10)+i,(980 div 10)+j,(1260 div 10)+i,(1000 div 10)+j);

    bar((75 div 10)+i,(72 div 10)+j,(145 div 10)+i,(200 div 10)+j);
    bar((75 div 10)+i,(104 div 10)+j,(320 div 10)+i,(168 div 10)+j);

    bar((40 div 10)+i,(232 div 10)+j,(215 div 10)+i,(264 div 10)+j);
    bar((215 div 10)+i,(232 div 10)+j,(180 div 10)+i,(456 div 10)+j);
    bar((215 div 10)+i,(552 div 10)+j,(180 div 10)+i,(776 div 10)+j);
    bar((180 div 10)+i,(776 div 10)+j,(40 div 10)+i,(744 div 10)+j);

    bar((75 div 10)+i,(712 div 10)+j,(145 div 10)+i,(680 div 10)+j);
    bar((145 div 10)+i,(712 div 10)+j,(110 div 10)+i,(648 div 10)+j);
    bar((40 div 10)+i,(648 div 10)+j,(75 div 10)+i,(584 div 10)+j);
    bar((40 div 10)+i,(584 div 10)+j,(145 div 10)+i,(616 div 10)+j);

    bar((40 div 10)+i,(552 div 10)+j,(75 div 10)+i,(456 div 10)+j);
    bar((110 div 10)+i,(552 div 10)+j,(145 div 10)+i,(456 div 10)+j);
    bar((110 div 10)+i,(488 div 10)+j,(180 div 10)+i,(520 div 10)+j);

    bar((40 div 10)+i,(424 div 10)+j,(145 div 10)+i,(392 div 10)+j);
    bar((40 div 10)+i,(424 div 10)+j,(75 div 10)+i,(360 div 10)+j);
    bar((145 div 10)+i,(360 div 10)+j,(110 div 10)+i,(296 div 10)+j);
    bar((75 div 10)+i,(296 div 10)+j,(145 div 10)+i,(328 div 10)+j);


    bar((180 div 10)+i,(40 div 10)+j,(285 div 10)+i,(72 div 10)+j);

    bar((355 div 10)+i,(72 div 10)+j,(390 div 10)+i,(232 div 10)+j);
    bar((355 div 10)+i,(72 div 10)+j,(495 div 10)+i,(104 div 10)+j);

    bar((425 div 10)+i,(136 div 10)+j,(495 div 10)+i,(200 div 10)+j);

    bar((530 div 10)+i,(136 div 10)+j,(565 div 10)+i,(40 div 10)+j);

    bar((530 div 10)+i,(168 div 10)+j,(565 div 10)+i,(264 div 10)+j);
    bar((495 div 10)+i,(232 div 10)+j,(530 div 10)+i,(296 div 10)+j);

    bar((460 div 10)+i,(232 div 10)+j,(425 div 10)+i,(296 div 10)+j);
    bar((460 div 10)+i,(296 div 10)+j,(320 div 10)+i,(264 div 10)+j);

    bar((320 div 10)+i,(232 div 10)+j,(250 div 10)+i,(200 div 10)+j);
    bar((250 div 10)+i,(200 div 10)+j,(285 div 10)+i,(328 div 10)+j);

    bar((250 div 10)+i,(360 div 10)+j,(355 div 10)+i,(392 div 10)+j);
    bar((355 div 10)+i,(392 div 10)+j,(320 div 10)+i,(328 div 10)+j);

    bar((390 div 10)+i,(328 div 10)+j,(530 div 10)+i,(360 div 10)+j);

    bar((390 div 10)+i,(392 div 10)+j,(425 div 10)+i,(616 div 10)+j);
    bar((250 div 10)+i,(424 div 10)+j,(425 div 10)+i,(456 div 10)+j);
    bar((250 div 10)+i,(584 div 10)+j,(425 div 10)+i,(616 div 10)+j);
    bar((250 div 10)+i,(552 div 10)+j,(355 div 10)+i,(488 div 10)+j);

    bar((250 div 10)+i,(648 div 10)+j,(320 div 10)+i,(680 div 10)+j);
    bar((250 div 10)+i,(648 div 10)+j,(285 div 10)+i,(712 div 10)+j);

    bar((355 div 10)+i,(648 div 10)+j,(530 div 10)+i,(680 div 10)+j);
    bar((460 div 10)+i,(680 div 10)+j,(495 div 10)+i,(600 div 10)+j);//

    bar((495 div 10)+i,(712 div 10)+j,(460 div 10)+i,(776 div 10)+j);
    bar((495 div 10)+i,(712 div 10)+j,(390 div 10)+i,(744 div 10)+j);

    bar((495 div 10)+i,(808 div 10)+j,(425 div 10)+i,(840 div 10)+j);
    bar((425 div 10)+i,(808 div 10)+j,(460 div 10)+i,(872 div 10)+j);

    bar((425 div 10)+i,(904 div 10)+j,(530 div 10)+i,(936 div 10)+j);

    bar((355 div 10)+i,(904 div 10)+j,(390 div 10)+i,(1000 div 10)+j);

    bar((390 div 10)+i,(872 div 10)+j,(355 div 10)+i,(776 div 10)+j);
    bar((355 div 10)+i,(808 div 10)+j,(320 div 10)+i,(712 div 10)+j);
    bar((320 div 10)+i,(746 div 10)+j,(250 div 10)+i,(778 div 10)+j);

    bar((75 div 10)+i,(872 div 10)+j,(145 div 10)+i,(808 div 10)+j);

    bar((75 div 10)+i,(936 div 10)+j,(320 div 10)+i,(904 div 10)+j);
    bar((180 div 10)+i,(936 div 10)+j,(215 div 10)+i,(808 div 10)+j);

    bar((320 div 10)+i,(872 div 10)+j,(250 div 10)+i,(840 div 10)+j);
    bar((250 div 10)+i,(872 div 10)+j,(285 div 10)+i,(808 div 10)+j);

    bar((1205 div 10)+i,(72 div 10)+j,(1135 div 10)+i,(200 div 10)+j);
    bar((1205 div 10)+i,(104 div 10)+j,(960 div 10)+i,(168 div 10)+j);

    bar((1240 div 10)+i,(232 div 10)+j,(1065 div 10)+i,(264 div 10)+j);
    bar((1065 div 10)+i,(232 div 10)+j,(1100 div 10)+i,(456 div 10)+j);
    bar((1065 div 10)+i,(552 div 10)+j,(1100 div 10)+i,(776 div 10)+j);
    bar((1100 div 10)+i,(776 div 10)+j,(1240 div 10)+i,(744 div 10)+j);

    bar((1205 div 10)+i,(712 div 10)+j,(1135 div 10)+i,(680 div 10)+j);
    bar((1135 div 10)+i,(712 div 10)+j,(1170 div 10)+i,(648 div 10)+j);
    bar((1240 div 10)+i,(648 div 10)+j,(1205 div 10)+i,(584 div 10)+j);
    bar((1204 div 10)+i,(584 div 10)+j,(1135 div 10)+i,(616 div 10)+j);

    bar((1240 div 10)+i,(552 div 10)+j,(1205 div 10)+i,(456 div 10)+j);
    bar((1170 div 10)+i,(552 div 10)+j,(1135 div 10)+i,(456 div 10)+j);
    bar((1170 div 10)+i,(488 div 10)+j,(1100 div 10)+i,(520 div 10)+j);

    bar((1240 div 10)+i,(424 div 10)+j,(1135 div 10)+i,(392 div 10)+j);
    bar((1240 div 10)+i,(424 div 10)+j,(1205 div 10)+i,(360 div 10)+j);
    bar((1135 div 10)+i,(360 div 10)+j,(1170 div 10)+i,(296 div 10)+j);
    bar((1205 div 10)+i,(296 div 10)+j,(1125 div 10)+i,(328 div 10)+j);


    bar((1100 div 10)+i,(40 div 10)+j,(995 div 10)+i,(72 div 10)+j);

    bar((925 div 10)+i,(72 div 10)+j,(890 div 10)+i,(232 div 10)+j);
    bar((925 div 10)+i,(72 div 10)+j,(785 div 10)+i,(104 div 10)+j);

    bar((855 div 10)+i,(136 div 10)+j,(785 div 10)+i,(200 div 10)+j);

    bar((750 div 10)+i,(136 div 10)+j,(715 div 10)+i,(40 div 10)+j);

    bar((750 div 10)+i,(168 div 10)+j,(715 div 10)+i,(264 div 10)+j);
    bar((785 div 10)+i,(232 div 10)+j,(750 div 10)+i,(296 div 10)+j);

    bar((820 div 10)+i,(232 div 10)+j,(855 div 10)+i,(296 div 10)+j);
    bar((820 div 10)+i,(296 div 10)+j,(960 div 10)+i,(264 div 10)+j);

    bar((960 div 10)+i,(232 div 10)+j,(1030 div 10)+i,(200 div 10)+j);
    bar((1030 div 10)+i,(200 div 10)+j,(995 div 10)+i,(328 div 10)+j);

    bar((1030 div 10)+i,(360 div 10)+j,(925 div 10)+i,(392 div 10)+j);
    bar((925 div 10)+i,(392 div 10)+j,(960 div 10)+i,(328 div 10)+j);

    bar((890 div 10)+i,(328 div 10)+j,(750 div 10)+i,(360 div 10)+j);

    bar((890 div 10)+i,(392 div 10)+j,(855 div 10)+i,(616 div 10)+j);
    bar((1030 div 10)+i,(424 div 10)+j,(855 div 10)+i,(456 div 10)+j);
    bar((1030 div 10)+i,(584 div 10)+j,(855 div 10)+i,(616 div 10)+j);
    bar((1030 div 10)+i,(552 div 10)+j,(925 div 10)+i,(488 div 10)+j);

    bar((1030 div 10)+i,(648 div 10)+j,(960 div 10)+i,(680 div 10)+j);
    bar((1030 div 10)+i,(648 div 10)+j,(995 div 10)+i,(712 div 10)+j);

    bar((925 div 10)+i,(648 div 10)+j,(750 div 10)+i,(680 div 10)+j);
    bar((820 div 10)+i,(680 div 10)+j,(785 div 10)+i,(600 div 10)+j);//

    bar((785 div 10)+i,(712 div 10)+j,(820 div 10)+i,(776 div 10)+j);
    bar((785 div 10)+i,(712 div 10)+j,(890 div 10)+i,(744 div 10)+j);

    bar((785 div 10)+i,(808 div 10)+j,(855 div 10)+i,(840 div 10)+j);
    bar((855 div 10)+i,(808 div 10)+j,(820 div 10)+i,(872 div 10)+j);

    bar((750 div 10)+i,(904 div 10)+j,(855 div 10)+i,(936 div 10)+j);

    bar((890 div 10)+i,(904 div 10)+j,(925 div 10)+i,(1000 div 10)+j);

    bar((890 div 10)+i,(872 div 10)+j,(925 div 10)+i,(776 div 10)+j);
    bar((925 div 10)+i,(808 div 10)+j,(960 div 10)+i,(712 div 10)+j);
    bar((960 div 10)+i,(746 div 10)+j,(1030 div 10)+i,(778 div 10)+j);

    bar((1205 div 10)+i,(872 div 10)+j,(1135 div 10)+i,(808 div 10)+j);

    bar((1205 div 10)+i,(936 div 10)+j,(960 div 10)+i,(904 div 10)+j);
    bar((1100 div 10)+i,(936 div 10)+j,(1065 div 10)+i,(808 div 10)+j);

    bar((960 div 10)+i,(872 div 10)+j,(1030 div 10)+i,(840 div 10)+j);
    bar((1030 div 10)+i,(872 div 10)+j,(995 div 10)+i,(808 div 10)+j);

    bar((565 div 10)+i,(936 div 10)+j,(715 div 10)+i,(902 div 10)+j);
    bar((600 div 10)+i,(902 div 10)+j,(680 div 10)+i,(870 div 10)+j);

    bar((600 div 10)+i,(838 div 10)+j,(530 div 10)+i,(806 div 10)+j);
    bar((530 div 10)+i,(838 div 10)+j,(565 div 10)+i,(774 div 10)+j);

    bar((680 div 10)+i,(838 div 10)+j,(750 div 10)+i,(806 div 10)+j);
    bar((750 div 10)+i,(838 div 10)+j,(725 div 10)+i,(774 div 10)+j);

    bar((530 div 10)+i,(742 div 10)+j,(750 div 10)+i,(710 div 10)+j);
    bar((565 div 10)+i,(710 div 10)+j,(715 div 10)+i,(678 div 10)+j);

    bar((565 div 10)+i,(646 div 10)+j,(715 div 10)+i,(602 div 10)+j);


    bar((565 div 10)+i,(328 div 10)+j,(715 div 10)+i,(296 div 10)+j);
    bar((600 div 10)+i,(328 div 10)+j,(680 div 10)+i,(360 div 10)+j);

    bar((600 div 10)+i,(72 div 10)+j,(680 div 10)+i,(264 div 10)+j);

    bar((460 div 10)+i,(392 div 10)+j,(820 div 10)+i,(424 div 10)+j); //srodek
    bar((460 div 10)+i,(564 div 10)+j,(820 div 10)+i,(532 div 10)+j);
    bar((460 div 10)+i,(392 div 10)+j,(495 div 10)+i,(564 div 10)+j);
    bar((820 div 10)+i,(392 div 10)+j,(785 div 10)+i,(564 div 10)+j);
    setfillstyle(1,black);
    bar((565 div 10)+i,(392 div 10)+j,(715 div 10)+i,(424 div 10)+j);

    setcolor(black); //map5
    setfillstyle(1,6);
    i:=620;
    j:=600;

    bar((20 div 10)+i,(20 div 10)+j,(40 div 10)+i,(1000 div 10)+j);  //obramowanie
    bar((20 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(40 div 10)+j);
    bar((1240 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(1000 div 10)+j);
    bar((20 div 10)+i,(980 div 10)+j,(1260 div 10)+i,(1000 div 10)+j);

    bar((75 div 10)+i,(72 div 10)+j,(145 div 10)+i,(104 div 10)+j); //od lewego gornego rogu
    bar((75 div 10)+i,(72 div 10)+j,(110 div 10)+i,(200 div 10)+j);
    bar((75 div 10)+i,(136 div 10)+j,(145 div 10)+i,(200 div 10)+j);
    bar((40 div 10)+i,(232 div 10)+j,(285 div 10)+i,(264 div 10)+j);
    bar((40 div 10)+i,(232 div 10)+j,(75 div 10)+i,(296 div 10)+j);
    bar((110 div 10)+i,(296 div 10)+j,(145 div 10)+i,(328 div 10)+j);
    bar((75 div 10)+i,(328 div 10)+j,(110 div 10)+i,(388 div 10)+j);
    bar((75 div 10)+i,(328 div 10)+j,(215 div 10)+i,(356 div 10)+j);
    bar((180 div 10)+i,(356 div 10)+j,(145 div 10)+i,(388 div 10)+j);
    bar((320 div 10)+i,(356 div 10)+j,(425 div 10)+i,(328 div 10)+j);
    bar((390 div 10)+i,(356 div 10)+j,(425 div 10)+i,(420 div 10)+j);
    bar((320 div 10)+i,(420 div 10)+j,(425 div 10)+i,(388 div 10)+j);
    bar((320 div 10)+i,(420 div 10)+j,(355 div 10)+i,(452 div 10)+j);
    bar((250 div 10)+i,(356 div 10)+j,(285 div 10)+i,(452 div 10)+j);
    bar((250 div 10)+i,(388 div 10)+j,(215 div 10)+i,(452 div 10)+j);
    bar((250 div 10)+i,(420 div 10)+j,(75 div 10)+i,(452 div 10)+j);
    bar((250 div 10)+i,(232 div 10)+j,(285 div 10)+i,(328 div 10)+j);
    bar((180 div 10)+i,(264 div 10)+j,(285 div 10)+i,(296 div 10)+j);
    bar((390 div 10)+i,(264 div 10)+j,(530 div 10)+i,(232 div 10)+j);
    bar((495 div 10)+i,(264 div 10)+j,(460 div 10)+i,(360 div 10)+j);
    bar((320 div 10)+i,(264 div 10)+j,(530 div 10)+i,(296 div 10)+j);
    bar((530 div 10)+i,(328 div 10)+j,(565 div 10)+i,(360 div 10)+j);
    bar((565 div 10)+i,(264 div 10)+j,(635 div 10)+i,(296 div 10)+j);
    bar((600 div 10)+i,(264 div 10)+j,(635 div 10)+i,(360 div 10)+j);
    bar((675 div 10)+i,(264 div 10)+j,(745 div 10)+i,(296 div 10)+j);
    bar((675 div 10)+i,(264 div 10)+j,(710 div 10)+i,(360 div 10)+j);
    bar((75 div 10)+i,(136 div 10)+j,(215 div 10)+i,(168 div 10)+j);
    bar((180 div 10)+i,(40 div 10)+j,(215 div 10)+i,(104 div 10)+j);
    bar((180 div 10)+i,(136 div 10)+j,(215 div 10)+i,(200 div 10)+j);
    bar((180 div 10)+i,(168 div 10)+j,(390 div 10)+i,(200 div 10)+j);
    bar((320 div 10)+i,(168 div 10)+j,(355 div 10)+i,(232 div 10)+j);
    bar((250 div 10)+i,(72 div 10)+j,(320 div 10)+i,(136 div 10)+j);
    bar((250 div 10)+i,(72 div 10)+j,(460 div 10)+i,(104 div 10)+j);
   // bar(355,72,390,200);
    bar((425 div 10)+i,(200 div 10)+j,(600 div 10)+i,(168 div 10)+j);
    bar((565 div 10)+i,(200 div 10)+j,(600 div 10)+i,(232 div 10)+j);
    bar((565 div 10)+i,(200 div 10)+j,(775 div 10)+i,(232 div 10)+j);
    bar((748 div 10)+i,(200 div 10)+j,(713 div 10)+i,(136 div 10)+j);
    bar((495 div 10)+i,(40 div 10)+j,(600 div 10)+i,(72 div 10)+j);
    bar((425 div 10)+i,(104 div 10)+j,(680 div 10)+i,(136 div 10)+j);
    bar((645 div 10)+i,(72 div 10)+j,(680 div 10)+i,(168 div 10)+j);
    bar((715 div 10)+i,(40 div 10)+j,(750 div 10)+i,(104 div 10)+j);
    bar((715 div 10)+i,(72 div 10)+j,(855 div 10)+i,(104 div 10)+j);
    bar((890 div 10)+i,(72 div 10)+j,(1030 div 10)+i,(104 div 10)+j);
    bar((995 div 10)+i,(40 div 10)+j,(1030 div 10)+i,(104 div 10)+j);
    bar((1065 div 10)+i,(72 div 10)+j,(1205 div 10)+i,(104 div 10)+j);
    bar((1170 div 10)+i,(72 div 10)+j,(1205 div 10)+i,(168 div 10)+j);
    bar((1205 div 10)+i,(136 div 10)+j,(1100 div 10)+i,(168 div 10)+j);
    bar((1100 div 10)+i,(136 div 10)+j,(1135 div 10)+i,(232 div 10)+j);
    bar((1100 div 10)+i,(200 div 10)+j,(1065 div 10)+i,(232 div 10)+j);
    bar((1065 div 10)+i,(136 div 10)+j,(785 div 10)+i,(168 div 10)+j);
    bar((1030 div 10)+i,(136 div 10)+j,(995 div 10)+i,(232 div 10)+j);
    bar((1030 div 10)+i,(200 div 10)+j,(925 div 10)+i,(232 div 10)+j);
    bar((925 div 10)+i,(232 div 10)+j,(960 div 10)+i,(296 div 10)+j);
    bar((995 div 10)+i,(264 div 10)+j,(1135 div 10)+i,(296 div 10)+j);
    bar((1170 div 10)+i,(200 div 10)+j,(1205 div 10)+i,(296 div 10)+j);
    bar((1170 div 10)+i,(200 div 10)+j,(1240 div 10)+i,(232 div 10)+j);
    bar((1100 div 10)+i,(264 div 10)+j,(1135 div 10)+i,(392 div 10)+j);
    bar((1135 div 10)+i,(360 div 10)+j,(1065 div 10)+i,(328 div 10)+j);
    bar((1170 div 10)+i,(360 div 10)+j,(1240 div 10)+i,(328 div 10)+j);
    bar((1170 div 10)+i,(392 div 10)+j,(1205 div 10)+i,(520 div 10)+j);
    bar((1170 div 10)+i,(488 div 10)+j,(1240 div 10)+i,(520 div 10)+j);
    bar((1240 div 10)+i,(552 div 10)+j,(1065 div 10)+i,(584 div 10)+j);
    bar((1205 div 10)+i,(552 div 10)+j,(1170 div 10)+i,(648 div 10)+j);
    bar((1170 div 10)+i,(616 div 10)+j,(1065 div 10)+i,(648 div 10)+j);
    bar((1205 div 10)+i,(948 div 10)+j,(1100 div 10)+i,(916 div 10)+j);
    bar((1205 div 10)+i,(948 div 10)+j,(1170 div 10)+i,(852 div 10)+j);
    bar((1135 div 10)+i,(916 div 10)+j,(1065 div 10)+i,(884 div 10)+j);
    bar((1135 div 10)+i,(948 div 10)+j,(1100 div 10)+i,(756 div 10)+j);
    bar((1135 div 10)+i,(788 div 10)+j,(995 div 10)+i,(756 div 10)+j);
    bar((1240 div 10)+i,(820 div 10)+j,(1170 div 10)+i,(788 div 10)+j);
    bar((1205 div 10)+i,(820 div 10)+j,(1170 div 10)+i,(692 div 10)+j);
    bar((1205 div 10)+i,(724 div 10)+j,(1100 div 10)+i,(692 div 10)+j);
    bar((1065 div 10)+i,(980 div 10)+j,(890 div 10)+i,(948 div 10)+j);
    bar((1030 div 10)+i,(948 div 10)+j,(925 div 10)+i,(916 div 10)+j);
    bar((1030 div 10)+i,(948 div 10)+j,(995 div 10)+i,(820 div 10)+j);
    bar((995 div 10)+i,(852 div 10)+j,(1065 div 10)+i,(820 div 10)+j);
    bar((855 div 10)+i,(948 div 10)+j,(785 div 10)+i,(916 div 10)+j);
    bar((890 div 10)+i,(916 div 10)+j,(820 div 10)+i,(884 div 10)+j);
    bar((890 div 10)+i,(916 div 10)+j,(855 div 10)+i,(820 div 10)+j);
    bar((890 div 10)+i,(852 div 10)+j,(960 div 10)+i,(884 div 10)+j);
    bar((960 div 10)+i,(820 div 10)+j,(925 div 10)+i,(756 div 10)+j);
    bar((960 div 10)+i,(788 div 10)+j,(855 div 10)+i,(756 div 10)+j);
    bar((890 div 10)+i,(788 div 10)+j,(855 div 10)+i,(692 div 10)+j);
    bar((890 div 10)+i,(724 div 10)+j,(785 div 10)+i,(692 div 10)+j);
    bar((820 div 10)+i,(724 div 10)+j,(785 div 10)+i,(596 div 10)+j);
    bar((855 div 10)+i,(564 div 10)+j,(890 div 10)+i,(660 div 10)+j); //
    bar((855 div 10)+i,(660 div 10)+j,(1030 div 10)+i,(628 div 10)+j);
    bar((960 div 10)+i,(660 div 10)+j,(925 div 10)+i,(724 div 10)+j);
    bar((960 div 10)+i,(724 div 10)+j,(1065 div 10)+i,(692 div 10)+j);
    bar((855 div 10)+i,(532 div 10)+j,(960 div 10)+i,(500 div 10)+j);   //
    bar((925 div 10)+i,(532 div 10)+j,(960 div 10)+i,(596 div 10)+j);
    bar((925 div 10)+i,(596 div 10)+j,(1030 div 10)+i,(564 div 10)+j);
    bar((995 div 10)+i,(564 div 10)+j,(1030 div 10)+i,(500 div 10)+j);
    bar((1030 div 10)+i,(500 div 10)+j,(1135 div 10)+i,(532 div 10)+j);
    bar((1100 div 10)+i,(500 div 10)+j,(1135 div 10)+i,(436 div 10)+j);
    bar((1135 div 10)+i,(436 div 10)+j,(1030 div 10)+i,(468 div 10)+j);
    bar((1030 div 10)+i,(436 div 10)+j,(1065 div 10)+i,(404 div 10)+j);
    bar((995 div 10)+i,(436 div 10)+j,(960 div 10)+i,(404 div 10)+j);
    bar((995 div 10)+i,(436 div 10)+j,(855 div 10)+i,(468 div 10)+j);
    bar((855 div 10)+i,(394 div 10)+j,(925 div 10)+i,(362 div 10)+j);
    bar((820 div 10)+i,(362 div 10)+j,(1030 div 10)+i,(330 div 10)+j);
    bar((785 div 10)+i,(298 div 10)+j,(890 div 10)+i,(266 div 10)+j);
    bar((855 div 10)+i,(330 div 10)+j,(890 div 10)+i,(202 div 10)+j);
    bar((890 div 10)+i,(202 div 10)+j,(820 div 10)+i,(234 div 10)+j);
    bar((785 div 10)+i,(362 div 10)+j,(750 div 10)+i,(330 div 10)+j);
    bar((75 div 10)+i,(948 div 10)+j,(110 div 10)+i,(884 div 10)+j);  //dol
    bar((40 div 10)+i,(852 div 10)+j,(110 div 10)+i,(820 div 10)+j);
    bar((75 div 10)+i,(820 div 10)+j,(110 div 10)+i,(692 div 10)+j);
    bar((75 div 10)+i,(692 div 10)+j,(180 div 10)+i,(724 div 10)+j);
    bar((75 div 10)+i,(628 div 10)+j,(180 div 10)+i,(660 div 10)+j);
    bar((145 div 10)+i,(692 div 10)+j,(180 div 10)+i,(628 div 10)+j);
    bar((215 div 10)+i,(692 div 10)+j,(250 div 10)+i,(660 div 10)+j);
    bar((215 div 10)+i,(692 div 10)+j,(320 div 10)+i,(724 div 10)+j);
    bar((285 div 10)+i,(724 div 10)+j,(320 div 10)+i,(596 div 10)+j);
    bar((215 div 10)+i,(596 div 10)+j,(320 div 10)+i,(628 div 10)+j);
    bar((320 div 10)+i,(596 div 10)+j,(355 div 10)+i,(660 div 10)+j);
    bar((355 div 10)+i,(692 div 10)+j,(425 div 10)+i,(724 div 10)+j);
    bar((425 div 10)+i,(596 div 10)+j,(460 div 10)+i,(628 div 10)+j);
    bar((425 div 10)+i,(724 div 10)+j,(390 div 10)+i,(532 div 10)+j);
    bar((425 div 10)+i,(468 div 10)+j,(390 div 10)+i,(500 div 10)+j);
    bar((425 div 10)+i,(564 div 10)+j,(320 div 10)+i,(532 div 10)+j);
    bar((355 div 10)+i,(564 div 10)+j,(320 div 10)+i,(500 div 10)+j);
    bar((355 div 10)+i,(532 div 10)+j,(215 div 10)+i,(500 div 10)+j);
    bar((250 div 10)+i,(500 div 10)+j,(215 div 10)+i,(564 div 10)+j);
    bar((40 div 10)+i,(500 div 10)+j,(180 div 10)+i,(532 div 10)+j);
    bar((75 div 10)+i,(500 div 10)+j,(110 div 10)+i,(596 div 10)+j);
    bar((75 div 10)+i,(596 div 10)+j,(180 div 10)+i,(564 div 10)+j);
    bar((75 div 10)+i,(948 div 10)+j,(180 div 10)+i,(916 div 10)+j);
    bar((145 div 10)+i,(948 div 10)+j,(180 div 10)+i,(820 div 10)+j);
    bar((285 div 10)+i,(852 div 10)+j,(250 div 10)+i,(756 div 10)+j);
    bar((285 div 10)+i,(756 div 10)+j,(145 div 10)+i,(788 div 10)+j);
    bar((145 div 10)+i,(852 div 10)+j,(320 div 10)+i,(820 div 10)+j);
    bar((215 div 10)+i,(884 div 10)+j,(250 div 10)+i,(980 div 10)+j);
    bar((215 div 10)+i,(948 div 10)+j,(355 div 10)+i,(916 div 10)+j);
    bar((285 div 10)+i,(820 div 10)+j,(320 div 10)+i,(884 div 10)+j);
    bar((285 div 10)+i,(884 div 10)+j,(390 div 10)+i,(852 div 10)+j);
    bar((355 div 10)+i,(884 div 10)+j,(390 div 10)+i,(756 div 10)+j);
    bar((320 div 10)+i,(788 div 10)+j,(460 div 10)+i,(756 div 10)+j);
    bar((425 div 10)+i,(756 div 10)+j,(460 div 10)+i,(948 div 10)+j);
    bar((425 div 10)+i,(948 div 10)+j,(390 div 10)+i,(916 div 10)+j);
    bar((425 div 10)+i,(884 div 10)+j,(530 div 10)+i,(852 div 10)+j);
    bar((495 div 10)+i,(884 div 10)+j,(530 div 10)+i,(820 div 10)+j);
    bar((705 div 10)+i,(980 div 10)+j,(635 div 10)+i,(948 div 10)+j);
    bar((495 div 10)+i,(948 div 10)+j,(740 div 10)+i,(916 div 10)+j);
    bar((565 div 10)+i,(916 div 10)+j,(635 div 10)+i,(884 div 10)+j);
    bar((600 div 10)+i,(884 div 10)+j,(705 div 10)+i,(852 div 10)+j);
    bar((670 div 10)+i,(852 div 10)+j,(810 div 10)+i,(820 div 10)+j);
    bar((775 div 10)+i,(852 div 10)+j,(740 div 10)+i,(884 div 10)+j);
    bar((495 div 10)+i,(852 div 10)+j,(565 div 10)+i,(820 div 10)+j);
    bar((495 div 10)+i,(788 div 10)+j,(565 div 10)+i,(756 div 10)+j);
    bar((495 div 10)+i,(788 div 10)+j,(530 div 10)+i,(596 div 10)+j);
    bar((495 div 10)+i,(660 div 10)+j,(460 div 10)+i,(724 div 10)+j);
    bar((670 div 10)+i,(660 div 10)+j,(635 div 10)+i,(596 div 10)+j);
    bar((565 div 10)+i,(596 div 10)+j,(600 div 10)+i,(724 div 10)+j);
    bar((705 div 10)+i,(596 div 10)+j,(740 div 10)+i,(724 div 10)+j);
    bar((565 div 10)+i,(724 div 10)+j,(740 div 10)+i,(692 div 10)+j);
    bar((600 div 10)+i,(724 div 10)+j,(635 div 10)+i,(820 div 10)+j);
    bar((600 div 10)+i,(788 div 10)+j,(810 div 10)+i,(756 div 10)+j);

    bar((460 div 10)+i,(392 div 10)+j,(820 div 10)+i,(424 div 10)+j); //srodek
    bar((460 div 10)+i,(564 div 10)+j,(820 div 10)+i,(532 div 10)+j);
    bar((460 div 10)+i,(392 div 10)+j,(495 div 10)+i,(564 div 10)+j);
    bar((820 div 10)+i,(392 div 10)+j,(785 div 10)+i,(564 div 10)+j);
    setfillstyle(1,black);
    bar((565 div 10)+i,(392 div 10)+j,(715 div 10)+i,(424 div 10)+j);

    setcolor(black); //map6
    setfillstyle(1,random(5-1+1)+1);
    i:=1000;
    j:=600;

    bar((20 div 10)+i,(20 div 10)+j,(40 div 10)+i,(1000 div 10)+j);  //obramowanie
    bar((20 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(40 div 10)+j);
    bar((1240 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(1000 div 10)+j);
    bar((20 div 10)+i,(980 div 10)+j,(1260 div 10)+i,(1000 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((40 div 10)+i,(75 div 10)+j,(110 div 10)+i,(110 div 10)+j);
    bar((75 div 10)+i,(75 div 10)+j,(110 div 10)+i,(180 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((145 div 10)+i,(75 div 10)+j,(250 div 10)+i,(110 div 10)+j);
    bar((180 div 10)+i,(75 div 10)+j,(215 div 10)+i,(180 div 10)+j);
    bar((215 div 10)+i,(75 div 10)+j,(250 div 10)+i,(145 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((285 div 10)+i,(75 div 10)+j,(355 div 10)+i,(110 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((425 div 10)+i,(40 div 10)+j,(495 div 10)+i,(75 div 10)+j);
    bar((460 div 10)+i,(40 div 10)+j,(495 div 10)+i,(180 div 10)+j);
    bar((460 div 10)+i,(145 div 10)+j,(530 div 10)+i,(180 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((565 div 10)+i,(40 div 10)+j,(705 div 10)+i,(75 div 10)+j);
    bar((565 div 10)+i,(110 div 10)+j,(600 div 10)+i,(180 div 10)+j);
    bar((565 div 10)+i,(145 div 10)+j,(635 div 10)+i,(180 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((565 div 10)+i,(215 div 10)+j,(600 div 10)+i,(285 div 10)+j);
    bar((530 div 10)+i,(250 div 10)+j,(670 div 10)+i,(285 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((495 div 10)+i,(320 div 10)+j,(530 div 10)+i,(390 div 10)+j);
    bar((495 div 10)+i,(320 div 10)+j,(600 div 10)+i,(355 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((530 div 10)+i,(425 div 10)+j,(425 div 10)+i,(460 div 10)+j);
    bar((425 div 10)+i,(460 div 10)+j,(460 div 10)+i,(390 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((425 div 10)+i,(355 div 10)+j,(460 div 10)+i,(250 div 10)+j);
    bar((495 div 10)+i,(285 div 10)+j,(390 div 10)+i,(250 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((390 div 10)+i,(320 div 10)+j,(320 div 10)+i,(390 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((390 div 10)+i,(425 div 10)+j,(355 div 10)+i,(495 div 10)+j);
    bar((355 div 10)+i,(460 div 10)+j,(320 div 10)+i,(565 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((285 div 10)+i,(530 div 10)+j,(180 div 10)+i,(495 div 10)+j);
    bar((215 div 10)+i,(565 div 10)+j,(250 div 10)+i,(460 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((180 div 10)+i,(460 div 10)+j,(75 div 10)+i,(425 div 10)+j);
    bar((110 div 10)+i,(425 div 10)+j,(145 div 10)+i,(495 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((180 div 10)+i,(355 div 10)+j,(250 div 10)+i,(390 div 10)+j);
    bar((215 div 10)+i,(390 div 10)+j,(285 div 10)+i,(425 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((75 div 10)+i,(390 div 10)+j,(110 div 10)+i,(285 div 10)+j);
    bar((75 div 10)+i,(285 div 10)+j,(145 div 10)+i,(320 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((180 div 10)+i,(285 div 10)+j,(285 div 10)+i,(320 div 10)+j);
    bar((285 div 10)+i,(285 div 10)+j,(250 div 10)+i,(250 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((75 div 10)+i,(250 div 10)+j,(215 div 10)+i,(215 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((250 div 10)+i,(215 div 10)+j,(425 div 10)+i,(180 div 10)+j);
    bar((285 div 10)+i,(215 div 10)+j,(320 div 10)+i,(145 div 10)+j);
    bar((390 div 10)+i,(215 div 10)+j,(425 div 10)+i,(110 div 10)+j);
    bar((320 div 10)+i,(215 div 10)+j,(355 div 10)+i,(285 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((75 div 10)+i,(945 div 10)+j,(110 div 10)+i,(840 div 10)+j);
    bar((75 div 10)+i,(875 div 10)+j,(145 div 10)+i,(910 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((145 div 10)+i,(980 div 10)+j,(250 div 10)+i,(945 div 10)+j);
    bar((215 div 10)+i,(980 div 10)+j,(180 div 10)+i,(875 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((285 div 10)+i,(980 div 10)+j,(425 div 10)+i,(945 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((495 div 10)+i,(945 div 10)+j,(565 div 10)+i,(910 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((425 div 10)+i,(910 div 10)+j,(460 div 10)+i,(805 div 10)+j);
    bar((425 div 10)+i,(875 div 10)+j,(635 div 10)+i,(840 div 10)+j);
    bar((600 div 10)+i,(910 div 10)+j,(635 div 10)+i,(805 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((495 div 10)+i,(805 div 10)+j,(565 div 10)+i,(770 div 10)+j);
    bar((495 div 10)+i,(805 div 10)+j,(530 div 10)+i,(700 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((390 div 10)+i,(665 div 10)+j,(425 div 10)+i,(525 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((425 div 10)+i,(700 div 10)+j,(460 div 10)+i,(770 div 10)+j);
    bar((425 div 10)+i,(700 div 10)+j,(390 div 10)+i,(735 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((390 div 10)+i,(770 div 10)+j,(355 div 10)+i,(910 div 10)+j);
    bar((390 div 10)+i,(770 div 10)+j,(285 div 10)+i,(805 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((320 div 10)+i,(910 div 10)+j,(250 div 10)+i,(840 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((250 div 10)+i,(770 div 10)+j,(180 div 10)+i,(805 div 10)+j);
    bar((145 div 10)+i,(805 div 10)+j,(215 div 10)+i,(840 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((40 div 10)+i,(805 div 10)+j,(75 div 10)+i,(630 div 10)+j);
    bar((40 div 10)+i,(630 div 10)+j,(110 div 10)+i,(665 div 10)+j);
    bar((40 div 10)+i,(700 div 10)+j,(145 div 10)+i,(735 div 10)+j);
    bar((110 div 10)+i,(700 div 10)+j,(145 div 10)+i,(770 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((75 div 10)+i,(595 div 10)+j,(110 div 10)+i,(525 div 10)+j);
    bar((75 div 10)+i,(525 div 10)+j,(145 div 10)+i,(560 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((180 div 10)+i,(735 div 10)+j,(215 div 10)+i,(630 div 10)+j);
    bar((145 div 10)+i,(665 div 10)+j,(180 div 10)+i,(595 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((250 div 10)+i,(595 div 10)+j,(320 div 10)+i,(630 div 10)+j);
    bar((250 div 10)+i,(595 div 10)+j,(285 div 10)+i,(665 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((250 div 10)+i,(700 div 10)+j,(355 div 10)+i,(735 div 10)+j);
    bar((320 div 10)+i,(735 div 10)+j,(355 div 10)+i,(665 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1205 div 10)+i,(945 div 10)+j,(1170 div 10)+i,(805 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1135 div 10)+i,(915 div 10)+j,(1065 div 10)+i,(880 div 10)+j);
    bar((1100 div 10)+i,(880 div 10)+j,(1065 div 10)+i,(980 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1135 div 10)+i,(845 div 10)+j,(1030 div 10)+i,(810 div 10)+j);
    bar((1065 div 10)+i,(845 div 10)+j,(1100 div 10)+i,(775 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1030 div 10)+i,(945 div 10)+j,(995 div 10)+i,(875 div 10)+j);
    bar((995 div 10)+i,(910 div 10)+j,(960 div 10)+i,(805 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((925 div 10)+i,(945 div 10)+j,(855 div 10)+i,(910 div 10)+j);
    bar((855 div 10)+i,(945 div 10)+j,(890 div 10)+i,(805 div 10)+j);
    bar((925 div 10)+i,(840 div 10)+j,(820 div 10)+i,(805 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((820 div 10)+i,(945 div 10)+j,(785 div 10)+i,(875 div 10)+j);
    bar((820 div 10)+i,(910 div 10)+j,(680 div 10)+i,(945 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((680 div 10)+i,(840 div 10)+j,(785 div 10)+i,(805 div 10)+j);
    bar((715 div 10)+i,(875 div 10)+j,(750 div 10)+i,(770 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((680 div 10)+i,(770 div 10)+j,(610 div 10)+i,(735 div 10)+j);
    bar((645 div 10)+i,(735 div 10)+j,(575 div 10)+i,(700 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((715 div 10)+i,(735 div 10)+j,(820 div 10)+i,(700 div 10)+j);
    bar((785 div 10)+i,(770 div 10)+j,(890 div 10)+i,(735 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((925 div 10)+i,(770 div 10)+j,(995 div 10)+i,(735 div 10)+j);
    bar((960 div 10)+i,(770 div 10)+j,(995 div 10)+i,(700 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1030 div 10)+i,(700 div 10)+j,(1170 div 10)+i,(735 div 10)+j);
    bar((1135 div 10)+i,(700 div 10)+j,(1170 div 10)+i,(770 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1205 div 10)+i,(700 div 10)+j,(1240 div 10)+i,(630 div 10)+j);
    bar((1205 div 10)+i,(665 div 10)+j,(1170 div 10)+i,(595 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1135 div 10)+i,(665 div 10)+j,(960 div 10)+i,(630 div 10)+j);
    bar((1030 div 10)+i,(665 div 10)+j,(1065 div 10)+i,(560 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((855 div 10)+i,(630 div 10)+j,(925 div 10)+i,(700 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((855 div 10)+i,(595 div 10)+j,(995 div 10)+i,(560 div 10)+j);
    bar((960 div 10)+i,(595 div 10)+j,(925 div 10)+i,(525 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1205 div 10)+i,(75 div 10)+j,(1065 div 10)+i,(110 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1205 div 10)+i,(145 div 10)+j,(1170 div 10)+i,(215 div 10)+j);
    bar((1205 div 10)+i,(215 div 10)+j,(1135 div 10)+i,(180 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1100 div 10)+i,(215 div 10)+j,(1030 div 10)+i,(145 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1135 div 10)+i,(285 div 10)+j,(1030 div 10)+i,(320 div 10)+j);
    bar((1065 div 10)+i,(250 div 10)+j,(1100 div 10)+i,(390 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1240 div 10)+i,(285 div 10)+j,(1205 div 10)+i,(320 div 10)+j);
    bar((1205 div 10)+i,(250 div 10)+j,(1170 div 10)+i,(355 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1205 div 10)+i,(390 div 10)+j,(1170 div 10)+i,(460 div 10)+j);
    bar((1205 div 10)+i,(460 div 10)+j,(1100 div 10)+i,(425 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1170 div 10)+i,(495 div 10)+j,(1065 div 10)+i,(530 div 10)+j);
    bar((1100 div 10)+i,(530 div 10)+j,(1205 div 10)+i,(565 div 10)+j);
    bar((1100 div 10)+i,(565 div 10)+j,(1135 div 10)+i,(600 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1030 div 10)+i,(530 div 10)+j,(995 div 10)+i,(425 div 10)+j);
    bar((1065 div 10)+i,(425 div 10)+j,(960 div 10)+i,(460 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((925 div 10)+i,(460 div 10)+j,(855 div 10)+i,(495 div 10)+j);
    bar((855 div 10)+i,(460 div 10)+j,(890 div 10)+i,(530 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((925 div 10)+i,(425 div 10)+j,(890 div 10)+i,(355 div 10)+j);
    bar((890 div 10)+i,(355 div 10)+j,(995 div 10)+i,(390 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((995 div 10)+i,(250 div 10)+j,(925 div 10)+i,(285 div 10)+j);
    bar((960 div 10)+i,(285 div 10)+j,(855 div 10)+i,(320 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((995 div 10)+i,(215 div 10)+j,(960 div 10)+i,(75 div 10)+j);
    bar((1030 div 10)+i,(75 div 10)+j,(925 div 10)+i,(110 div 10)+j);
    bar((925 div 10)+i,(110 div 10)+j,(960 div 10)+i,(145 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((890 div 10)+i,(75 div 10)+j,(750 div 10)+i,(110 div 10)+j);
    bar((855 div 10)+i,(75 div 10)+j,(820 div 10)+i,(145 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((785 div 10)+i,(145 div 10)+j,(680 div 10)+i,(180 div 10)+j);
    bar((680 div 10)+i,(215 div 10)+j,(715 div 10)+i,(110 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((820 div 10)+i,(180 div 10)+j,(925 div 10)+i,(215 div 10)+j);
    bar((890 div 10)+i,(215 div 10)+j,(855 div 10)+i,(250 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((820 div 10)+i,(250 div 10)+j,(715 div 10)+i,(285 div 10)+j);
    bar((785 div 10)+i,(250 div 10)+j,(750 div 10)+i,(215 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((680 div 10)+i,(420 div 10)+j,(575 div 10)+i,(385 div 10)+j);
    bar((645 div 10)+i,(420 div 10)+j,(610 div 10)+i,(455 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((750 div 10)+i,(320 div 10)+j,(645 div 10)+i,(355 div 10)+j);
    bar((750 div 10)+i,(320 div 10)+j,(715 div 10)+i,(455 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((785 div 10)+i,(455 div 10)+j,(820 div 10)+i,(385 div 10)+j);
    bar((820 div 10)+i,(420 div 10)+j,(855 div 10)+i,(350 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((460 div 10)+i,(490 div 10)+j,(820 div 10)+i,(665 div 10)+j); //srodek
    setfillstyle(1,black);
    bar((565 div 10)+i,(490 div 10)+j,(715 div 10)+i,(525 div 10)+j);
    bar((495 div 10)+i,(522 div 10)+j,(785 div 10)+i,(633 div 10)+j);

   setcolor(15);
   settextstyle(TriplexFont,HorizDir,5);
   outtextxy(250,420,'1');
   outtextxy(670,420,'2');
   outtextxy(1050,420,'3');
   outtextxy(250,720,'4');
   outtextxy(670,720,'5');
   outtextxy(1050,720,'6');
  end;

 function duch(vxd,vyd:integer):integer;
begin
  setcolor(11);                                    //duszek 1
   setfillstyle(1,11);
   bar(540+vxd,510+vyd,610+vxd,525+vyd);
   bar(545+vxd,495+vyd,605+vxd,510+vyd);
   bar(550+vxd,485+vyd,600+vxd,495+vyd);
   bar(555+vxd,480+vyd,595+vxd,490+vyd);
   bar(565+vxd,475+vyd,585+vxd,480+vyd);
   bar(540+vxd,525+vyd,550+vxd,535+vyd);
   bar(555+vxd,525+vyd,570+vxd,535+vyd);
   bar(580+vxd,525+vyd,595+vxd,535+vyd);
   bar(600+vxd,525+vyd,610+vxd,535+vyd);
   setfillstyle(1,black);
   bar(545+vxd,530+vyd,560+vxd,535+vyd);
   bar(595+vxd,530+vyd,605+vxd,535+vyd);


   setfillstyle(1,white);                        //OCZY
   bar(555+vxd,490+vyd,565+vxd,515+vyd);
   bar(550+vxd,495+vyd,570+vxd,510+vyd);
   bar(585+vxd,490+vyd,595+vxd,515+vyd);
   bar(580+vxd,495+vyd,600+vxd,510+vyd);
   setfillstyle(1,black);
   bar(555+vxd,500+vyd,565+vxd,510+vyd);
   bar(585+vxd,500+vyd,595+vxd,510+vyd);
 end;

function kursormap(xk,yk:word):word;
 begin
   setcolor(kolorop);             //pacman d     gora
                setfillstyle(1,kolorop);
                pieslice(210+xk,140+yk,35,320,30);
                setcolor(black);
                setfillstyle(1,black);
                fillellipse(215+xk,120+yk,5,5);
                pieslice(210+xk,140+yk,320,360,30);
                pieslice(210+xk,140+yk,0,35,30);
                delay(400);
                setfillstyle(1,kolorop);
                pieslice(210+xk,140+yk,0,360,30);
                setfillstyle(1,black);
                fillellipse(215+xk,120+yk,5,5);
                delay(300);
                fillellipse(210+xk,140+yk,30,30);
 end;

function kursormenutwarz(yk,xk:word):word;
  begin
                setcolor(kolorop);             //pacman d     gora
                setfillstyle(1,kolorop);
                pieslice(140+xk,270+yk,35,320,30);
                setcolor(black);;
                setfillstyle(1,black);
                fillellipse(145+xk,250+yk,5,5);
                pieslice(140+xk,270+yk,320,360,30);
                pieslice(140+xk,270+yk,0,35,30);

  end;

function kursormenuzamkniety(yk,xk:word):word;
  begin
     setfillstyle(1,kolorop);
     pieslice(140+xk,270+yk,0,360,30);
     setcolor(black);
     setfillstyle(1,black);
     fillellipse(145+xk,250+yk,5,5);
  end;


function kursormenuzmaz(yk,xk :word):word;
  begin
                setfillstyle(1,black);
                fillellipse(145+xk,250+yk,5,5);
                fillellipse(140+xk,270+yk,30,30);

  end;


function kursortryb(yk:word):word;
 begin
   setcolor(kolorop);             //pacman d     gora
                setfillstyle(1,kolorop);
                pieslice(360,360+yk,35,320,30);
                setcolor(black);
                setfillstyle(1,black);
                fillellipse(365,340+yk,5,5);
                pieslice(360,360+yk,320,360,30);
                pieslice(360,360+yk,0,35,30);
                delay(400);
                setfillstyle(1,kolorop);
                pieslice(360,360+yk,0,360,30);
                setfillstyle(1,black);
                fillellipse(365,340+yk,5,5);
                delay(300);
                fillellipse(360,360+yk,30,30);
 end;

function del(z:boolean):boolean;

begin
  if z then
  begin
    gettime(hb1,mb1,sb1,ssb1);
    z:=false;
  end;

  gettime(hb2,mb2,sb2,ssb2);

  if ((hb2*360000)+(mb2*6000)+(sb2*100)+ssb2)
  -((hb1*360000)+(mb1*6000)+(sb1*100)+ssb1)>50 then
  begin
    del:=true;
    z:=true;
  end
  else del:=false;
  adel:=z;

end;

procedure zerowanie;

var
  esc: boolean;
begin
esc:=false;
repeat
  n:=readkey;
  if ord(n)=48 then for j:=1 to 4 do
   begin
    writeln('km=',km);
    bestt[kt,km,j]:='0';
    cojarobie[kt,km,j]:=0;
   end;

  if ord(n)<>27 then esc:=false
     else esc:=true;
until esc;

end;


//***************************************************************************\\

begin
  clrscr;
  randomize;


    //notatniki
  assign(hero,'C:\Wyniki\hero.txt');
  reset(hero);
  for j:=1 to 2 do
    begin
     for i:=1 to 6 do
      begin
        readln(hero,uzytkownikb[j,i]);
      end;
    end;
  close(hero);

assign(sur, 'C:\Wyniki\wyniksur.txt');
    reset(sur);
      i:=1;
      j:=1;
       while not eof(sur) do
         begin
          readln(sur,cojarobie[1,j,i]);
          inc(i);
          if i=4 then
          begin
          inc(j);
          i:=1;
          end;
         end;
    close(sur);
   for j:=1 to 6 do
     begin
      for i:=1 to 4 do
       begin
         str(cojarobie[1,j,i],bestt[1,j,i]);
         if i=4 then
         begin
           bestt[1,j,i+1]:=uzytkownikb[1,j];
         end;
       end;
     end;

   assign(adv, 'C:\Wyniki\wynikadv.txt');
    reset(adv);
      i:=1;
      j:=1;
       while not eof(adv) do
         begin
          readln(adv,cojarobie[2,j,i]);
          inc(i);
          if i=6 then
          begin
          inc(j);
          i:=1;
          end;
         end;
    close(adv);

for j:=1 to 6 do
     begin
      for i:=1 to 4 do str(cojarobie[2,j,i],bestt[2,j,i]);
     end;

    assign(sett, 'C:\wyniki\ustawienia.txt');
    reset(sett);

        muzyka:=1;
        diflvl:=1;
        speedd:=1;
        kolorop:=14;

       i:=1;
       while not eof(sett) do
         begin
          readln(sett,opcje[i]);
          inc(i);
         end;
       if i>2 then
       begin
        muzyka:=opcje[1];
        diflvl:=opcje[2];
        speedd:=opcje[3];
        kolorop:=opcje[4];
       end;
       close(sett);





        detectgraph(ster, tryb);
        initgraph(ster, tryb, 'c:\tp\bgi');

      kolor[1]:=random(5-1+1)+1;
      setcolor(kolor[1]);
      settextstyle(TriplexFont,HorizDir,5);
      outtextxy(300,100,'S&P PACMAN');
      kolor[2]:=random(10-1+1)+1;
      while kolor[2]=kolor[1] do
       kolor[2]:=random(10-1+1)+1;
      setcolor(kolor[2]);
      settextstyle(TriplexFont,HorizDir,2);
      outtextxy(50,200,'Witaj przed rozpoczeciem gry wlacz opcje ukrywania paska narzedzi');
      outtextxy(50,250,'Jak to zrobic:');
      outtextxy(50,300,'1. Nacisnij prawym przyciskiem myszy na pasku narzedzi;');
      outtextxy(50,350,'2. Wybierz opcje wlasciwosci;');
      outtextxy(50,400,'3. Zaznacz okienko "Wlacz autoukrywanie paska zadan";');
      outtextxy(50,450,'4. Zastosuj.');
      kolor[3]:=random(10-1+1)+1;
      while kolor[3]=kolor[2] do
      kolor[3]:=random(10-1+1)+1;
      setcolor(kolor[3]);
      settextstyle(TriplexFont,HorizDir,5);
      outtextxy(100,500,'Podaj nazwe uzytkownika:');
      i:=0;
      j:=1;
      x:=2;
      kolor[0]:=10;
      repeat
       kolor[x]:=random(5-1+1)+1;
       while kolor[x]=kolor[x-1] do
         kolor[x]:=random(5-1+1)+1;
       setcolor(kolor[x]);
       przyciskekran:=readkey;
       case przyciskekran of
       chr(8) : begin
                 i:=i-50;
                 setcolor(black);
                 bar(100+i,600,150+i,800);
                 dec(j);
                 end;
               else
               begin
                 if ord(uzytkownik[0])<j then
                    uzytkownik[0]:=chr(ord(uzytkownik[0])+1);
                 uzytkownik[j]:=przyciskekran;
                 outtextxy(100+i,600,przyciskekran);
                 i:=i+50;
                 inc(j);
                 if x=3 then x:=x-2;
                 kolor[0]:=kolor[x];
               end;
        end;
      until przyciskekran=chr(13);


    for tr:=1 to 2 do
    begin
    for j:=1 to 6 do
    begin
    for i:=1 to 4 do wena[tr,j,i]:='0';
    end;
    for i:=1 to 6 do wena[tr,i,5]:=uzytkownik;
    end;
    koniec:=false;

repeat
  menu;
  xk:=0;
  yk:=140;
  k:=1;
  switch:=2;
  adel:=true;
    enteer:=false;
    repeat
    if del(adel) then inc(switch);
    if switch mod 2=0 then kursormenutwarz(yk,xk)
    else kursormenuzamkniety(yk,xk);
    if switch=100 then switch:=2;

         //*************************************
         if keypressed then
              begin
              //  kpress:=true;
                przycisk:=upcase(readkey);
                if przycisk=chr(83) then
                  begin
                    kursormenuzmaz(yk,xk);
                    yk:=yk+100;
                    k:=k+1;
                  end
                  else

                         if przycisk=chr(87) then
                          begin
                           kursormenuzmaz(yk,xk);
                           yk:=yk-100;
                           k:=k-1;
                          end
                          else

                          if przycisk=chr(13) then enteer:=true;
                end;


     //*************************************

               if k<1 then
                 begin
                   yk:=640;
                   k:=6;
                 end;
              if k>6 then
                 begin
                   yk:=140;
                   k:=1;
                 end;

     until enteer=true;
   case k of
     6 : koniec:=true;     //end game

     5: begin
          setfillstyle(1,black);
          bar(1,1,getmaxx,getmaxy);
          options;
          xk:=150;
          yk:=20;
          ko:=1;
          enterko:=false;
          entero:=true;
          switch:=2;
          adel:=true;
          REPEAT

          if del(adel) then inc(switch);
          if switch mod 2=0 then kursormenutwarz(yk,xk)
          else kursormenuzamkniety(yk,xk);
          if switch=100 then switch:=2;

          if keypressed then
              begin
                przycisk:=readkey;
                przycisk:=upcase(przycisk);
                if przycisk=chr(83) then
                  begin
                    kursormenuzmaz(yk,xk);
                    yk:=yk+100;
                    ko:=ko+1;
                  end;
                if przycisk=chr(87) then
                  begin
                    kursormenuzmaz(yk,xk);
                    yk:=yk-100;
                    ko:=ko-1;
                  end;
                if przycisk=chr(13) then entero:=false;
                if przycisk=chr(27) then enterko:=true;
               end;
               if yk<20 then
                 begin
                   yk:=420;
                   ko:=5;
                 end;
               if yk>420 then
                 begin
                   yk:=20;
                   ko:=1;
                 end;
              if entero=false then
                 begin
                  case ko of
                    5 : begin
                       repeat
                        enterko:=false;
                         setcolor(11);
                         settextstyle(TriplexFont,HorizDir,6);


                         if muzyka=1 then
                         begin
                         outtextxy(650,670,'ON');
                         end;
                         if muzyka=2 then outtextxy(650,670,'OFF');
                         delay(100);



                        if keypressed then
                         begin
                         przycisk:=readkey;
                         przycisk:=upcase(przycisk);
                         if przycisk='D' then
                         begin
                         setcolor(black);
                          setfillstyle(1,black);
                          bar(650,650,850,720);
                         muzyka:=2;
                         end;
                         if przycisk='A' then
                         begin
                         setcolor(black);
                          setfillstyle(1,black);
                          bar(650,650,850,720);
                         muzyka:=1;
                         end;
                         if przycisk=chr(27) then
                          begin
                          entero:=true;
                          setcolor(black);
                          setfillstyle(1,black);
                          bar(650,650,850,720);
                          end;
                         if przycisk=chr(13) then
                          begin
                          entero:=true;
                          setcolor(black);
                          setfillstyle(1,black);
                          bar(650,650,850,720);
                          end;
                         end;
                       until entero=true;
                     end;
                    4 : begin
                         repeat
                         enterko:=false;
                         setcolor(kolorop);             //pacman d     gora
                         setfillstyle(1,kolorop);
                         pieslice(1170,590,35,320,30);
                         setcolor(black);
                         setfillstyle(1,black);
                         fillellipse(1175,570,5,5);
                         if keypressed then
                         begin
                         przycisk:=readkey;
                         przycisk:=upcase(przycisk);
                         if przycisk='D' then inc(kolorop);
                         if przycisk='A' then dec(kolorop);
                         if kolorop>15 then kolorop:=1;
                         if kolorop<1 then kolorop:=15;
                          if (przycisk=chr(13)) or (przycisk=chr(27)) then
                                begin
                                entero:=true;
                                setcolor(black);             //pacman d     gora
                                setfillstyle(1,black);
                                pieslice(1170,590,35,320,30);
                                setcolor(black);
                                setfillstyle(1,black);
                                fillellipse(1175,570,5,5);
                         end;

                         end;
                     until entero=true;
                   end;
                  3 : begin
                       repeat
                        enterko:=false;
                         setcolor(10);
                         settextstyle(TriplexFont,HorizDir,6);


                         if speedd=1 then outtextxy(1170,470,'1');
                         if speedd=2 then outtextxy(1170,470,'2');
                         if speedd=3 then outtextxy(1170,470,'3');

                        delay(100);
                        if keypressed then
                         begin
                         przycisk:=readkey;
                         przycisk:=upcase(przycisk);
                         if przycisk='D' then
                         begin
                         setcolor(black);
                          setfillstyle(1,black);
                          bar(1170,440,1230,550);
                          inc(speedd);
                         end;
                         if przycisk='A' then
                         begin
                         setcolor(black);
                          setfillstyle(1,black);
                          bar(1170,440,1230,550);
                          if speedd=2 then speedd:=1;
                          if speedd=3 then speedd:=2;
                         end;
                         if speedd>3 then dec(speedd);
                         if przycisk=chr(27) then
                          begin
                          entero:=true;
                          setcolor(black);
                          setfillstyle(1,black);
                          bar(1170,440,1230,550);
                          end;
                         if przycisk=chr(13) then
                          begin
                          entero:=true;
                          setcolor(black);
                          setfillstyle(1,black);
                          bar(1170,440,1230,550);
                          end;
                         end;
                       until entero=true;
                     end;
                2 : begin
                       repeat
                        enterko:=false;
                         setcolor(10);
                         settextstyle(TriplexFont,HorizDir,6);


                         if diflvl=1 then outtextxy(1170,370,'E');
                         if diflvl=2 then outtextxy(1170,370,'M');
                         if diflvl=3 then outtextxy(1170,370,'H');

                        delay(50);
                        if keypressed then
                         begin
                         przycisk:=readkey;
                         przycisk:=upcase(przycisk);
                         if przycisk='D' then
                         begin
                         setcolor(black);
                          setfillstyle(1,black);
                          bar(1170,340,1230,450);
                          inc(diflvl);
                         end;
                         if przycisk='A' then
                         begin
                         setcolor(black);
                          setfillstyle(1,black);
                          bar(1170,340,1230,450);
                          if diflvl=2 then diflvl:=1;
                          if diflvl=3 then diflvl:=2;
                         end;
                         if diflvl>3 then dec(diflvl);
                         if przycisk=chr(27) then
                          begin
                          entero:=true;
                          setcolor(black);
                          setfillstyle(1,black);
                          bar(1170,340,1230,450);
                          end;
                         if przycisk=chr(13) then
                          begin
                          entero:=true;
                          setcolor(black);
                          setfillstyle(1,black);
                          bar(1170,340,1230,450);
                          end;
                         end;
                       until entero=true;
                     end;
              1 : begin
                       repeat
                        enterko:=false;
                        setcolor(black);
                        setfillstyle(1,black);
                        bar(1,1,getmaxx,getmaxy);
                        setcolor(random(10-1+1)+1);
                        settextstyle(TriplexFont,HorizDir,5);
                        outtextxy(100,500,'Nowa nazwa uzytkownika:');
                        i:=0;
                        j:=1;
                        x:=2;
                        kolor[0]:=10;
                        repeat
                        kolor[x]:=random(5-1+1)+1;
                        while kolor[x]=kolor[x-1] do
                        kolor[x]:=random(5-1+1)+1;
                        setcolor(kolor[x]);
                        przyciskekran:=readkey;
                        case przyciskekran of
                        chr(8) : begin
                        i:=i-50;
                        setcolor(black);
                        bar(100+i,600,150+i,800);
                        dec(j);
                        dec(x);
                        end;
                        else begin
                        if ord(uzytkownik[0])<j then
                        uzytkownik[0]:=chr(ord(uzytkownik[0])+1);
                        uzytkownik[j]:=przyciskekran;
                        outtextxy(100+i,600,przyciskekran);
                        i:=i+50;
                        inc(j);
                        inc(x);
                        if x=3 then x:=x-2;
                        kolor[0]:=kolor[x];
                        end;
                        end;
                        until przyciskekran=chr(13);

                         if przycisk=chr(27) then
                          begin
                          entero:=true;
                          setcolor(black);
                          setfillstyle(1,black);
                          bar(1,1,getmaxx,getmaxy);
                          options;
                          end;
                         if przycisk=chr(13) then
                          begin
                          entero:=true;
                          setcolor(black);
                          setfillstyle(1,black);
                          bar(1,1,getmaxx,getmaxy);
                          options;
                          end;
                       until entero=true;
                     end;
          end;
       end;

     until enterko=true;


        setfillstyle(1,black);
        bar(1,1,getmaxx,getmaxy);

        end;

     4 : begin             //creators
                setfillstyle(1,black);
                bar(1,1,getmaxx,getmaxy);

                setcolor(white);
                settextstyle(TriplexFont,HorizDir,4);
                outtextxy(100,490,'MATEUSZ STOLARSKI & TOMASZ PARUZEL.');
                settextstyle(TriplexFont,HorizDir,3);
                outtextxy(250,970,'PRESS ESC TO BACK TO MAIN MENU.');
                settextstyle(TriplexFont,HorizDir,4);
                setcolor(10);
                outtextxy(450,140,'MADE IN POLAND');
                settextstyle(TriplexFont,HorizDir,3);
                outtextxy(460,800,'RELEASED 08.03.2017');



                 setcolor(yellow);             //pacman d     gora
                setfillstyle(1,yellow);
                pieslice(100,100,35,320,30);
                setcolor(black);
                setfillstyle(1,black);
                fillellipse(105,80,5,5);
                 setcolor(yellow);             //pacman a     dol
                setfillstyle(1,yellow);
                fillellipse(1180,923,30,30);
                setcolor(black);
                setfillstyle(1,black);
                pieslice(1180,923,145,220,30);
                setcolor(black);
                setfillstyle(1,black);
                fillellipse(1175,903,5,5);
                    setcolor(yellow);             //pacman d  dol
                setfillstyle(1,yellow);
                pieslice(100,923,35,320,30);
                setcolor(black);
                setfillstyle(1,black);
                fillellipse(105,903,5,5);
                 setcolor(yellow);             //pacman a   gora  100 80
                setfillstyle(1,yellow);
                fillellipse(1180,100,30,30);
                setcolor(black);
                setfillstyle(1,black);
                pieslice(1180,100,145,220,30);
                setcolor(black);
                setfillstyle(1,black);
                fillellipse(1175,80,5,5);

               for i:=1 to 6 do
               begin

                 setcolor(random(13-9+1)+9);                                    //duszek 1
                 setfillstyle(1,random(13-9+1)+9);
                 bar(510+100*i,710,580+100*i,725);    //+70 x
                 bar(515+100*i,695,575+100*i,710);
                 bar(520+100*i,685,570+100*i,695);
                 bar(525+100*i,680,565+100*i,690);
                 bar(535+100*i,675,555+100*i,680);
                 bar(510+100*i,725,520+100*i,735);
                 bar(525+100*i,725,540+100*i,735);
                 bar(550+100*i,725,565+100*i,735);
                 bar(570+100*i,725,580+100*i,735);
                 setfillstyle(1,black);
                 bar(515+100*i,730,530+100*i,735);
                 bar(560+100*i,730,575+100*i,735);
                 setfillstyle(1,white);                        //OCZY
                 bar(525+100*i,690,535+100*i,715);
                 bar(520+100*i,695,540+100*i,710);
                 bar(555+100*i,690,565+100*i,715);
                 bar(550+100*i,695,570+100*i,710);
                 setfillstyle(1,black);
                 bar(525+100*i,700,535+100*i,710);
                 bar(555+100*i,700,565+100*i,710);

                 setcolor(random(13-9+1)+9);          //duszek 2
                 setfillstyle(1,random(13-9+1)+9);
                 bar(510+100*i,310,580+100*i,325);    //+70 x
                 bar(515+100*i,295,575+100*i,310);
                 bar(520+100*i,285,570+100*i,295);
                 bar(525+100*i,280,565+100*i,290);
                 bar(535+100*i,275,555+100*i,280);
                 bar(510+100*i,325,520+100*i,335);
                 bar(525+100*i,325,540+100*i,335);
                 bar(550+100*i,325,565+100*i,335);
                 bar(570+100*i,325,580+100*i,335);
                 setfillstyle(1,black);
                 bar(515+100*i,330,530+100*i,335);
                 bar(560+100*i,330,575+100*i,335);
                 setfillstyle(1,white);                        //OCZY
                 bar(525+100*i,290,535+100*i,315);
                 bar(520+100*i,295,540+100*i,310);
                 bar(555+100*i,290,565+100*i,315);
                 bar(550+100*i,295,570+100*i,310);
                 setfillstyle(1,black);
                 bar(525+100*i,300,535+100*i,310);
                 bar(555+100*i,300,565+100*i,310);
              end;

              for i:=1 to 6 do
               begin

                 setcolor(random(13-9+1)+9);                                    //duszek 1
                 setfillstyle(1,random(13-9+1)+9);
                 bar(610-100*i,710,680-100*i,725);    //+70 x
                 bar(615-100*i,695,675-100*i,710);
                 bar(620-100*i,685,670-100*i,695);
                 bar(625-100*i,680,665-100*i,690);
                 bar(635-100*i,675,655-100*i,680);
                 bar(610-100*i,725,620-100*i,735);
                 bar(625-100*i,725,640-100*i,735);
                 bar(650-100*i,725,665-100*i,735);
                 bar(670-100*i,725,680-100*i,735);
                 setfillstyle(1,black);
                 bar(615-100*i,730,630-100*i,735);
                 bar(660-100*i,730,675-100*i,735);
                 setfillstyle(1,white);                        //OCZY
                 bar(625-100*i,690,635-100*i,715);
                 bar(620-100*i,695,640-100*i,710);
                 bar(655-100*i,690,665-100*i,715);
                 bar(650-100*i,695,670-100*i,710);
                 setfillstyle(1,black);
                 bar(625-100*i,700,635-100*i,710);
                 bar(655-100*i,700,665-100*i,710);

                 setcolor(random(13-9+1)+9);          //duszek 2
                 setfillstyle(1,random(13-9+1)+9);
                 bar(610-100*i,310,680-100*i,325);    //+70 x
                 bar(615-100*i,295,675-100*i,310);
                 bar(620-100*i,285,670-100*i,295);
                 bar(625-100*i,280,665-100*i,290);
                 bar(635-100*i,275,655-100*i,280);
                 bar(610-100*i,325,620-100*i,335);
                 bar(625-100*i,325,640-100*i,335);
                 bar(650-100*i,325,665-100*i,335);
                 bar(670-100*i,325,680-100*i,335);
                 setfillstyle(1,black);
                 bar(615-100*i,330,630-100*i,335);
                 bar(660-100*i,330,675-100*i,335);
                 setfillstyle(1,white);                        //OCZY
                 bar(625-100*i,290,635-100*i,315);
                 bar(620-100*i,295,640-100*i,310);
                 bar(655-100*i,290,665-100*i,315);
                 bar(650-100*i,295,670-100*i,310);
                 setfillstyle(1,black);
                 bar(625-100*i,300,635-100*i,310);
                 bar(655-100*i,300,665-100*i,310);
              end;
                repeat
                n:=readkey;
                if ord(n)<>27 then readkey
                   else przycisk:=chr(27);
                until przycisk=chr(27);
              end;
     3:   begin      //instruction
                setfillstyle(1,black);
                bar(1,1,getmaxx,getmaxy);


                v:=random(10-1+1)+1;
                setfillstyle(1,black);
                bar(1,1,getmaxx,getmaxy);

               setcolor(v);
               settextstyle(TriplexFont,HorizDir,10);
               outtextxy(100,50,'PACMAN CONTROL');

               setlinestyle(0, $C3, ThickWidth); //lewa strzalka
               line(440,512,300,512);
               line(300,512,340,552);
               line(300,512,340,472);

               setlinestyle(0, $C3, ThickWidth);   //prawa strzalka
               line(840,512,980,512);
               line(980,512,940,552);
               line(980,512,940,472);

               setlinestyle(0, $C3, ThickWidth);    //gorna strzalka
               line(640,312,640,172);
               line(640,172,680,212);
               line(640,172,600,212);

               setlinestyle(0, $C3, ThickWidth);   //dolna strzalka
               line(640,712,640,852);
               line(640,852,680,812);
               line(640,852,600,812);

               setcolor(white);
               settextstyle(TriplexFont,HorizDir,4);
               outtextxy(627,320,'W');

               settextstyle(TriplexFont,HorizDir,4);
               outtextxy(627,677,'S');

               settextstyle(TriplexFont,HorizDir,4);
               outtextxy(448,500,'A');

               settextstyle(TriplexFont,HorizDir,4);
               outtextxy(807,500,'D');

                setcolor(yellow);             //pacman d
                setfillstyle(1,yellow);
                pieslice(750,500,35,320,30);
                setcolor(black);
                setfillstyle(1,black);
                fillellipse(755,480,5,5);

                setcolor(yellow);             //pacman a
                setfillstyle(1,yellow);
                fillellipse(535,500,30,30);
                setcolor(black);
                setfillstyle(1,black);
                pieslice(535,500,145,220,30);
                setcolor(black);
                setfillstyle(1,black);
                fillellipse(530,480,5,5);

                setcolor(yellow);             //pacman w
                setfillstyle(1,yellow);
                fillellipse(640,400,30,30);
                setcolor(black);
                setfillstyle(1,black);
                pieslice(640,400,125,50,30);
                setcolor(black);
                setfillstyle(1,black);
                fillellipse(620,405,5,5);

                setcolor(yellow);             //pacman s
                setfillstyle(1,yellow);
                fillellipse(640,623,30,30);
                setcolor(black);
                setfillstyle(1,black);
                pieslice(640,623,235,310,30);
                setcolor(black);
                setfillstyle(1,black);
                fillellipse(660,628,5,5);


               setcolor(15);
               rectangle(900,670,1000,710);
               settextstyle(TriplexFont,HorizDir,2);
               outtextxy(910,680,'ESC');
               outtextxy(910,730,'PAUSE');
               line(900,690,870,690);
               line(900,690,890,680);
               line(900,690,890,700);
               line(900,740,870,740);
               line(870,740,870,690);

               setcolor(v);
               settextstyle(TriplexFont,HorizDir,3);
               outtextxy(250,970,'PRESS ESC TO BACK TO MAIN MENU.');
                repeat
                   n:=readkey;
                   if ord(n)<>27 then readkey
                    else przycisk:=chr(27);
                until  przycisk=chr(27);
              end;

     2 : begin    //highscore
          setfillstyle(1,black);
          bar(1,1,getmaxx,getmaxy);


          setcolor(random(10-1+1)+1);
          settextstyle(TriplexFont,HorizDir,3);
          outtextxy(400,350,'CHOOSE MODE');
          setcolor(random(10-1+1)+1);
          outtextxy(400,450,' Survival');
          setcolor(random(10-1+1)+1);
          outtextxy(400,550,' Adventure');
          entertryb:=false;

          kt:=1;
          switch:=2;
          adel:=true;
          xk:=240;
          yk:=190;

          repeat

            if del(adel) then inc(switch);
            if switch mod 2=0 then kursormenutwarz(yk,xk)
            else kursormenuzamkniety(yk,xk);
            if switch=100 then switch:=2;

            if keypressed then
              begin
                przycisktryb:=readkey;
                przycisktryb:=upcase(przycisktryb);
                if przycisktryb=chr(83) then
                  begin
                    kursormenuzmaz(yk,xk);
                    yk:=yk+100;
                    kt:=kt+1;
                  end;
                if przycisktryb=chr(87) then
                  begin
                    kursormenuzmaz(yk,xk);
                    yk:=yk-100;
                    kt:=kt-1;
                  end;
                if przycisktryb=chr(13) then entermap:=true;
                if przycisktryb=chr(13) then entertryb:=true;
                if przycisktryb=chr(27) then entertryb:=true;
                if yk>290 then
                  begin
                    yk:=190;
                    kt:=1;
                  end;
                if yk<190 then
                  begin
                    yk:=290;
                    kt:=2;
                  end;
             end;
               if entermap=true then
                 begin
                   setfillstyle(1,black);
                   bar(1,1,getmaxx,getmaxy);
                   if kt=1 then  //przeskok do minimap
                     begin
                      setcolor(random(10-1+1)+1);
                      settextstyle(TriplexFont,HorizDir,8);
                      outtextxy(400,100,'WHICH MAP');
                      minimapy;
                      xk:=70;
                      yk:=170;
                      km:=1;
                      switch:=2;
                      adel:=true;
                      REPEAT
                      if del(adel) then inc(switch);
                      if switch mod 2=0 then kursormenutwarz(yk,xk)
                         else kursormenuzamkniety(yk,xk);
                      if switch=100 then switch:=2;



                     if keypressed then
                       begin
                         przyciskmap:=readkey;
                         przyciskmap:=upcase(przyciskmap);
                         if przyciskmap=chr(68) then
                           begin
                            kursormenuzmaz(yk,xk);
                            xk:=xk+400;
                            km:=km+1;
                           end;
                         if przyciskmap=chr(83) then
                           begin
                            kursormenuzmaz(yk,xk);
                            yk:=yk+300;
                            km:=km+3;
                           end;

                         if przyciskmap=chr(65) then
                           begin
                            kursormenuzmaz(yk,xk);
                            xk:=xk-400;
                            km:=km-1;
                           end;
                         if przyciskmap=chr(87) then
                           begin
                            kursormenuzmaz(yk,xk);
                            yk:=yk-300;
                            km:=km-3;
                           end;
                         if przyciskmap=chr(13) then graj:=true;
                         if przyciskmap=chr(13) then entermap:=false;
                       end;
                       if xk>870 then
                          begin
                           xk:=xk-400;
                           km:=km-1;
                           end;
                       if xk<0 then
                         begin
                          xk:=xk+400;
                          km:=km+1;
                         end;
                       if yk>470 then
                         begin
                          yk:=yk-300;
                          km:=km-3;
                         end;
                       if yk<100 then
                         begin
                          yk:=yk+300;
                          km:=km+3;
                         end;
                        if przyciskmap=chr(27) then
                           begin
                             setfillstyle(1,black);
                             bar(1,1,getmaxx,getmaxy);
                             entermap:=false;
                             yk:=200;
                             setcolor(random(10-1+1)+1);
                             settextstyle(TriplexFont,HorizDir,3);
                             outtextxy(400,350,'CHOOSE MODE');
                             setcolor(random(10-1+1)+1);
                             outtextxy(400,450,' Survival');
                             setcolor(random(10-1+1)+1);
                             outtextxy(400,550,' Adventure');
                             entertryb:=false;
                             przyciskmap:=chr(1);
                             xk:=240;
                             yk:=190;
                          end;




                       if graj=true then
                         begin
                           if km=1 then  //map1
                             begin
                               setfillstyle(1,black);
                               bar(1,1,getmaxx,getmaxy);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(100,50,'HIGHSCORE');


                               setcolor(yellow);             //pacman d  dol
                               setfillstyle(1,yellow);
                               pieslice(100,923,35,320,30);
                               setcolor(black);
                               setfillstyle(1,black);
                               fillellipse(105,903,5,5);

                               setcolor(random(13-9+1)+9);                                    //duszek 1
                               setfillstyle(1,random(13-9+1)+9);
                               bar(1010,110,1080,125);    //+70 x
                               bar(1015,95,1075,110);
                               bar(1020,85,1070,95);
                               bar(1025,80,1065,90);
                               bar(1035,75,1055,80);
                               bar(1010,125,1020,135);
                               bar(1025,125,1040,135);
                               bar(1050,125,1065,135);
                               bar(1070,125,1080,135);
                               setfillstyle(1,black);
                               bar(1015,130,1030,135);
                               bar(1060,130,1075,135);
                               setfillstyle(1,white);                        //OCZY
                               bar(1025,90,1035,115);
                               bar(1020,95,1040,110);
                               bar(1055,90,1065,115);
                               bar(1050,95,1070,110);
                               setfillstyle(1,black);
                               bar(1025,100,1035,110);
                               bar(1055,100,1065,110);
                               //mapka
                               i:=600;
                               j:=50;
                               setcolor(black);
                               setfillstyle(1,1);
                               bar((20 div 10)+i,(20 div 10)+j,(40 div 10)+i,(1003 div 10)+j);  //obramowanie
                               bar((20 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(40 div 10)+j);
                               bar((1240 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(1003 div 10)+j);
                               bar((20 div 10)+i,(980 div 10)+j,(1260 div 10)+i,(1003 div 10)+j);
                               bar((360 div 10)+i,(40 div 10)+j,(380 div 10)+i,(100 div 10)+j);
                               bar((879 div 10)+i,(40 div 10)+j,(899 div 10)+i,(100 div 10)+j);
                               bar((879 div 10)+i,(983 div 10)+j,(899 div 10)+i,(923 div 10)+j);
                               bar((360 div 10)+i,(983 div 10)+j,(380 div 10)+i,(923 div 10)+j);

                               bar((120 div 10)+i,(923 div 10)+j,(300 div 10)+i,(883 div 10)+j); //L lewy dolny rog
                               bar((120 div 10)+i,(923 div 10)+j,(160 div 10)+i,(562 div 10)+j);

                               bar((120 div 10)+i,(100 div 10)+j,(300 div 10)+i,(140 div 10)+j);
                               bar((120 div 10)+i,(100 div 10)+j,(160 div 10)+i,(461 div 10)+j);   //L lewy gorny rog

                               bar((440 div 10)+i,(863 div 10)+j,(819 div 10)+i,(903 div 10)+j); //duzy dolny prostokat
                               bar((440 div 10)+i,(140 div 10)+j,(819 div 10)+i,(180 div 10)+j); //duzy gorny prostokat

                               bar((1159 div 10)+i,(923 div 10)+j,(959 div 10)+i,(883 div 10)+j); //L prawy dolny rog
                               bar((1159 div 10)+i,(923 div 10)+j,(1119 div 10)+i,(562 div 10)+j);

                               bar((1159 div 10)+i,(100 div 10)+j,(959 div 10)+i,(140 div 10)+j); //L prawy gorny rog
                               bar((1159 div 10)+i,(100 div 10)+j,(1119 div 10)+i,(461 div 10)+j);

                               bar((240 div 10)+i,(240 div 10)+j,(554 div 10)+i,(280 div 10)+j); //maly gorny prostokat lewy
                               bar((999 div 10)+i,(240 div 10)+j,(685 div 10)+i,(280 div 10)+j); //maly gorny ptostokat prawy

                               bar((240 div 10)+i,(783 div 10)+j,(554 div 10)+i,(743 div 10)+j); //maly dolny prostokat lewy
                               bar((999 div 10)+i,(783 div 10)+j,(685 div 10)+i,(743 div 10)+j); //maly dolny prostokat prawy

                               bar((240 div 10)+i,(340 div 10)+j,(280 div 10)+i,(683 div 10)+j); //pionowy prostoka lewy
                               bar((959 div 10)+i,(340 div 10)+j,(999 div 10)+i,(683 div 10)+j); //puonowy prostokat prawy

                               bar((350 div 10)+i,(340 div 10)+j,(530 div 10)+i,(380 div 10)+j);//srodek
                               bar((350 div 10)+i,(340 div 10)+j,(390 div 10)+i,(643 div 10)+j);
                               bar((879 div 10)+i,(340 div 10)+j,(710 div 10)+i,(380 div 10)+j);
                               bar((879 div 10)+i,(683 div 10)+j,(350 div 10)+i,(643 div 10)+j);
                               bar((879 div 10)+i,(684 div 10)+j,(839 div 10)+i,(340 div 10)+j);

                               for i:=1 to 1 do
                               begin
                               str(i,zxc);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(150,200+100*i,'BEST: ');
                               for j:=1 to 5 do outtextxy(170+100*j,300,bestt[1,1,j]);
                               for j:=1 to 4 do outtextxy(240+100*j,300,':');
                               outtextxy(880,300,'.');
                               end;

                              for i:=1 to 1 do
                              begin
                               str(i,zxc);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(150,200+300*i,'YOUR: ');
                               for j:=1 to 5 do outtextxy(170+100*j,500,wena[1,1,j]);
                               for j:=1 to 4 do outtextxy(240+100*j,500,':');
                               outtextxy(880,500,'.');
                               end;

                             setcolor(white);
                             settextstyle(TriplexFont,HorizDir,3);
                             outtextxy(250,970,'PRESS ESC TO BACK TO MAIN MENU.');
                             setcolor(white);
                             settextstyle(TriplexFont,HorizDir,3);
                             outtextxy(300,770,'PRESS 0 TO RESET HIGHSCORE.');
                             zerowanie;
                             entermap:=true;
                             graj:=false;
                             setfillstyle(1,black);
                             bar(1,1,getmaxx,getmaxy);
                             minimapy;
                             setcolor(random(10-1+1)+1);
                             settextstyle(TriplexFont,HorizDir,8);
                             outtextxy(400,100,'WHICH MAP');

                             end;
                           if km=2 then  //map2
                             begin
                               setfillstyle(1,black);
                               bar(1,1,getmaxx,getmaxy);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(100,50,'HIGHSCORE');


                               setcolor(yellow);             //pacman d  dol
                               setfillstyle(1,yellow);
                               pieslice(100,923,35,320,30);
                               setcolor(black);
                               setfillstyle(1,black);
                               fillellipse(105,903,5,5);

                               setcolor(random(13-9+1)+9);                                    //duszek 1
                               setfillstyle(1,random(13-9+1)+9);
                               bar(1010,110,1080,125);    //+70 x
                               bar(1015,95,1075,110);
                               bar(1020,85,1070,95);
                               bar(1025,80,1065,90);
                               bar(1035,75,1055,80);
                               bar(1010,125,1020,135);
                               bar(1025,125,1040,135);
                               bar(1050,125,1065,135);
                               bar(1070,125,1080,135);
                               setfillstyle(1,black);
                               bar(1015,130,1030,135);
                               bar(1060,130,1075,135);
                               setfillstyle(1,white);                        //OCZY
                               bar(1025,90,1035,115);
                               bar(1020,95,1040,110);
                               bar(1055,90,1065,115);
                               bar(1050,95,1070,110);
                               setfillstyle(1,black);
                               bar(1025,100,1035,110);
                               bar(1055,100,1065,110);
                               //mapka
                               i:=600;
                               j:=50;
                               setcolor(black);
                               setfillstyle(1,5);

                                bar((20 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(39 div 10)+j);//obramowanie
                                bar((20 div 10)+i,(20 div 10)+j,(39 div 10)+i,(1004 div 10)+j);
                                bar((1241 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(1004 div 10)+j);
                                bar((39 div 10)+i,(985 div 10)+j,(1260 div 10)+i,(1004 div 10)+j);

                                bar((70 div 10)+i,(70 div 10)+j,(186 div 10)+i,(99 div 10)+j); //lewy gorny
                                bar((70 div 10)+i,(70 div 10)+j,(99 div 10)+i,(186 div 10)+j);

                                bar((70 div 10)+i,(246 div 10)+j,(99 div 10)+i,(362 div 10)+j);
                                bar((70 div 10)+i,(333 div 10)+j,(186 div 10)+i,(362 div 10)+j);

                                bar((246 div 10)+i,(70 div 10)+j,(362 div 10)+i,(99 div 10)+j);
                                bar((333 div 10)+i,(70 div 10)+j,(362 div 10)+i,(186 div 10)+j);

                                bar((333 div 10)+i,(246 div 10)+j,(362 div 10)+i,(362 div 10)+j);
                                bar((246 div 10)+i,(333 div 10)+j,(362 div 10)+i,(362 div 10)+j);

                                bar((129 div 10)+i,(129 div 10)+j,(303 div 10)+i,(158 div 10)+j);
                                bar((129 div 10)+i,(129 div 10)+j,(158 div 10)+i,(187 div 10)+j);
                                bar((303 div 10)+i,(187 div 10)+j,(274 div 10)+i,(129 div 10)+j);

                                bar((129 div 10)+i,(247 div 10)+j,(158 div 10)+i,(305 div 10)+j);
                                bar((303 div 10)+i,(247 div 10)+j,(274 div 10)+i,(305 div 10)+j);
                                bar((129 div 10)+i,(276 div 10)+j,(303 div 10)+i,(305 div 10)+j);

                                bar((187 div 10)+i,(187 div 10)+j,(245 div 10)+i,(245 div 10)+j);

                                bar((70 div 10)+i,(422 div 10)+j,(128 div 10)+i,(509 div 10)+j);//lewy srodek
                                bar((188 div 10)+i,(422 div 10)+j,(246 div 10)+i,(509 div 10)+j);
                                bar((306 div 10)+i,(422 div 10)+j,(364 div 10)+i,(509 div 10)+j); //632

                                bar((70 div 10)+i,(540 div 10)+j,(128 div 10)+i,(632 div 10)+j);
                                bar((188 div 10)+i,(540 div 10)+j,(246 div 10)+i,(632 div 10)+j);
                                bar((306 div 10)+i,(540 div 10)+j,(364 div 10)+i,(632 div 10)+j);

                                bar((70 div 10)+i,(954 div 10)+j,(186 div 10)+i,(925 div 10)+j); //lewy dol
                                bar((70 div 10)+i,(954 div 10)+j,(99 div 10)+i,(838 div 10)+j);

                                bar((246 div 10)+i,(954 div 10)+j,(362 div 10)+i,(925 div 10)+j);
                                bar((333 div 10)+i,(954 div 10)+j,(362 div 10)+i,(838 div 10)+j);

                                bar((70 div 10)+i,(662 div 10)+j,(99 div 10)+i,(778 div 10)+j);
                                bar((70 div 10)+i,(662 div 10)+j,(186 div 10)+i,(691 div 10)+j);

                                bar((246 div 10)+i,(662 div 10)+j,(362 div 10)+i,(691 div 10)+j);
                                bar((333 div 10)+i,(662 div 10)+j,(362 div 10)+i,(778 div 10)+j);

                                bar((129 div 10)+i,(895 div 10)+j,(158 div 10)+i,(838 div 10)+j);
                                bar((129 div 10)+i,(895 div 10)+j,(303 div 10)+i,(866 div 10)+j);
                                bar((303 div 10)+i,(866 div 10)+j,(274 div 10)+i,(838 div 10)+j);

                                bar((129 div 10)+i,(720 div 10)+j,(158 div 10)+i,(778 div 10)+j);
                                bar((129 div 10)+i,(720 div 10)+j,(303 div 10)+i,(749 div 10)+j);
                                bar((303 div 10)+i,(778 div 10)+j,(274 div 10)+i,(720 div 10)+j);

                                bar((188 div 10)+i,(778 div 10)+j,(246 div 10)+i,(836 div 10)+j);

                                bar((1210 div 10)+i,(70 div 10)+j,(1094 div 10)+i,(99 div 10)+j);//prawy gorny
                                bar((1210 div 10)+i,(70 div 10)+j,(1181 div 10)+i,(186 div 10)+j);

                                bar((1210 div 10)+i,(246 div 10)+j,(1181 div 10)+i,(362 div 10)+j);
                                bar((1210 div 10)+i,(362 div 10)+j,(1094 div 10)+i,(333 div 10)+j);

                                bar((1034 div 10)+i,(362 div 10)+j,(918 div 10)+i,(333 div 10)+j);
                                bar((918 div 10)+i,(362 div 10)+j,(947 div 10)+i,(246 div 10)+j);

                                bar((918 div 10)+i,(70 div 10)+j,(947 div 10)+i,(186 div 10)+j);
                                bar((918 div 10)+i,(70 div 10)+j,(1034 div 10)+i,(99 div 10)+j);

                                bar((1152 div 10)+i,(128 div 10)+j,(978 div 10)+i,(157 div 10)+j);
                                bar((1152 div 10)+i,(128 div 10)+j,(1123 div 10)+i,(186 div 10)+j);
                                bar((978 div 10)+i,(128 div 10)+j,(1007 div 10)+i,(186 div 10)+j);

                                bar((1152 div 10)+i,(303 div 10)+j,(978 div 10)+i,(274 div 10)+j);
                                bar((1152 div 10)+i,(303 div 10)+j,(1123 div 10)+i,(245 div 10)+j);
                                bar((978 div 10)+i,(303 div 10)+j,(1007 div 10)+i,(245 div 10)+j);

                                bar((1037 div 10)+i,(186 div 10)+j,(1095 div 10)+i,(245 div 10)+j);

                                bar((1210 div 10)+i,(954 div 10)+j,(1181 div 10)+i,(838 div 10)+j); //prawy dolny
                                bar((1210 div 10)+i,(954 div 10)+j,(1094 div 10)+i,(925 div 10)+j);

                                bar((1210 div 10)+i,(778 div 10)+j,(1181 div 10)+i,(662 div 10)+j);
                                bar((1210 div 10)+i,(662 div 10)+j,(1094 div 10)+i,(691 div 10)+j);


                                bar((918 div 10)+i,(778 div 10)+j,(947 div 10)+i,(662 div 10)+j);
                                bar((918 div 10)+i,(662 div 10)+j,(1034 div 10)+i,(691 div 10)+j);

                                bar((1034 div 10)+i,(954 div 10)+j,(918 div 10)+i,(925 div 10)+j);
                                bar((918 div 10)+i,(954 div 10)+j,(947 div 10)+i,(838 div 10)+j);

                                bar((1152 div 10)+i,(896 div 10)+j,(978 div 10)+i,(867 div 10)+j);
                                bar((1152 div 10)+i,(896 div 10)+j,(1123 div 10)+i,(838 div 10)+j);
                                bar((978 div 10)+i,(896 div 10)+j,(1007 div 10)+i,(838 div 10)+j);

                                bar((1152 div 10)+i,(720 div 10)+j,(978 div 10)+i,(749 div 10)+j);
                                bar((1152 div 10)+i,(720 div 10)+j,(1123 div 10)+i,(778 div 10)+j);
                                bar((978 div 10)+i,(720 div 10)+j,(1007 div 10)+i,(778 div 10)+j);

                                bar((1037 div 10)+i,(778 div 10)+j,(1095 div 10)+i,(838 div 10)+j);

                                bar((1210 div 10)+i,(422 div 10)+j,(1152 div 10)+i,(509 div 10)+j);//prawy srodek
                                bar((1092 div 10)+i,(422 div 10)+j,(1034 div 10)+i,(509 div 10)+j);
                                bar((974 div 10)+i,(422 div 10)+j,(916 div 10)+i,(509 div 10)+j); //632   60

                                bar((1210 div 10)+i,(540 div 10)+j,(1152 div 10)+i,(632 div 10)+j);
                                bar((1092 div 10)+i,(540 div 10)+j,(1034 div 10)+i,(632 div 10)+j);
                                bar((974 div 10)+i,(540 div 10)+j,(916 div 10)+i,(632 div 10)+j);

                                bar((424 div 10)+i,(954 div 10)+j,(856 div 10)+i,(922 div 10)+j);//srodek srodek dol

                                bar((586 div 10)+i,(865 div 10)+j,(694 div 10)+i,(827 div 10)+j);
                                bar((694 div 10)+i,(827 div 10)+j,(640 div 10)+i,(775 div 10)+j);
                                bar((640 div 10)+i,(775 div 10)+j,(586 div 10)+i,(733 div 10)+j);
                                bar((586 div 10)+i,(733 div 10)+j,(694 div 10)+i,(694 div 10)+j);

                                bar((423 div 10)+i,(615 div 10)+j,(856 div 10)+i,(647 div 10)+j);

                                bar((393 div 10)+i,(679 div 10)+j,(531 div 10)+i,(711 div 10)+j);
                                bar((393 div 10)+i,(679 div 10)+j,(425 div 10)+i,(890 div 10)+j);
                                bar((393 div 10)+i,(890 div 10)+j,(531 div 10)+i,(858 div 10)+j);

                                bar((454 div 10)+i,(826 div 10)+j,(518 div 10)+i,(741 div 10)+j);

                                bar((886 div 10)+i,(679 div 10)+j,(748 div 10)+i,(711 div 10)+j);
                                bar((886 div 10)+i,(679 div 10)+j,(850 div 10)+i,(890 div 10)+j);
                                bar((886 div 10)+i,(890 div 10)+j,(748 div 10)+i,(858 div 10)+j);

                                bar((748 div 10)+i,(826 div 10)+j,(819 div 10)+i,(741 div 10)+j);


                                bar((424 div 10)+i,(70 div 10)+j,(856 div 10)+i,(102 div 10)+j);//srodek srodek gora
                                bar((586 div 10)+i,(159 div 10)+j,(640 div 10)+i,(322 div 10)+j);
                                bar((586 div 10)+i,(159 div 10)+j,(670 div 10)+i,(249 div 10)+j);
                                bar((640 div 10)+i,(168 div 10)+j,(685 div 10)+i,(240 div 10)+j);
                                bar((640 div 10)+i,(177 div 10)+j,(695 div 10)+i,(231 div 10)+j);
                                bar((423 div 10)+i,(379 div 10)+j,(856 div 10)+i,(406 div 10)+j);

                                bar((393 div 10)+i,(345 div 10)+j,(531 div 10)+i,(313 div 10)+j);
                                bar((393 div 10)+i,(345 div 10)+j,(425 div 10)+i,(134 div 10)+j);
                                bar((393 div 10)+i,(134 div 10)+j,(531 div 10)+i,(166 div 10)+j);

                                bar((454 div 10)+i,(198 div 10)+j,(518 div 10)+i,(283 div 10)+j);

                                bar((886 div 10)+i,(345 div 10)+j,(748 div 10)+i,(313 div 10)+j);
                                bar((886 div 10)+i,(345 div 10)+j,(850 div 10)+i,(134 div 10)+j);
                                bar((886 div 10)+i,(134 div 10)+j,(748 div 10)+i,(166 div 10)+j);

                                bar((748 div 10)+i,(198 div 10)+j,(819 div 10)+i,(283 div 10)+j);

                                bar((402 div 10)+i,(437 div 10)+j,(878 div 10)+i,(449 div 10)+j);//srodek srodkow
                                bar((402 div 10)+i,(437 div 10)+j,(414 div 10)+i,(584 div 10)+j);
                                bar((878 div 10)+i,(437 div 10)+j,(866 div 10)+i,(584 div 10)+j);
                                bar((402 div 10)+i,(584 div 10)+j,(878 div 10)+i,(572 div 10)+j);
                                setfillstyle(1,black);
                                bar((586 div 10)+i,(437 div 10)+j,(694 div 10)+i,(449 div 10)+j);


                               for i:=1 to 1 do
                               begin
                               str(i,zxc);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(150,200+100*i,'BEST: ');
                               for j:=1 to 5 do outtextxy(170+100*j,300,bestt[1,2,j]);
                               for j:=1 to 4 do outtextxy(240+100*j,300,':');
                               outtextxy(880,300,'.');
                               end;

                              for i:=1 to 1 do
                              begin
                               str(i,zxc);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(150,200+300*i,'YOUR: ');
                               for j:=1 to 5 do outtextxy(170+100*j,500,wena[1,2,j]);
                               for j:=1 to 4 do outtextxy(240+100*j,500,':');
                               outtextxy(880,500,'.');
                               end;

                             setcolor(white);
                             settextstyle(TriplexFont,HorizDir,3);
                             outtextxy(250,970,'PRESS ESC TO BACK TO MAIN MENU.');
                             setcolor(white);
                             settextstyle(TriplexFont,HorizDir,3);
                             outtextxy(300,770,'PRESS 0 TO RESET HIGHSCORE.');
                             zerowanie;
                             entermap:=true;
                             graj:=false;
                             setfillstyle(1,black);
                             bar(1,1,getmaxx,getmaxy);
                             minimapy;
                             setcolor(random(10-1+1)+1);
                             settextstyle(TriplexFont,HorizDir,8);
                             outtextxy(400,100,'WHICH MAP');

                             end;
                           if km=3 then  //map3
                             begin
                                setfillstyle(1,black);
                               bar(1,1,getmaxx,getmaxy);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(100,50,'HIGHSCORE');


                               setcolor(yellow);             //pacman d  dol
                               setfillstyle(1,yellow);
                               pieslice(100,923,35,320,30);
                               setcolor(black);
                               setfillstyle(1,black);
                               fillellipse(105,903,5,5);

                               setcolor(random(13-9+1)+9);                                    //duszek 1
                               setfillstyle(1,random(13-9+1)+9);
                               bar(1010,110,1080,125);    //+70 x
                               bar(1015,95,1075,110);
                               bar(1020,85,1070,95);
                               bar(1025,80,1065,90);
                               bar(1035,75,1055,80);
                               bar(1010,125,1020,135);
                               bar(1025,125,1040,135);
                               bar(1050,125,1065,135);
                               bar(1070,125,1080,135);
                               setfillstyle(1,black);
                               bar(1015,130,1030,135);
                               bar(1060,130,1075,135);
                               setfillstyle(1,white);                        //OCZY
                               bar(1025,90,1035,115);
                               bar(1020,95,1040,110);
                               bar(1055,90,1065,115);
                               bar(1050,95,1070,110);
                               setfillstyle(1,black);
                               bar(1025,100,1035,110);
                               bar(1055,100,1065,110);
                               //mapka
                               i:=600;
                               j:=50;
                               setcolor(black);
                               setfillstyle(1,3);
                               bar((20 div 10)+i,(20 div 10)+j,(40 div 10)+i,(1000 div 10)+j);  //obramowanie
    bar((20 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(40 div 10)+j);
    bar((1240 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(1000 div 10)+j);
    bar((20 div 10)+i,(980 div 10)+j,(1260 div 10)+i,(1000 div 10)+j);

    bar((75 div 10)+i,(72 div 10)+j,(215 div 10)+i,(136 div 10)+j);
    bar((75 div 10)+i,(72 div 10)+j,(145 div 10)+i,(200 div 10)+j);

    bar((250 div 10)+i,(72 div 10)+j,(285 div 10)+i,(136 div 10)+j);

    bar((320 div 10)+i,(72 div 10)+j,(355 div 10)+i,(136 div 10)+j);
    bar((320 div 10)+i,(104 div 10)+j,(460 div 10)+i,(136 div 10)+j);
    bar((390 div 10)+i,(40 div 10)+j,(425 div 10)+i,(72 div 10)+j);
    bar((460 div 10)+i,(72 div 10)+j,(495 div 10)+i,(136 div 10)+j);

    bar((530 div 10)+i,(72 div 10)+j,(565 div 10)+i,(136 div 10)+j);
    bar((530 div 10)+i,(72 div 10)+j,(750 div 10)+i,(104 div 10)+j);
    bar((715 div 10)+i,(72 div 10)+j,(750 div 10)+i,(136 div 10)+j);

    bar((1205 div 10)+i,(72 div 10)+j,(1065 div 10)+i,(136 div 10)+j);
    bar((1205 div 10)+i,(72 div 10)+j,(1135 div 10)+i,(200 div 10)+j);

    bar((1030 div 10)+i,(72 div 10)+j,(995 div 10)+i,(136 div 10)+j);

    bar((960 div 10)+i,(72 div 10)+j,(925 div 10)+i,(136 div 10)+j);
    bar((960 div 10)+i,(104 div 10)+j,(820 div 10)+i,(136 div 10)+j);
    bar((890 div 10)+i,(40 div 10)+j,(855 div 10)+i,(72 div 10)+j);
    bar((785 div 10)+i,(72 div 10)+j,(820 div 10)+i,(136 div 10)+j);

    bar((600 div 10)+i,(136 div 10)+j,(680 div 10)+i,(392 div 10)+j); //krzyz gorny
    bar((390 div 10)+i,(168 div 10)+j,(890 div 10)+i,(232 div 10)+j);

    bar((925 div 10)+i,(168 div 10)+j,(960 div 10)+i,(232 div 10)+j);
    bar((925 div 10)+i,(168 div 10)+j,(1100 div 10)+i,(200 div 10)+j);

    bar((1100 div 10)+i,(232 div 10)+j,(1065 div 10)+i,(296 div 10)+j);
    bar((1100 div 10)+i,(296 div 10)+j,(960 div 10)+i,(264 div 10)+j);

    bar((1135 div 10)+i,(264 div 10)+j,(1210 div 10)+i,(296 div 10)+j);
    bar((1170 div 10)+i,(232 div 10)+j,(1210 div 10)+i,(360 div 10)+j);

    bar((1065 div 10)+i,(328 div 10)+j,(1135 div 10)+i,(360 div 10)+j);

    bar((1030 div 10)+i,(328 div 10)+j,(960 div 10)+i,(456 div 10)+j);
    bar((995 div 10)+i,(392 div 10)+j,(1100 div 10)+i,(456 div 10)+j);

    bar((1135 div 10)+i,(392 div 10)+j,(1205 div 10)+i,(456 div 10)+j);

    bar((925 div 10)+i,(456 div 10)+j,(890 div 10)+i,(264 div 10)+j);
    bar((925 div 10)+i,(264 div 10)+j,(820 div 10)+i,(296 div 10)+j);
    bar((890 div 10)+i,(296 div 10)+j,(855 div 10)+i,(318 div 10)+j);

    bar((785 div 10)+i,(264 div 10)+j,(750 div 10)+i,(392 div 10)+j);
    bar((715 div 10)+i,(360 div 10)+j,(820 div 10)+i,(328 div 10)+j);

    bar((355 div 10)+i,(168 div 10)+j,(320 div 10)+i,(232 div 10)+j);
    bar((355 div 10)+i,(168 div 10)+j,(180 div 10)+i,(200 div 10)+j);

    bar((180 div 10)+i,(232 div 10)+j,(215 div 10)+i,(296 div 10)+j);
    bar((180 div 10)+i,(296 div 10)+j,(320 div 10)+i,(264 div 10)+j);

    bar((145 div 10)+i,(264 div 10)+j,(70 div 10)+i,(296 div 10)+j);
    bar((100 div 10)+i,(232 div 10)+j,(70 div 10)+i,(360 div 10)+j);

    bar((215 div 10)+i,(328 div 10)+j,(145 div 10)+i,(360 div 10)+j);

    bar((250 div 10)+i,(328 div 10)+j,(320 div 10)+i,(456 div 10)+j);
    bar((285 div 10)+i,(392 div 10)+j,(180 div 10)+i,(456 div 10)+j);

    bar((145 div 10)+i,(392 div 10)+j,(75 div 10)+i,(456 div 10)+j);

    bar((355 div 10)+i,(456 div 10)+j,(390 div 10)+i,(264 div 10)+j);
    bar((355 div 10)+i,(264 div 10)+j,(460 div 10)+i,(296 div 10)+j);
    bar((390 div 10)+i,(296 div 10)+j,(425 div 10)+i,(318 div 10)+j);

    bar((495 div 10)+i,(264 div 10)+j,(530 div 10)+i,(392 div 10)+j);
    bar((565 div 10)+i,(360 div 10)+j,(460 div 10)+i,(328 div 10)+j);


    bar((75 div 10)+i,(948 div 10)+j,(215 div 10)+i,(884 div 10)+j);
    bar((75 div 10)+i,(948 div 10)+j,(145 div 10)+i,(820 div 10)+j);

    bar((250 div 10)+i,(948 div 10)+j,(285 div 10)+i,(884 div 10)+j);

    bar((320 div 10)+i,(884 div 10)+j,(355 div 10)+i,(948 div 10)+j);
    bar((320 div 10)+i,(884 div 10)+j,(495 div 10)+i,(916 div 10)+j);
    bar((495 div 10)+i,(884 div 10)+j,(460 div 10)+i,(948 div 10)+j);
    bar((425 div 10)+i,(948 div 10)+j,(390 div 10)+i,(1000 div 10)+j);

    bar((530 div 10)+i,(884 div 10)+j,(565 div 10)+i,(948 div 10)+j);
    bar((530 div 10)+i,(948 div 10)+j,(750 div 10)+i,(916 div 10)+j);
    bar((715 div 10)+i,(884 div 10)+j,(750 div 10)+i,(948 div 10)+j);

    bar((785 div 10)+i,(948 div 10)+j,(820 div 10)+i,(884 div 10)+j);
    bar((785 div 10)+i,(884 div 10)+j,(960 div 10)+i,(916 div 10)+j);
    bar((925 div 10)+i,(884 div 10)+j,(960 div 10)+i,(948 div 10)+j);
    bar((890 div 10)+i,(1000 div 10)+j,(855 div 10)+i,(948 div 10)+j);

    bar((995 div 10)+i,(884 div 10)+j,(1030 div 10)+i,(948 div 10)+j);

    bar((1065 div 10)+i,(884 div 10)+j,(1205 div 10)+i,(948 div 10)+j);
    bar((1205 div 10)+i,(948 div 10)+j,(1135 div 10)+i,(820 div 10)+j);

    bar((1100 div 10)+i,(852 div 10)+j,(925 div 10)+i,(820 div 10)+j);
    bar((960 div 10)+i,(852 div 10)+j,(925 div 10)+i,(788 div 10)+j);

    bar((1100 div 10)+i,(788 div 10)+j,(1065 div 10)+i,(724 div 10)+j);
    bar((1100 div 10)+i,(724 div 10)+j,(960 div 10)+i,(756 div 10)+j);

    bar((1135 div 10)+i,(724 div 10)+j,(1205 div 10)+i,(756 div 10)+j);
    bar((1170 div 10)+i,(788 div 10)+j,(1205 div 10)+i,(660 div 10)+j);

    bar((1135 div 10)+i,(660 div 10)+j,(1065 div 10)+i,(692 div 10)+j);

    bar((1135 div 10)+i,(628 div 10)+j,(1205 div 10)+i,(564 div 10)+j);

    bar((1100 div 10)+i,(564 div 10)+j,(960 div 10)+i,(628 div 10)+j);
    bar((960 div 10)+i,(564 div 10)+j,(1030 div 10)+i,(692 div 10)+j);

    bar((925 div 10)+i,(564 div 10)+j,(893 div 10)+i,(756 div 10)+j);
    bar((925 div 10)+i,(756 div 10)+j,(858 div 10)+i,(692 div 10)+j);
    bar((925 div 10)+i,(756 div 10)+j,(821 div 10)+i,(724 div 10)+j);

    bar((820 div 10)+i,(692 div 10)+j,(715 div 10)+i,(660 div 10)+j);//may krzyz
    bar((750 div 10)+i,(628 div 10)+j,(785 div 10)+i,(756 div 10)+j);

    bar((600 div 10)+i,(884 div 10)+j,(680 div 10)+i,(628 div 10)+j); //krzyz dolny
    bar((390 div 10)+i,(852 div 10)+j,(890 div 10)+i,(788 div 10)+j);

    bar((565 div 10)+i,(692 div 10)+j,(460 div 10)+i,(660 div 10)+j);//may krzyz
    bar((530 div 10)+i,(628 div 10)+j,(495 div 10)+i,(756 div 10)+j);

    bar((355 div 10)+i,(564 div 10)+j,(390 div 10)+i,(756 div 10)+j);
    bar((355 div 10)+i,(756 div 10)+j,(425 div 10)+i,(692 div 10)+j);
    bar((355 div 10)+i,(756 div 10)+j,(460 div 10)+i,(724 div 10)+j);

    bar((320 div 10)+i,(564 div 10)+j,(180 div 10)+i,(628 div 10)+j);
    bar((320 div 10)+i,(564 div 10)+j,(250 div 10)+i,(692 div 10)+j);

    bar((75 div 10)+i,(724 div 10)+j,(145 div 10)+i,(756 div 10)+j);
    bar((75 div 10)+i,(788 div 10)+j,(110 div 10)+i,(660 div 10)+j);

    bar((145 div 10)+i,(660 div 10)+j,(225 div 10)+i,(692 div 10)+j);

    bar((75 div 10)+i,(628 div 10)+j,(145 div 10)+i,(564 div 10)+j);

    bar((180 div 10)+i,(724 div 10)+j,(320 div 10)+i,(756 div 10)+j);
    bar((180 div 10)+i,(724 div 10)+j,(215 div 10)+i,(788 div 10)+j);

    bar((180 div 10)+i,(820 div 10)+j,(355 div 10)+i,(852 div 10)+j);
    bar((320 div 10)+i,(788 div 10)+j,(355 div 10)+i,(852 div 10)+j);

    bar((40 div 10)+i,(492 div 10)+j,(145 div 10)+i,(528 div 10)+j);
    bar((180 div 10)+i,(492 div 10)+j,(285 div 10)+i,(528 div 10)+j);
    bar((320 div 10)+i,(492 div 10)+j,(425 div 10)+i,(528 div 10)+j);

    bar((1240 div 10)+i,(492 div 10)+j,(1135 div 10)+i,(528 div 10)+j);
    bar((1100 div 10)+i,(492 div 10)+j,(995 div 10)+i,(528 div 10)+j);
    bar((960 div 10)+i,(492 div 10)+j,(855 div 10)+i,(528 div 10)+j);

    bar((460 div 10)+i,(424 div 10)+j,(820 div 10)+i,(456 div 10)+j); //srodek
    bar((460 div 10)+i,(596 div 10)+j,(820 div 10)+i,(564 div 10)+j);
    bar((460 div 10)+i,(424 div 10)+j,(495 div 10)+i,(596 div 10)+j);
    bar((820 div 10)+i,(424 div 10)+j,(785 div 10)+i,(596 div 10)+j);
    setfillstyle(1,black);
    bar((565 div 10)+i,(564 div 10)+j,(715 div 10)+i,(596 div 10)+j);


                               for i:=1 to 1 do
                               begin
                               str(i,zxc);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(150,200+100*i,'BEST: ');
                               for j:=1 to 5 do outtextxy(170+100*j,300,bestt[1,3,j]);
                               for j:=1 to 4 do outtextxy(240+100*j,300,':');
                               outtextxy(880,300,'.');
                               end;

                              for i:=1 to 1 do
                              begin
                               str(i,zxc);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(150,200+300*i,'YOUR: ');
                               for j:=1 to 5 do outtextxy(170+100*j,500,wena[1,3,j]);
                               for j:=1 to 4 do outtextxy(240+100*j,500,':');
                               outtextxy(880,500,'.');
                               end;

                             setcolor(white);
                             settextstyle(TriplexFont,HorizDir,3);
                             outtextxy(250,970,'PRESS ESC TO BACK TO MAIN MENU.');
                             setcolor(white);
                             settextstyle(TriplexFont,HorizDir,3);
                             outtextxy(300,770,'PRESS 0 TO RESET HIGHSCORE.');
                             zerowanie;
                             entermap:=true;
                             graj:=false;
                             setfillstyle(1,black);
                             bar(1,1,getmaxx,getmaxy);
                             minimapy;
                             setcolor(random(10-1+1)+1);
                             settextstyle(TriplexFont,HorizDir,8);
                             outtextxy(400,100,'WHICH MAP');

                             end;
                           if km=4 then  //map4
                             begin
                                   setfillstyle(1,black);
                               bar(1,1,getmaxx,getmaxy);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(100,50,'HIGHSCORE');


                               setcolor(yellow);             //pacman d  dol
                               setfillstyle(1,yellow);
                               pieslice(100,923,35,320,30);
                               setcolor(black);
                               setfillstyle(1,black);
                               fillellipse(105,903,5,5);

                               setcolor(random(13-9+1)+9);                                    //duszek 1
                               setfillstyle(1,random(13-9+1)+9);
                               bar(1010,110,1080,125);    //+70 x
                               bar(1015,95,1075,110);
                               bar(1020,85,1070,95);
                               bar(1025,80,1065,90);
                               bar(1035,75,1055,80);
                               bar(1010,125,1020,135);
                               bar(1025,125,1040,135);
                               bar(1050,125,1065,135);
                               bar(1070,125,1080,135);
                               setfillstyle(1,black);
                               bar(1015,130,1030,135);
                               bar(1060,130,1075,135);
                               setfillstyle(1,white);                        //OCZY
                               bar(1025,90,1035,115);
                               bar(1020,95,1040,110);
                               bar(1055,90,1065,115);
                               bar(1050,95,1070,110);
                               setfillstyle(1,black);
                               bar(1025,100,1035,110);
                               bar(1055,100,1065,110);
                               //mapka
                               i:=600;
                               j:=50;
                               setcolor(black);
                               setfillstyle(1,4);
                                bar((20 div 10)+i,(20 div 10)+j,(40 div 10)+i,(1000 div 10)+j);  //obramowanie
    bar((20 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(40 div 10)+j);
    bar((1240 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(1000 div 10)+j);
    bar((20 div 10)+i,(980 div 10)+j,(1260 div 10)+i,(1000 div 10)+j);

    bar((75 div 10)+i,(72 div 10)+j,(145 div 10)+i,(200 div 10)+j);
    bar((75 div 10)+i,(104 div 10)+j,(320 div 10)+i,(168 div 10)+j);

    bar((40 div 10)+i,(232 div 10)+j,(215 div 10)+i,(264 div 10)+j);
    bar((215 div 10)+i,(232 div 10)+j,(180 div 10)+i,(456 div 10)+j);
    bar((215 div 10)+i,(552 div 10)+j,(180 div 10)+i,(776 div 10)+j);
    bar((180 div 10)+i,(776 div 10)+j,(40 div 10)+i,(744 div 10)+j);

    bar((75 div 10)+i,(712 div 10)+j,(145 div 10)+i,(680 div 10)+j);
    bar((145 div 10)+i,(712 div 10)+j,(110 div 10)+i,(648 div 10)+j);
    bar((40 div 10)+i,(648 div 10)+j,(75 div 10)+i,(584 div 10)+j);
    bar((40 div 10)+i,(584 div 10)+j,(145 div 10)+i,(616 div 10)+j);

    bar((40 div 10)+i,(552 div 10)+j,(75 div 10)+i,(456 div 10)+j);
    bar((110 div 10)+i,(552 div 10)+j,(145 div 10)+i,(456 div 10)+j);
    bar((110 div 10)+i,(488 div 10)+j,(180 div 10)+i,(520 div 10)+j);

    bar((40 div 10)+i,(424 div 10)+j,(145 div 10)+i,(392 div 10)+j);
    bar((40 div 10)+i,(424 div 10)+j,(75 div 10)+i,(360 div 10)+j);
    bar((145 div 10)+i,(360 div 10)+j,(110 div 10)+i,(296 div 10)+j);
    bar((75 div 10)+i,(296 div 10)+j,(145 div 10)+i,(328 div 10)+j);


    bar((180 div 10)+i,(40 div 10)+j,(285 div 10)+i,(72 div 10)+j);

    bar((355 div 10)+i,(72 div 10)+j,(390 div 10)+i,(232 div 10)+j);
    bar((355 div 10)+i,(72 div 10)+j,(495 div 10)+i,(104 div 10)+j);

    bar((425 div 10)+i,(136 div 10)+j,(495 div 10)+i,(200 div 10)+j);

    bar((530 div 10)+i,(136 div 10)+j,(565 div 10)+i,(40 div 10)+j);

    bar((530 div 10)+i,(168 div 10)+j,(565 div 10)+i,(264 div 10)+j);
    bar((495 div 10)+i,(232 div 10)+j,(530 div 10)+i,(296 div 10)+j);

    bar((460 div 10)+i,(232 div 10)+j,(425 div 10)+i,(296 div 10)+j);
    bar((460 div 10)+i,(296 div 10)+j,(320 div 10)+i,(264 div 10)+j);

    bar((320 div 10)+i,(232 div 10)+j,(250 div 10)+i,(200 div 10)+j);
    bar((250 div 10)+i,(200 div 10)+j,(285 div 10)+i,(328 div 10)+j);

    bar((250 div 10)+i,(360 div 10)+j,(355 div 10)+i,(392 div 10)+j);
    bar((355 div 10)+i,(392 div 10)+j,(320 div 10)+i,(328 div 10)+j);

    bar((390 div 10)+i,(328 div 10)+j,(530 div 10)+i,(360 div 10)+j);

    bar((390 div 10)+i,(392 div 10)+j,(425 div 10)+i,(616 div 10)+j);
    bar((250 div 10)+i,(424 div 10)+j,(425 div 10)+i,(456 div 10)+j);
    bar((250 div 10)+i,(584 div 10)+j,(425 div 10)+i,(616 div 10)+j);
    bar((250 div 10)+i,(552 div 10)+j,(355 div 10)+i,(488 div 10)+j);

    bar((250 div 10)+i,(648 div 10)+j,(320 div 10)+i,(680 div 10)+j);
    bar((250 div 10)+i,(648 div 10)+j,(285 div 10)+i,(712 div 10)+j);

    bar((355 div 10)+i,(648 div 10)+j,(530 div 10)+i,(680 div 10)+j);
    bar((460 div 10)+i,(680 div 10)+j,(495 div 10)+i,(600 div 10)+j);//

    bar((495 div 10)+i,(712 div 10)+j,(460 div 10)+i,(776 div 10)+j);
    bar((495 div 10)+i,(712 div 10)+j,(390 div 10)+i,(744 div 10)+j);

    bar((495 div 10)+i,(808 div 10)+j,(425 div 10)+i,(840 div 10)+j);
    bar((425 div 10)+i,(808 div 10)+j,(460 div 10)+i,(872 div 10)+j);

    bar((425 div 10)+i,(904 div 10)+j,(530 div 10)+i,(936 div 10)+j);

    bar((355 div 10)+i,(904 div 10)+j,(390 div 10)+i,(1000 div 10)+j);

    bar((390 div 10)+i,(872 div 10)+j,(355 div 10)+i,(776 div 10)+j);
    bar((355 div 10)+i,(808 div 10)+j,(320 div 10)+i,(712 div 10)+j);
    bar((320 div 10)+i,(746 div 10)+j,(250 div 10)+i,(778 div 10)+j);

    bar((75 div 10)+i,(872 div 10)+j,(145 div 10)+i,(808 div 10)+j);

    bar((75 div 10)+i,(936 div 10)+j,(320 div 10)+i,(904 div 10)+j);
    bar((180 div 10)+i,(936 div 10)+j,(215 div 10)+i,(808 div 10)+j);

    bar((320 div 10)+i,(872 div 10)+j,(250 div 10)+i,(840 div 10)+j);
    bar((250 div 10)+i,(872 div 10)+j,(285 div 10)+i,(808 div 10)+j);

    bar((1205 div 10)+i,(72 div 10)+j,(1135 div 10)+i,(200 div 10)+j);
    bar((1205 div 10)+i,(104 div 10)+j,(960 div 10)+i,(168 div 10)+j);

    bar((1240 div 10)+i,(232 div 10)+j,(1065 div 10)+i,(264 div 10)+j);
    bar((1065 div 10)+i,(232 div 10)+j,(1100 div 10)+i,(456 div 10)+j);
    bar((1065 div 10)+i,(552 div 10)+j,(1100 div 10)+i,(776 div 10)+j);
    bar((1100 div 10)+i,(776 div 10)+j,(1240 div 10)+i,(744 div 10)+j);

    bar((1205 div 10)+i,(712 div 10)+j,(1135 div 10)+i,(680 div 10)+j);
    bar((1135 div 10)+i,(712 div 10)+j,(1170 div 10)+i,(648 div 10)+j);
    bar((1240 div 10)+i,(648 div 10)+j,(1205 div 10)+i,(584 div 10)+j);
    bar((1204 div 10)+i,(584 div 10)+j,(1135 div 10)+i,(616 div 10)+j);

    bar((1240 div 10)+i,(552 div 10)+j,(1205 div 10)+i,(456 div 10)+j);
    bar((1170 div 10)+i,(552 div 10)+j,(1135 div 10)+i,(456 div 10)+j);
    bar((1170 div 10)+i,(488 div 10)+j,(1100 div 10)+i,(520 div 10)+j);

    bar((1240 div 10)+i,(424 div 10)+j,(1135 div 10)+i,(392 div 10)+j);
    bar((1240 div 10)+i,(424 div 10)+j,(1205 div 10)+i,(360 div 10)+j);
    bar((1135 div 10)+i,(360 div 10)+j,(1170 div 10)+i,(296 div 10)+j);
    bar((1205 div 10)+i,(296 div 10)+j,(1125 div 10)+i,(328 div 10)+j);


    bar((1100 div 10)+i,(40 div 10)+j,(995 div 10)+i,(72 div 10)+j);

    bar((925 div 10)+i,(72 div 10)+j,(890 div 10)+i,(232 div 10)+j);
    bar((925 div 10)+i,(72 div 10)+j,(785 div 10)+i,(104 div 10)+j);

    bar((855 div 10)+i,(136 div 10)+j,(785 div 10)+i,(200 div 10)+j);

    bar((750 div 10)+i,(136 div 10)+j,(715 div 10)+i,(40 div 10)+j);

    bar((750 div 10)+i,(168 div 10)+j,(715 div 10)+i,(264 div 10)+j);
    bar((785 div 10)+i,(232 div 10)+j,(750 div 10)+i,(296 div 10)+j);

    bar((820 div 10)+i,(232 div 10)+j,(855 div 10)+i,(296 div 10)+j);
    bar((820 div 10)+i,(296 div 10)+j,(960 div 10)+i,(264 div 10)+j);

    bar((960 div 10)+i,(232 div 10)+j,(1030 div 10)+i,(200 div 10)+j);
    bar((1030 div 10)+i,(200 div 10)+j,(995 div 10)+i,(328 div 10)+j);

    bar((1030 div 10)+i,(360 div 10)+j,(925 div 10)+i,(392 div 10)+j);
    bar((925 div 10)+i,(392 div 10)+j,(960 div 10)+i,(328 div 10)+j);

    bar((890 div 10)+i,(328 div 10)+j,(750 div 10)+i,(360 div 10)+j);

    bar((890 div 10)+i,(392 div 10)+j,(855 div 10)+i,(616 div 10)+j);
    bar((1030 div 10)+i,(424 div 10)+j,(855 div 10)+i,(456 div 10)+j);
    bar((1030 div 10)+i,(584 div 10)+j,(855 div 10)+i,(616 div 10)+j);
    bar((1030 div 10)+i,(552 div 10)+j,(925 div 10)+i,(488 div 10)+j);

    bar((1030 div 10)+i,(648 div 10)+j,(960 div 10)+i,(680 div 10)+j);
    bar((1030 div 10)+i,(648 div 10)+j,(995 div 10)+i,(712 div 10)+j);

    bar((925 div 10)+i,(648 div 10)+j,(750 div 10)+i,(680 div 10)+j);
    bar((820 div 10)+i,(680 div 10)+j,(785 div 10)+i,(600 div 10)+j);//

    bar((785 div 10)+i,(712 div 10)+j,(820 div 10)+i,(776 div 10)+j);
    bar((785 div 10)+i,(712 div 10)+j,(890 div 10)+i,(744 div 10)+j);

    bar((785 div 10)+i,(808 div 10)+j,(855 div 10)+i,(840 div 10)+j);
    bar((855 div 10)+i,(808 div 10)+j,(820 div 10)+i,(872 div 10)+j);

    bar((750 div 10)+i,(904 div 10)+j,(855 div 10)+i,(936 div 10)+j);

    bar((890 div 10)+i,(904 div 10)+j,(925 div 10)+i,(1000 div 10)+j);

    bar((890 div 10)+i,(872 div 10)+j,(925 div 10)+i,(776 div 10)+j);
    bar((925 div 10)+i,(808 div 10)+j,(960 div 10)+i,(712 div 10)+j);
    bar((960 div 10)+i,(746 div 10)+j,(1030 div 10)+i,(778 div 10)+j);

    bar((1205 div 10)+i,(872 div 10)+j,(1135 div 10)+i,(808 div 10)+j);

    bar((1205 div 10)+i,(936 div 10)+j,(960 div 10)+i,(904 div 10)+j);
    bar((1100 div 10)+i,(936 div 10)+j,(1065 div 10)+i,(808 div 10)+j);

    bar((960 div 10)+i,(872 div 10)+j,(1030 div 10)+i,(840 div 10)+j);
    bar((1030 div 10)+i,(872 div 10)+j,(995 div 10)+i,(808 div 10)+j);

    bar((565 div 10)+i,(936 div 10)+j,(715 div 10)+i,(902 div 10)+j);
    bar((600 div 10)+i,(902 div 10)+j,(680 div 10)+i,(870 div 10)+j);

    bar((600 div 10)+i,(838 div 10)+j,(530 div 10)+i,(806 div 10)+j);
    bar((530 div 10)+i,(838 div 10)+j,(565 div 10)+i,(774 div 10)+j);

    bar((680 div 10)+i,(838 div 10)+j,(750 div 10)+i,(806 div 10)+j);
    bar((750 div 10)+i,(838 div 10)+j,(725 div 10)+i,(774 div 10)+j);

    bar((530 div 10)+i,(742 div 10)+j,(750 div 10)+i,(710 div 10)+j);
    bar((565 div 10)+i,(710 div 10)+j,(715 div 10)+i,(678 div 10)+j);

    bar((565 div 10)+i,(646 div 10)+j,(715 div 10)+i,(602 div 10)+j);


    bar((565 div 10)+i,(328 div 10)+j,(715 div 10)+i,(296 div 10)+j);
    bar((600 div 10)+i,(328 div 10)+j,(680 div 10)+i,(360 div 10)+j);

    bar((600 div 10)+i,(72 div 10)+j,(680 div 10)+i,(264 div 10)+j);

    bar((460 div 10)+i,(392 div 10)+j,(820 div 10)+i,(424 div 10)+j); //srodek
    bar((460 div 10)+i,(564 div 10)+j,(820 div 10)+i,(532 div 10)+j);
    bar((460 div 10)+i,(392 div 10)+j,(495 div 10)+i,(564 div 10)+j);
    bar((820 div 10)+i,(392 div 10)+j,(785 div 10)+i,(564 div 10)+j);
    setfillstyle(1,black);
    bar((565 div 10)+i,(392 div 10)+j,(715 div 10)+i,(424 div 10)+j);


                               for i:=1 to 1 do
                               begin
                               str(i,zxc);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(150,200+100*i,'BEST: ');
                               for j:=1 to 5 do outtextxy(170+100*j,300,bestt[1,4,j]);
                               for j:=1 to 4 do outtextxy(240+100*j,300,':');
                               outtextxy(880,300,'.');
                               end;

                              for i:=1 to 1 do
                              begin
                               str(i,zxc);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(150,200+300*i,'YOUR: ');
                               for j:=1 to 5 do outtextxy(170+100*j,500,wena[1,4,j]);
                               for j:=1 to 4 do outtextxy(240+100*j,500,':');
                               outtextxy(880,500,'.');
                               end;

                             setcolor(white);
                             settextstyle(TriplexFont,HorizDir,3);
                             outtextxy(250,970,'PRESS ESC TO BACK TO MAIN MENU.');
                             setcolor(white);
                             settextstyle(TriplexFont,HorizDir,3);
                             outtextxy(300,770,'PRESS 0 TO RESET HIGHSCORE.');
                             zerowanie;
                             entermap:=true;
                             graj:=false;
                             setfillstyle(1,black);
                             bar(1,1,getmaxx,getmaxy);
                             minimapy;
                             setcolor(random(10-1+1)+1);
                             settextstyle(TriplexFont,HorizDir,8);
                             outtextxy(400,100,'WHICH MAP');

                             end;
                           if km=5 then  //map5
                             begin
                             setfillstyle(1,black);
                               bar(1,1,getmaxx,getmaxy);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(100,50,'HIGHSCORE');


                               setcolor(yellow);             //pacman d  dol
                               setfillstyle(1,yellow);
                               pieslice(100,923,35,320,30);
                               setcolor(black);
                               setfillstyle(1,black);
                               fillellipse(105,903,5,5);

                               setcolor(random(13-9+1)+9);                                    //duszek 1
                               setfillstyle(1,random(13-9+1)+9);
                               bar(1010,110,1080,125);    //+70 x
                               bar(1015,95,1075,110);
                               bar(1020,85,1070,95);
                               bar(1025,80,1065,90);
                               bar(1035,75,1055,80);
                               bar(1010,125,1020,135);
                               bar(1025,125,1040,135);
                               bar(1050,125,1065,135);
                               bar(1070,125,1080,135);
                               setfillstyle(1,black);
                               bar(1015,130,1030,135);
                               bar(1060,130,1075,135);
                               setfillstyle(1,white);                        //OCZY
                               bar(1025,90,1035,115);
                               bar(1020,95,1040,110);
                               bar(1055,90,1065,115);
                               bar(1050,95,1070,110);
                               setfillstyle(1,black);
                               bar(1025,100,1035,110);
                               bar(1055,100,1065,110);
                               //mapka
                               i:=600;
                               j:=50;
                               setcolor(black);
                               setfillstyle(1,6);
                                bar((20 div 10)+i,(20 div 10)+j,(40 div 10)+i,(1000 div 10)+j);  //obramowanie
    bar((20 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(40 div 10)+j);
    bar((1240 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(1000 div 10)+j);
    bar((20 div 10)+i,(980 div 10)+j,(1260 div 10)+i,(1000 div 10)+j);

    bar((75 div 10)+i,(72 div 10)+j,(145 div 10)+i,(104 div 10)+j); //od lewego gornego rogu
    bar((75 div 10)+i,(72 div 10)+j,(110 div 10)+i,(200 div 10)+j);
    bar((75 div 10)+i,(136 div 10)+j,(145 div 10)+i,(200 div 10)+j);
    bar((40 div 10)+i,(232 div 10)+j,(285 div 10)+i,(264 div 10)+j);
    bar((40 div 10)+i,(232 div 10)+j,(75 div 10)+i,(296 div 10)+j);
    bar((110 div 10)+i,(296 div 10)+j,(145 div 10)+i,(328 div 10)+j);
    bar((75 div 10)+i,(328 div 10)+j,(110 div 10)+i,(388 div 10)+j);
    bar((75 div 10)+i,(328 div 10)+j,(215 div 10)+i,(356 div 10)+j);
    bar((180 div 10)+i,(356 div 10)+j,(145 div 10)+i,(388 div 10)+j);
    bar((320 div 10)+i,(356 div 10)+j,(425 div 10)+i,(328 div 10)+j);
    bar((390 div 10)+i,(356 div 10)+j,(425 div 10)+i,(420 div 10)+j);
    bar((320 div 10)+i,(420 div 10)+j,(425 div 10)+i,(388 div 10)+j);
    bar((320 div 10)+i,(420 div 10)+j,(355 div 10)+i,(452 div 10)+j);
    bar((250 div 10)+i,(356 div 10)+j,(285 div 10)+i,(452 div 10)+j);
    bar((250 div 10)+i,(388 div 10)+j,(215 div 10)+i,(452 div 10)+j);
    bar((250 div 10)+i,(420 div 10)+j,(75 div 10)+i,(452 div 10)+j);
    bar((250 div 10)+i,(232 div 10)+j,(285 div 10)+i,(328 div 10)+j);
    bar((180 div 10)+i,(264 div 10)+j,(285 div 10)+i,(296 div 10)+j);
    bar((390 div 10)+i,(264 div 10)+j,(530 div 10)+i,(232 div 10)+j);
    bar((495 div 10)+i,(264 div 10)+j,(460 div 10)+i,(360 div 10)+j);
    bar((320 div 10)+i,(264 div 10)+j,(530 div 10)+i,(296 div 10)+j);
    bar((530 div 10)+i,(328 div 10)+j,(565 div 10)+i,(360 div 10)+j);
    bar((565 div 10)+i,(264 div 10)+j,(635 div 10)+i,(296 div 10)+j);
    bar((600 div 10)+i,(264 div 10)+j,(635 div 10)+i,(360 div 10)+j);
    bar((675 div 10)+i,(264 div 10)+j,(745 div 10)+i,(296 div 10)+j);
    bar((675 div 10)+i,(264 div 10)+j,(710 div 10)+i,(360 div 10)+j);
    bar((75 div 10)+i,(136 div 10)+j,(215 div 10)+i,(168 div 10)+j);
    bar((180 div 10)+i,(40 div 10)+j,(215 div 10)+i,(104 div 10)+j);
    bar((180 div 10)+i,(136 div 10)+j,(215 div 10)+i,(200 div 10)+j);
    bar((180 div 10)+i,(168 div 10)+j,(390 div 10)+i,(200 div 10)+j);
    bar((320 div 10)+i,(168 div 10)+j,(355 div 10)+i,(232 div 10)+j);
    bar((250 div 10)+i,(72 div 10)+j,(320 div 10)+i,(136 div 10)+j);
    bar((250 div 10)+i,(72 div 10)+j,(460 div 10)+i,(104 div 10)+j);
   // bar(355,72,390,200);
    bar((425 div 10)+i,(200 div 10)+j,(600 div 10)+i,(168 div 10)+j);
    bar((565 div 10)+i,(200 div 10)+j,(600 div 10)+i,(232 div 10)+j);
    bar((565 div 10)+i,(200 div 10)+j,(775 div 10)+i,(232 div 10)+j);
    bar((748 div 10)+i,(200 div 10)+j,(713 div 10)+i,(136 div 10)+j);
    bar((495 div 10)+i,(40 div 10)+j,(600 div 10)+i,(72 div 10)+j);
    bar((425 div 10)+i,(104 div 10)+j,(680 div 10)+i,(136 div 10)+j);
    bar((645 div 10)+i,(72 div 10)+j,(680 div 10)+i,(168 div 10)+j);
    bar((715 div 10)+i,(40 div 10)+j,(750 div 10)+i,(104 div 10)+j);
    bar((715 div 10)+i,(72 div 10)+j,(855 div 10)+i,(104 div 10)+j);
    bar((890 div 10)+i,(72 div 10)+j,(1030 div 10)+i,(104 div 10)+j);
    bar((995 div 10)+i,(40 div 10)+j,(1030 div 10)+i,(104 div 10)+j);
    bar((1065 div 10)+i,(72 div 10)+j,(1205 div 10)+i,(104 div 10)+j);
    bar((1170 div 10)+i,(72 div 10)+j,(1205 div 10)+i,(168 div 10)+j);
    bar((1205 div 10)+i,(136 div 10)+j,(1100 div 10)+i,(168 div 10)+j);
    bar((1100 div 10)+i,(136 div 10)+j,(1135 div 10)+i,(232 div 10)+j);
    bar((1100 div 10)+i,(200 div 10)+j,(1065 div 10)+i,(232 div 10)+j);
    bar((1065 div 10)+i,(136 div 10)+j,(785 div 10)+i,(168 div 10)+j);
    bar((1030 div 10)+i,(136 div 10)+j,(995 div 10)+i,(232 div 10)+j);
    bar((1030 div 10)+i,(200 div 10)+j,(925 div 10)+i,(232 div 10)+j);
    bar((925 div 10)+i,(232 div 10)+j,(960 div 10)+i,(296 div 10)+j);
    bar((995 div 10)+i,(264 div 10)+j,(1135 div 10)+i,(296 div 10)+j);
    bar((1170 div 10)+i,(200 div 10)+j,(1205 div 10)+i,(296 div 10)+j);
    bar((1170 div 10)+i,(200 div 10)+j,(1240 div 10)+i,(232 div 10)+j);
    bar((1100 div 10)+i,(264 div 10)+j,(1135 div 10)+i,(392 div 10)+j);
    bar((1135 div 10)+i,(360 div 10)+j,(1065 div 10)+i,(328 div 10)+j);
    bar((1170 div 10)+i,(360 div 10)+j,(1240 div 10)+i,(328 div 10)+j);
    bar((1170 div 10)+i,(392 div 10)+j,(1205 div 10)+i,(520 div 10)+j);
    bar((1170 div 10)+i,(488 div 10)+j,(1240 div 10)+i,(520 div 10)+j);
    bar((1240 div 10)+i,(552 div 10)+j,(1065 div 10)+i,(584 div 10)+j);
    bar((1205 div 10)+i,(552 div 10)+j,(1170 div 10)+i,(648 div 10)+j);
    bar((1170 div 10)+i,(616 div 10)+j,(1065 div 10)+i,(648 div 10)+j);
    bar((1205 div 10)+i,(948 div 10)+j,(1100 div 10)+i,(916 div 10)+j);
    bar((1205 div 10)+i,(948 div 10)+j,(1170 div 10)+i,(852 div 10)+j);
    bar((1135 div 10)+i,(916 div 10)+j,(1065 div 10)+i,(884 div 10)+j);
    bar((1135 div 10)+i,(948 div 10)+j,(1100 div 10)+i,(756 div 10)+j);
    bar((1135 div 10)+i,(788 div 10)+j,(995 div 10)+i,(756 div 10)+j);
    bar((1240 div 10)+i,(820 div 10)+j,(1170 div 10)+i,(788 div 10)+j);
    bar((1205 div 10)+i,(820 div 10)+j,(1170 div 10)+i,(692 div 10)+j);
    bar((1205 div 10)+i,(724 div 10)+j,(1100 div 10)+i,(692 div 10)+j);
    bar((1065 div 10)+i,(980 div 10)+j,(890 div 10)+i,(948 div 10)+j);
    bar((1030 div 10)+i,(948 div 10)+j,(925 div 10)+i,(916 div 10)+j);
    bar((1030 div 10)+i,(948 div 10)+j,(995 div 10)+i,(820 div 10)+j);
    bar((995 div 10)+i,(852 div 10)+j,(1065 div 10)+i,(820 div 10)+j);
    bar((855 div 10)+i,(948 div 10)+j,(785 div 10)+i,(916 div 10)+j);
    bar((890 div 10)+i,(916 div 10)+j,(820 div 10)+i,(884 div 10)+j);
    bar((890 div 10)+i,(916 div 10)+j,(855 div 10)+i,(820 div 10)+j);
    bar((890 div 10)+i,(852 div 10)+j,(960 div 10)+i,(884 div 10)+j);
    bar((960 div 10)+i,(820 div 10)+j,(925 div 10)+i,(756 div 10)+j);
    bar((960 div 10)+i,(788 div 10)+j,(855 div 10)+i,(756 div 10)+j);
    bar((890 div 10)+i,(788 div 10)+j,(855 div 10)+i,(692 div 10)+j);
    bar((890 div 10)+i,(724 div 10)+j,(785 div 10)+i,(692 div 10)+j);
    bar((820 div 10)+i,(724 div 10)+j,(785 div 10)+i,(596 div 10)+j);
    bar((855 div 10)+i,(564 div 10)+j,(890 div 10)+i,(660 div 10)+j); //
    bar((855 div 10)+i,(660 div 10)+j,(1030 div 10)+i,(628 div 10)+j);
    bar((960 div 10)+i,(660 div 10)+j,(925 div 10)+i,(724 div 10)+j);
    bar((960 div 10)+i,(724 div 10)+j,(1065 div 10)+i,(692 div 10)+j);
    bar((855 div 10)+i,(532 div 10)+j,(960 div 10)+i,(500 div 10)+j);   //
    bar((925 div 10)+i,(532 div 10)+j,(960 div 10)+i,(596 div 10)+j);
    bar((925 div 10)+i,(596 div 10)+j,(1030 div 10)+i,(564 div 10)+j);
    bar((995 div 10)+i,(564 div 10)+j,(1030 div 10)+i,(500 div 10)+j);
    bar((1030 div 10)+i,(500 div 10)+j,(1135 div 10)+i,(532 div 10)+j);
    bar((1100 div 10)+i,(500 div 10)+j,(1135 div 10)+i,(436 div 10)+j);
    bar((1135 div 10)+i,(436 div 10)+j,(1030 div 10)+i,(468 div 10)+j);
    bar((1030 div 10)+i,(436 div 10)+j,(1065 div 10)+i,(404 div 10)+j);
    bar((995 div 10)+i,(436 div 10)+j,(960 div 10)+i,(404 div 10)+j);
    bar((995 div 10)+i,(436 div 10)+j,(855 div 10)+i,(468 div 10)+j);
    bar((855 div 10)+i,(394 div 10)+j,(925 div 10)+i,(362 div 10)+j);
    bar((820 div 10)+i,(362 div 10)+j,(1030 div 10)+i,(330 div 10)+j);
    bar((785 div 10)+i,(298 div 10)+j,(890 div 10)+i,(266 div 10)+j);
    bar((855 div 10)+i,(330 div 10)+j,(890 div 10)+i,(202 div 10)+j);
    bar((890 div 10)+i,(202 div 10)+j,(820 div 10)+i,(234 div 10)+j);
    bar((785 div 10)+i,(362 div 10)+j,(750 div 10)+i,(330 div 10)+j);
    bar((75 div 10)+i,(948 div 10)+j,(110 div 10)+i,(884 div 10)+j);  //dol
    bar((40 div 10)+i,(852 div 10)+j,(110 div 10)+i,(820 div 10)+j);
    bar((75 div 10)+i,(820 div 10)+j,(110 div 10)+i,(692 div 10)+j);
    bar((75 div 10)+i,(692 div 10)+j,(180 div 10)+i,(724 div 10)+j);
    bar((75 div 10)+i,(628 div 10)+j,(180 div 10)+i,(660 div 10)+j);
    bar((145 div 10)+i,(692 div 10)+j,(180 div 10)+i,(628 div 10)+j);
    bar((215 div 10)+i,(692 div 10)+j,(250 div 10)+i,(660 div 10)+j);
    bar((215 div 10)+i,(692 div 10)+j,(320 div 10)+i,(724 div 10)+j);
    bar((285 div 10)+i,(724 div 10)+j,(320 div 10)+i,(596 div 10)+j);
    bar((215 div 10)+i,(596 div 10)+j,(320 div 10)+i,(628 div 10)+j);
    bar((320 div 10)+i,(596 div 10)+j,(355 div 10)+i,(660 div 10)+j);
    bar((355 div 10)+i,(692 div 10)+j,(425 div 10)+i,(724 div 10)+j);
    bar((425 div 10)+i,(596 div 10)+j,(460 div 10)+i,(628 div 10)+j);
    bar((425 div 10)+i,(724 div 10)+j,(390 div 10)+i,(532 div 10)+j);
    bar((425 div 10)+i,(468 div 10)+j,(390 div 10)+i,(500 div 10)+j);
    bar((425 div 10)+i,(564 div 10)+j,(320 div 10)+i,(532 div 10)+j);
    bar((355 div 10)+i,(564 div 10)+j,(320 div 10)+i,(500 div 10)+j);
    bar((355 div 10)+i,(532 div 10)+j,(215 div 10)+i,(500 div 10)+j);
    bar((250 div 10)+i,(500 div 10)+j,(215 div 10)+i,(564 div 10)+j);
    bar((40 div 10)+i,(500 div 10)+j,(180 div 10)+i,(532 div 10)+j);
    bar((75 div 10)+i,(500 div 10)+j,(110 div 10)+i,(596 div 10)+j);
    bar((75 div 10)+i,(596 div 10)+j,(180 div 10)+i,(564 div 10)+j);
    bar((75 div 10)+i,(948 div 10)+j,(180 div 10)+i,(916 div 10)+j);
    bar((145 div 10)+i,(948 div 10)+j,(180 div 10)+i,(820 div 10)+j);
    bar((285 div 10)+i,(852 div 10)+j,(250 div 10)+i,(756 div 10)+j);
    bar((285 div 10)+i,(756 div 10)+j,(145 div 10)+i,(788 div 10)+j);
    bar((145 div 10)+i,(852 div 10)+j,(320 div 10)+i,(820 div 10)+j);
    bar((215 div 10)+i,(884 div 10)+j,(250 div 10)+i,(980 div 10)+j);
    bar((215 div 10)+i,(948 div 10)+j,(355 div 10)+i,(916 div 10)+j);
    bar((285 div 10)+i,(820 div 10)+j,(320 div 10)+i,(884 div 10)+j);
    bar((285 div 10)+i,(884 div 10)+j,(390 div 10)+i,(852 div 10)+j);
    bar((355 div 10)+i,(884 div 10)+j,(390 div 10)+i,(756 div 10)+j);
    bar((320 div 10)+i,(788 div 10)+j,(460 div 10)+i,(756 div 10)+j);
    bar((425 div 10)+i,(756 div 10)+j,(460 div 10)+i,(948 div 10)+j);
    bar((425 div 10)+i,(948 div 10)+j,(390 div 10)+i,(916 div 10)+j);
    bar((425 div 10)+i,(884 div 10)+j,(530 div 10)+i,(852 div 10)+j);
    bar((495 div 10)+i,(884 div 10)+j,(530 div 10)+i,(820 div 10)+j);
    bar((705 div 10)+i,(980 div 10)+j,(635 div 10)+i,(948 div 10)+j);
    bar((495 div 10)+i,(948 div 10)+j,(740 div 10)+i,(916 div 10)+j);
    bar((565 div 10)+i,(916 div 10)+j,(635 div 10)+i,(884 div 10)+j);
    bar((600 div 10)+i,(884 div 10)+j,(705 div 10)+i,(852 div 10)+j);
    bar((670 div 10)+i,(852 div 10)+j,(810 div 10)+i,(820 div 10)+j);
    bar((775 div 10)+i,(852 div 10)+j,(740 div 10)+i,(884 div 10)+j);
    bar((495 div 10)+i,(852 div 10)+j,(565 div 10)+i,(820 div 10)+j);
    bar((495 div 10)+i,(788 div 10)+j,(565 div 10)+i,(756 div 10)+j);
    bar((495 div 10)+i,(788 div 10)+j,(530 div 10)+i,(596 div 10)+j);
    bar((495 div 10)+i,(660 div 10)+j,(460 div 10)+i,(724 div 10)+j);
    bar((670 div 10)+i,(660 div 10)+j,(635 div 10)+i,(596 div 10)+j);
    bar((565 div 10)+i,(596 div 10)+j,(600 div 10)+i,(724 div 10)+j);
    bar((705 div 10)+i,(596 div 10)+j,(740 div 10)+i,(724 div 10)+j);
    bar((565 div 10)+i,(724 div 10)+j,(740 div 10)+i,(692 div 10)+j);
    bar((600 div 10)+i,(724 div 10)+j,(635 div 10)+i,(820 div 10)+j);
    bar((600 div 10)+i,(788 div 10)+j,(810 div 10)+i,(756 div 10)+j);

    bar((460 div 10)+i,(392 div 10)+j,(820 div 10)+i,(424 div 10)+j); //srodek
    bar((460 div 10)+i,(564 div 10)+j,(820 div 10)+i,(532 div 10)+j);
    bar((460 div 10)+i,(392 div 10)+j,(495 div 10)+i,(564 div 10)+j);
    bar((820 div 10)+i,(392 div 10)+j,(785 div 10)+i,(564 div 10)+j);
    setfillstyle(1,black);
    bar((565 div 10)+i,(392 div 10)+j,(715 div 10)+i,(424 div 10)+j);


                               for i:=1 to 1 do
                               begin
                               str(i,zxc);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(150,200+100*i,'BEST: ');
                               for j:=1 to 5 do outtextxy(170+100*j,300,bestt[1,5,j]);
                               for j:=1 to 4 do outtextxy(240+100*j,300,':');
                               outtextxy(880,300,'.');
                               end;

                              for i:=1 to 1 do
                              begin
                               str(i,zxc);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(150,200+300*i,'YOUR: ');
                               for j:=1 to 5 do outtextxy(170+100*j,500,wena[1,5,j]);
                               for j:=1 to 4 do outtextxy(240+100*j,500,':');
                               outtextxy(880,500,'.');
                               end;

                             setcolor(white);
                             settextstyle(TriplexFont,HorizDir,3);
                             outtextxy(250,970,'PRESS ESC TO BACK TO MAIN MENU.');
                             setcolor(white);
                             settextstyle(TriplexFont,HorizDir,3);
                             outtextxy(300,770,'PRESS 0 TO RESET HIGHSCORE.');
                             zerowanie;
                             entermap:=true;
                             graj:=false;
                             setfillstyle(1,black);
                             bar(1,1,getmaxx,getmaxy);
                             minimapy;
                             setcolor(random(10-1+1)+1);
                             settextstyle(TriplexFont,HorizDir,8);
                             outtextxy(400,100,'WHICH MAP');


                             end;
                           if km=6 then  //map6
                             begin
                              setfillstyle(1,black);
                               bar(1,1,getmaxx,getmaxy);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(100,50,'HIGHSCORE');


                               setcolor(yellow);             //pacman d  dol
                               setfillstyle(1,yellow);
                               pieslice(100,923,35,320,30);
                               setcolor(black);
                               setfillstyle(1,black);
                               fillellipse(105,903,5,5);

                               setcolor(random(13-9+1)+9);                                    //duszek 1
                               setfillstyle(1,random(13-9+1)+9);
                               bar(1010,110,1080,125);    //+70 x
                               bar(1015,95,1075,110);
                               bar(1020,85,1070,95);
                               bar(1025,80,1065,90);
                               bar(1035,75,1055,80);
                               bar(1010,125,1020,135);
                               bar(1025,125,1040,135);
                               bar(1050,125,1065,135);
                               bar(1070,125,1080,135);
                               setfillstyle(1,black);
                               bar(1015,130,1030,135);
                               bar(1060,130,1075,135);
                               setfillstyle(1,white);                        //OCZY
                               bar(1025,90,1035,115);
                               bar(1020,95,1040,110);
                               bar(1055,90,1065,115);
                               bar(1050,95,1070,110);
                               setfillstyle(1,black);
                               bar(1025,100,1035,110);
                               bar(1055,100,1065,110);
                               //mapka
                               i:=600;
                               j:=50;
                               setcolor(black);
                               setfillstyle(1,random(5)+1);

    bar((20 div 10)+i,(20 div 10)+j,(40 div 10)+i,(1000 div 10)+j);  //obramowanie
    bar((20 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(40 div 10)+j);
    bar((1240 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(1000 div 10)+j);
    bar((20 div 10)+i,(980 div 10)+j,(1260 div 10)+i,(1000 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((40 div 10)+i,(75 div 10)+j,(110 div 10)+i,(110 div 10)+j);
    bar((75 div 10)+i,(75 div 10)+j,(110 div 10)+i,(180 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((145 div 10)+i,(75 div 10)+j,(250 div 10)+i,(110 div 10)+j);
    bar((180 div 10)+i,(75 div 10)+j,(215 div 10)+i,(180 div 10)+j);
    bar((215 div 10)+i,(75 div 10)+j,(250 div 10)+i,(145 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((285 div 10)+i,(75 div 10)+j,(355 div 10)+i,(110 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((425 div 10)+i,(40 div 10)+j,(495 div 10)+i,(75 div 10)+j);
    bar((460 div 10)+i,(40 div 10)+j,(495 div 10)+i,(180 div 10)+j);
    bar((460 div 10)+i,(145 div 10)+j,(530 div 10)+i,(180 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((565 div 10)+i,(40 div 10)+j,(705 div 10)+i,(75 div 10)+j);
    bar((565 div 10)+i,(110 div 10)+j,(600 div 10)+i,(180 div 10)+j);
    bar((565 div 10)+i,(145 div 10)+j,(635 div 10)+i,(180 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((565 div 10)+i,(215 div 10)+j,(600 div 10)+i,(285 div 10)+j);
    bar((530 div 10)+i,(250 div 10)+j,(670 div 10)+i,(285 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((495 div 10)+i,(320 div 10)+j,(530 div 10)+i,(390 div 10)+j);
    bar((495 div 10)+i,(320 div 10)+j,(600 div 10)+i,(355 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((530 div 10)+i,(425 div 10)+j,(425 div 10)+i,(460 div 10)+j);
    bar((425 div 10)+i,(460 div 10)+j,(460 div 10)+i,(390 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((425 div 10)+i,(355 div 10)+j,(460 div 10)+i,(250 div 10)+j);
    bar((495 div 10)+i,(285 div 10)+j,(390 div 10)+i,(250 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((390 div 10)+i,(320 div 10)+j,(320 div 10)+i,(390 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((390 div 10)+i,(425 div 10)+j,(355 div 10)+i,(495 div 10)+j);
    bar((355 div 10)+i,(460 div 10)+j,(320 div 10)+i,(565 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((285 div 10)+i,(530 div 10)+j,(180 div 10)+i,(495 div 10)+j);
    bar((215 div 10)+i,(565 div 10)+j,(250 div 10)+i,(460 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((180 div 10)+i,(460 div 10)+j,(75 div 10)+i,(425 div 10)+j);
    bar((110 div 10)+i,(425 div 10)+j,(145 div 10)+i,(495 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((180 div 10)+i,(355 div 10)+j,(250 div 10)+i,(390 div 10)+j);
    bar((215 div 10)+i,(390 div 10)+j,(285 div 10)+i,(425 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((75 div 10)+i,(390 div 10)+j,(110 div 10)+i,(285 div 10)+j);
    bar((75 div 10)+i,(285 div 10)+j,(145 div 10)+i,(320 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((180 div 10)+i,(285 div 10)+j,(285 div 10)+i,(320 div 10)+j);
    bar((285 div 10)+i,(285 div 10)+j,(250 div 10)+i,(250 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((75 div 10)+i,(250 div 10)+j,(215 div 10)+i,(215 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((250 div 10)+i,(215 div 10)+j,(425 div 10)+i,(180 div 10)+j);
    bar((285 div 10)+i,(215 div 10)+j,(320 div 10)+i,(145 div 10)+j);
    bar((390 div 10)+i,(215 div 10)+j,(425 div 10)+i,(110 div 10)+j);
    bar((320 div 10)+i,(215 div 10)+j,(355 div 10)+i,(285 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((75 div 10)+i,(945 div 10)+j,(110 div 10)+i,(840 div 10)+j);
    bar((75 div 10)+i,(875 div 10)+j,(145 div 10)+i,(910 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((145 div 10)+i,(980 div 10)+j,(250 div 10)+i,(945 div 10)+j);
    bar((215 div 10)+i,(980 div 10)+j,(180 div 10)+i,(875 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((285 div 10)+i,(980 div 10)+j,(425 div 10)+i,(945 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((495 div 10)+i,(945 div 10)+j,(565 div 10)+i,(910 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((425 div 10)+i,(910 div 10)+j,(460 div 10)+i,(805 div 10)+j);
    bar((425 div 10)+i,(875 div 10)+j,(635 div 10)+i,(840 div 10)+j);
    bar((600 div 10)+i,(910 div 10)+j,(635 div 10)+i,(805 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((495 div 10)+i,(805 div 10)+j,(565 div 10)+i,(770 div 10)+j);
    bar((495 div 10)+i,(805 div 10)+j,(530 div 10)+i,(700 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((390 div 10)+i,(665 div 10)+j,(425 div 10)+i,(525 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((425 div 10)+i,(700 div 10)+j,(460 div 10)+i,(770 div 10)+j);
    bar((425 div 10)+i,(700 div 10)+j,(390 div 10)+i,(735 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((390 div 10)+i,(770 div 10)+j,(355 div 10)+i,(910 div 10)+j);
    bar((390 div 10)+i,(770 div 10)+j,(285 div 10)+i,(805 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((320 div 10)+i,(910 div 10)+j,(250 div 10)+i,(840 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((250 div 10)+i,(770 div 10)+j,(180 div 10)+i,(805 div 10)+j);
    bar((145 div 10)+i,(805 div 10)+j,(215 div 10)+i,(840 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((40 div 10)+i,(805 div 10)+j,(75 div 10)+i,(630 div 10)+j);
    bar((40 div 10)+i,(630 div 10)+j,(110 div 10)+i,(665 div 10)+j);
    bar((40 div 10)+i,(700 div 10)+j,(145 div 10)+i,(735 div 10)+j);
    bar((110 div 10)+i,(700 div 10)+j,(145 div 10)+i,(770 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((75 div 10)+i,(595 div 10)+j,(110 div 10)+i,(525 div 10)+j);
    bar((75 div 10)+i,(525 div 10)+j,(145 div 10)+i,(560 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((180 div 10)+i,(735 div 10)+j,(215 div 10)+i,(630 div 10)+j);
    bar((145 div 10)+i,(665 div 10)+j,(180 div 10)+i,(595 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((250 div 10)+i,(595 div 10)+j,(320 div 10)+i,(630 div 10)+j);
    bar((250 div 10)+i,(595 div 10)+j,(285 div 10)+i,(665 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((250 div 10)+i,(700 div 10)+j,(355 div 10)+i,(735 div 10)+j);
    bar((320 div 10)+i,(735 div 10)+j,(355 div 10)+i,(665 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1205 div 10)+i,(945 div 10)+j,(1170 div 10)+i,(805 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1135 div 10)+i,(915 div 10)+j,(1065 div 10)+i,(880 div 10)+j);
    bar((1100 div 10)+i,(880 div 10)+j,(1065 div 10)+i,(980 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1135 div 10)+i,(845 div 10)+j,(1030 div 10)+i,(810 div 10)+j);
    bar((1065 div 10)+i,(845 div 10)+j,(1100 div 10)+i,(775 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1030 div 10)+i,(945 div 10)+j,(995 div 10)+i,(875 div 10)+j);
    bar((995 div 10)+i,(910 div 10)+j,(960 div 10)+i,(805 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((925 div 10)+i,(945 div 10)+j,(855 div 10)+i,(910 div 10)+j);
    bar((855 div 10)+i,(945 div 10)+j,(890 div 10)+i,(805 div 10)+j);
    bar((925 div 10)+i,(840 div 10)+j,(820 div 10)+i,(805 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((820 div 10)+i,(945 div 10)+j,(785 div 10)+i,(875 div 10)+j);
    bar((820 div 10)+i,(910 div 10)+j,(680 div 10)+i,(945 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((680 div 10)+i,(840 div 10)+j,(785 div 10)+i,(805 div 10)+j);
    bar((715 div 10)+i,(875 div 10)+j,(750 div 10)+i,(770 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((680 div 10)+i,(770 div 10)+j,(610 div 10)+i,(735 div 10)+j);
    bar((645 div 10)+i,(735 div 10)+j,(575 div 10)+i,(700 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((715 div 10)+i,(735 div 10)+j,(820 div 10)+i,(700 div 10)+j);
    bar((785 div 10)+i,(770 div 10)+j,(890 div 10)+i,(735 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((925 div 10)+i,(770 div 10)+j,(995 div 10)+i,(735 div 10)+j);
    bar((960 div 10)+i,(770 div 10)+j,(995 div 10)+i,(700 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1030 div 10)+i,(700 div 10)+j,(1170 div 10)+i,(735 div 10)+j);
    bar((1135 div 10)+i,(700 div 10)+j,(1170 div 10)+i,(770 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1205 div 10)+i,(700 div 10)+j,(1240 div 10)+i,(630 div 10)+j);
    bar((1205 div 10)+i,(665 div 10)+j,(1170 div 10)+i,(595 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1135 div 10)+i,(665 div 10)+j,(960 div 10)+i,(630 div 10)+j);
    bar((1030 div 10)+i,(665 div 10)+j,(1065 div 10)+i,(560 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((855 div 10)+i,(630 div 10)+j,(925 div 10)+i,(700 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((855 div 10)+i,(595 div 10)+j,(995 div 10)+i,(560 div 10)+j);
    bar((960 div 10)+i,(595 div 10)+j,(925 div 10)+i,(525 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1205 div 10)+i,(75 div 10)+j,(1065 div 10)+i,(110 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1205 div 10)+i,(145 div 10)+j,(1170 div 10)+i,(215 div 10)+j);
    bar((1205 div 10)+i,(215 div 10)+j,(1135 div 10)+i,(180 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1100 div 10)+i,(215 div 10)+j,(1030 div 10)+i,(145 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1135 div 10)+i,(285 div 10)+j,(1030 div 10)+i,(320 div 10)+j);
    bar((1065 div 10)+i,(250 div 10)+j,(1100 div 10)+i,(390 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1240 div 10)+i,(285 div 10)+j,(1205 div 10)+i,(320 div 10)+j);
    bar((1205 div 10)+i,(250 div 10)+j,(1170 div 10)+i,(355 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1205 div 10)+i,(390 div 10)+j,(1170 div 10)+i,(460 div 10)+j);
    bar((1205 div 10)+i,(460 div 10)+j,(1100 div 10)+i,(425 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1170 div 10)+i,(495 div 10)+j,(1065 div 10)+i,(530 div 10)+j);
    bar((1100 div 10)+i,(530 div 10)+j,(1205 div 10)+i,(565 div 10)+j);
    bar((1100 div 10)+i,(565 div 10)+j,(1135 div 10)+i,(600 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1030 div 10)+i,(530 div 10)+j,(995 div 10)+i,(425 div 10)+j);
    bar((1065 div 10)+i,(425 div 10)+j,(960 div 10)+i,(460 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((925 div 10)+i,(460 div 10)+j,(855 div 10)+i,(495 div 10)+j);
    bar((855 div 10)+i,(460 div 10)+j,(890 div 10)+i,(530 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((925 div 10)+i,(425 div 10)+j,(890 div 10)+i,(355 div 10)+j);
    bar((890 div 10)+i,(355 div 10)+j,(995 div 10)+i,(390 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((995 div 10)+i,(250 div 10)+j,(925 div 10)+i,(285 div 10)+j);
    bar((960 div 10)+i,(285 div 10)+j,(855 div 10)+i,(320 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((995 div 10)+i,(215 div 10)+j,(960 div 10)+i,(75 div 10)+j);
    bar((1030 div 10)+i,(75 div 10)+j,(925 div 10)+i,(110 div 10)+j);
    bar((925 div 10)+i,(110 div 10)+j,(960 div 10)+i,(145 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((890 div 10)+i,(75 div 10)+j,(750 div 10)+i,(110 div 10)+j);
    bar((855 div 10)+i,(75 div 10)+j,(820 div 10)+i,(145 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((785 div 10)+i,(145 div 10)+j,(680 div 10)+i,(180 div 10)+j);
    bar((680 div 10)+i,(215 div 10)+j,(715 div 10)+i,(110 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((820 div 10)+i,(180 div 10)+j,(925 div 10)+i,(215 div 10)+j);
    bar((890 div 10)+i,(215 div 10)+j,(855 div 10)+i,(250 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((820 div 10)+i,(250 div 10)+j,(715 div 10)+i,(285 div 10)+j);
    bar((785 div 10)+i,(250 div 10)+j,(750 div 10)+i,(215 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((680 div 10)+i,(420 div 10)+j,(575 div 10)+i,(385 div 10)+j);
    bar((645 div 10)+i,(420 div 10)+j,(610 div 10)+i,(455 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((750 div 10)+i,(320 div 10)+j,(645 div 10)+i,(355 div 10)+j);
    bar((750 div 10)+i,(320 div 10)+j,(715 div 10)+i,(455 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((785 div 10)+i,(455 div 10)+j,(820 div 10)+i,(385 div 10)+j);
    bar((820 div 10)+i,(420 div 10)+j,(855 div 10)+i,(350 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((460 div 10)+i,(490 div 10)+j,(820 div 10)+i,(665 div 10)+j); //srodek
    setfillstyle(1,black);
    bar((565 div 10)+i,(490 div 10)+j,(715 div 10)+i,(525 div 10)+j);
    bar((495 div 10)+i,(522 div 10)+j,(785 div 10)+i,(633 div 10)+j);



                               for i:=1 to 1 do
                               begin
                               str(i,zxc);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(150,200+100*i,'BEST: ');
                               for j:=1 to 5 do outtextxy(170+100*j,300,bestt[1,6,j]);
                               for j:=1 to 4 do outtextxy(240+100*j,300,':');
                               outtextxy(880,300,'.');
                               end;

                              for i:=1 to 1 do
                              begin
                               str(i,zxc);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(150,200+300*i,'YOUR: ');
                               for j:=1 to 5 do outtextxy(170+100*j,500,wena[1,6,j]);
                               for j:=1 to 4 do outtextxy(240+100*j,500,':');
                               outtextxy(880,500,'.');
                               end;

                             setcolor(white);
                             settextstyle(TriplexFont,HorizDir,3);
                             outtextxy(250,970,'PRESS ESC TO BACK TO MAIN MENU.');
                             setcolor(white);
                             settextstyle(TriplexFont,HorizDir,3);
                             outtextxy(300,770,'PRESS 0 TO RESET HIGHSCORE.');
                             zerowanie;
                             entermap:=true;
                             graj:=false;
                             setfillstyle(1,black);
                             bar(1,1,getmaxx,getmaxy);
                             minimapy;
                             setcolor(random(10-1+1)+1);
                             settextstyle(TriplexFont,HorizDir,8);
                             outtextxy(400,100,'WHICH MAP');
                             end;
                         end;
                   until entermap=false;

                     end;
                   if kt=2 then
                     begin
                      minimapy;
                      setcolor(random(10-1+1)+1);
                      settextstyle(TriplexFont,HorizDir,8);
                      outtextxy(400,100,'WHICH MAP');
                      xk:=70;
                      yk:=170;
                      km:=1;
                      switch:=2;
                      adel:=true;
                      REPEAT
                     // kursormap(xk,yk);
                      if del(adel) then inc(switch);
                      if switch mod 2=0 then kursormenutwarz(yk,xk)
                         else kursormenuzamkniety(yk,xk);
                      if switch=100 then switch:=2;



                     if keypressed then
                       begin
                         przyciskmap:=readkey;
                         przyciskmap:=upcase(przyciskmap);
                         if przyciskmap=chr(68) then
                           begin
                            kursormenuzmaz(yk,xk);
                            xk:=xk+400;
                            km:=km+1;
                           end;
                         if przyciskmap=chr(83) then
                           begin
                            kursormenuzmaz(yk,xk);
                            yk:=yk+300;
                            km:=km+3;
                           end;

                         if przyciskmap=chr(65) then
                           begin
                            kursormenuzmaz(yk,xk);
                            xk:=xk-400;
                            km:=km-1;
                           end;
                         if przyciskmap=chr(87) then
                           begin
                            kursormenuzmaz(yk,xk);
                            yk:=yk-300;
                            km:=km-3;
                           end;
                         if przyciskmap=chr(13) then graj:=true;
                         if przyciskmap=chr(13) then entermap:=false;
                       end;
                       if xk>870 then
                          begin
                           xk:=xk-400;
                           km:=km-1;
                           end;
                       if xk<0 then
                         begin
                          xk:=xk+400;
                          km:=km+1;
                         end;
                       if yk>470 then
                         begin
                          yk:=yk-300;
                          km:=km-3;
                         end;
                       if yk<100 then
                         begin
                          yk:=yk+300;
                          km:=km+3;
                         end;
                        if przyciskmap=chr(27) then
                           begin
                             setfillstyle(1,black);
                             bar(1,1,getmaxx,getmaxy);
                             entermap:=false;
                             yk:=200;
                             setcolor(random(10-1+1)+1);
                             settextstyle(TriplexFont,HorizDir,3);
                             outtextxy(400,350,'CHOOSE MODE');
                             setcolor(random(10-1+1)+1);
                             outtextxy(400,450,' Survival');
                             setcolor(random(10-1+1)+1);
                             outtextxy(400,550,' Adventure');
                             entertryb:=false;
                             przyciskmap:=chr(1);
                             xk:=240;
                             yk:=190;
                          end;

                       if graj=true then
                         begin
                           if km=1 then  //map1
                             begin
                               setfillstyle(1,black);
                               bar(1,1,getmaxx,getmaxy);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(100,50,'HIGHSCORE');


                               setcolor(yellow);             //pacman d  dol
                               setfillstyle(1,yellow);
                               pieslice(100,923,35,320,30);
                               setcolor(black);
                               setfillstyle(1,black);
                               fillellipse(105,903,5,5);

                               setcolor(random(13-9+1)+9);                                    //duszek 1
                               setfillstyle(1,random(13-9+1)+9);
                               bar(1010,110,1080,125);    //+70 x
                               bar(1015,95,1075,110);
                               bar(1020,85,1070,95);
                               bar(1025,80,1065,90);
                               bar(1035,75,1055,80);
                               bar(1010,125,1020,135);
                               bar(1025,125,1040,135);
                               bar(1050,125,1065,135);
                               bar(1070,125,1080,135);
                               setfillstyle(1,black);
                               bar(1015,130,1030,135);
                               bar(1060,130,1075,135);
                               setfillstyle(1,white);                        //OCZY
                               bar(1025,90,1035,115);
                               bar(1020,95,1040,110);
                               bar(1055,90,1065,115);
                               bar(1050,95,1070,110);
                               setfillstyle(1,black);
                               bar(1025,100,1035,110);
                               bar(1055,100,1065,110);
                               //mapka
                               i:=600;
                               j:=50;
                               setcolor(black);
                               setfillstyle(1,1);
                               bar((20 div 10)+i,(20 div 10)+j,(40 div 10)+i,(1003 div 10)+j);  //obramowanie
                               bar((20 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(40 div 10)+j);
                               bar((1240 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(1003 div 10)+j);
                               bar((20 div 10)+i,(980 div 10)+j,(1260 div 10)+i,(1003 div 10)+j);
                               bar((360 div 10)+i,(40 div 10)+j,(380 div 10)+i,(100 div 10)+j);
                               bar((879 div 10)+i,(40 div 10)+j,(899 div 10)+i,(100 div 10)+j);
                               bar((879 div 10)+i,(983 div 10)+j,(899 div 10)+i,(923 div 10)+j);
                               bar((360 div 10)+i,(983 div 10)+j,(380 div 10)+i,(923 div 10)+j);

                               bar((120 div 10)+i,(923 div 10)+j,(300 div 10)+i,(883 div 10)+j); //L lewy dolny rog
                               bar((120 div 10)+i,(923 div 10)+j,(160 div 10)+i,(562 div 10)+j);

                               bar((120 div 10)+i,(100 div 10)+j,(300 div 10)+i,(140 div 10)+j);
                               bar((120 div 10)+i,(100 div 10)+j,(160 div 10)+i,(461 div 10)+j);   //L lewy gorny rog

                               bar((440 div 10)+i,(863 div 10)+j,(819 div 10)+i,(903 div 10)+j); //duzy dolny prostokat
                               bar((440 div 10)+i,(140 div 10)+j,(819 div 10)+i,(180 div 10)+j); //duzy gorny prostokat

                               bar((1159 div 10)+i,(923 div 10)+j,(959 div 10)+i,(883 div 10)+j); //L prawy dolny rog
                               bar((1159 div 10)+i,(923 div 10)+j,(1119 div 10)+i,(562 div 10)+j);

                               bar((1159 div 10)+i,(100 div 10)+j,(959 div 10)+i,(140 div 10)+j); //L prawy gorny rog
                               bar((1159 div 10)+i,(100 div 10)+j,(1119 div 10)+i,(461 div 10)+j);

                               bar((240 div 10)+i,(240 div 10)+j,(554 div 10)+i,(280 div 10)+j); //maly gorny prostokat lewy
                               bar((999 div 10)+i,(240 div 10)+j,(685 div 10)+i,(280 div 10)+j); //maly gorny ptostokat prawy

                               bar((240 div 10)+i,(783 div 10)+j,(554 div 10)+i,(743 div 10)+j); //maly dolny prostokat lewy
                               bar((999 div 10)+i,(783 div 10)+j,(685 div 10)+i,(743 div 10)+j); //maly dolny prostokat prawy

                               bar((240 div 10)+i,(340 div 10)+j,(280 div 10)+i,(683 div 10)+j); //pionowy prostoka lewy
                               bar((959 div 10)+i,(340 div 10)+j,(999 div 10)+i,(683 div 10)+j); //puonowy prostokat prawy

                               bar((350 div 10)+i,(340 div 10)+j,(530 div 10)+i,(380 div 10)+j);//srodek
                               bar((350 div 10)+i,(340 div 10)+j,(390 div 10)+i,(643 div 10)+j);
                               bar((879 div 10)+i,(340 div 10)+j,(710 div 10)+i,(380 div 10)+j);
                               bar((879 div 10)+i,(683 div 10)+j,(350 div 10)+i,(643 div 10)+j);
                               bar((879 div 10)+i,(684 div 10)+j,(839 div 10)+i,(340 div 10)+j);

                               for i:=1 to 1 do
                               begin
                               str(i,zxc);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(150,200+100*i,'BEST: ');
                               for j:=1 to 5 do outtextxy(170+50*j,300,bestt[2,1,j]);
                               outtextxy(880,300,'.');
                               end;

                              for i:=1 to 1 do
                              begin
                               str(i,zxc);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(150,200+300*i,'YOUR: ');
                               for j:=1 to 5 do outtextxy(170+50*j,500,wena[2,1,j]);
                               outtextxy(880,500,'.');
                               end;

                             setcolor(white);
                             settextstyle(TriplexFont,HorizDir,3);
                             outtextxy(250,970,'PRESS ESC TO BACK TO MAIN MENU.');
                             setcolor(white);
                             settextstyle(TriplexFont,HorizDir,3);
                             outtextxy(300,770,'PRESS 0 TO RESET HIGHSCORE.');
                             zerowanie;
                             entermap:=true;
                             graj:=false;
                             setfillstyle(1,black);
                             bar(1,1,getmaxx,getmaxy);
                             minimapy;
                             setcolor(random(10-1+1)+1);
                             settextstyle(TriplexFont,HorizDir,8);
                             outtextxy(400,100,'WHICH MAP');

                             end;
                           if km=2 then  //map2
                             begin
                                                            setfillstyle(1,black);
                               bar(1,1,getmaxx,getmaxy);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(100,50,'HIGHSCORE');


                               setcolor(yellow);             //pacman d  dol
                               setfillstyle(1,yellow);
                               pieslice(100,923,35,320,30);
                               setcolor(black);
                               setfillstyle(1,black);
                               fillellipse(105,903,5,5);

                               setcolor(random(13-9+1)+9);                                    //duszek 1
                               setfillstyle(1,random(13-9+1)+9);
                               bar(1010,110,1080,125);    //+70 x
                               bar(1015,95,1075,110);
                               bar(1020,85,1070,95);
                               bar(1025,80,1065,90);
                               bar(1035,75,1055,80);
                               bar(1010,125,1020,135);
                               bar(1025,125,1040,135);
                               bar(1050,125,1065,135);
                               bar(1070,125,1080,135);
                               setfillstyle(1,black);
                               bar(1015,130,1030,135);
                               bar(1060,130,1075,135);
                               setfillstyle(1,white);                        //OCZY
                               bar(1025,90,1035,115);
                               bar(1020,95,1040,110);
                               bar(1055,90,1065,115);
                               bar(1050,95,1070,110);
                               setfillstyle(1,black);
                               bar(1025,100,1035,110);
                               bar(1055,100,1065,110);
                               //mapka
                               i:=600;
                               j:=50;
                               setcolor(black);
                               setfillstyle(1,5);

                                bar((20 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(39 div 10)+j);//obramowanie
                                bar((20 div 10)+i,(20 div 10)+j,(39 div 10)+i,(1004 div 10)+j);
                                bar((1241 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(1004 div 10)+j);
                                bar((39 div 10)+i,(985 div 10)+j,(1260 div 10)+i,(1004 div 10)+j);

                                bar((70 div 10)+i,(70 div 10)+j,(186 div 10)+i,(99 div 10)+j); //lewy gorny
                                bar((70 div 10)+i,(70 div 10)+j,(99 div 10)+i,(186 div 10)+j);

                                bar((70 div 10)+i,(246 div 10)+j,(99 div 10)+i,(362 div 10)+j);
                                bar((70 div 10)+i,(333 div 10)+j,(186 div 10)+i,(362 div 10)+j);

                                bar((246 div 10)+i,(70 div 10)+j,(362 div 10)+i,(99 div 10)+j);
                                bar((333 div 10)+i,(70 div 10)+j,(362 div 10)+i,(186 div 10)+j);

                                bar((333 div 10)+i,(246 div 10)+j,(362 div 10)+i,(362 div 10)+j);
                                bar((246 div 10)+i,(333 div 10)+j,(362 div 10)+i,(362 div 10)+j);

                                bar((129 div 10)+i,(129 div 10)+j,(303 div 10)+i,(158 div 10)+j);
                                bar((129 div 10)+i,(129 div 10)+j,(158 div 10)+i,(187 div 10)+j);
                                bar((303 div 10)+i,(187 div 10)+j,(274 div 10)+i,(129 div 10)+j);

                                bar((129 div 10)+i,(247 div 10)+j,(158 div 10)+i,(305 div 10)+j);
                                bar((303 div 10)+i,(247 div 10)+j,(274 div 10)+i,(305 div 10)+j);
                                bar((129 div 10)+i,(276 div 10)+j,(303 div 10)+i,(305 div 10)+j);

                                bar((187 div 10)+i,(187 div 10)+j,(245 div 10)+i,(245 div 10)+j);

                                bar((70 div 10)+i,(422 div 10)+j,(128 div 10)+i,(509 div 10)+j);//lewy srodek
                                bar((188 div 10)+i,(422 div 10)+j,(246 div 10)+i,(509 div 10)+j);
                                bar((306 div 10)+i,(422 div 10)+j,(364 div 10)+i,(509 div 10)+j); //632

                                bar((70 div 10)+i,(540 div 10)+j,(128 div 10)+i,(632 div 10)+j);
                                bar((188 div 10)+i,(540 div 10)+j,(246 div 10)+i,(632 div 10)+j);
                                bar((306 div 10)+i,(540 div 10)+j,(364 div 10)+i,(632 div 10)+j);

                                bar((70 div 10)+i,(954 div 10)+j,(186 div 10)+i,(925 div 10)+j); //lewy dol
                                bar((70 div 10)+i,(954 div 10)+j,(99 div 10)+i,(838 div 10)+j);

                                bar((246 div 10)+i,(954 div 10)+j,(362 div 10)+i,(925 div 10)+j);
                                bar((333 div 10)+i,(954 div 10)+j,(362 div 10)+i,(838 div 10)+j);

                                bar((70 div 10)+i,(662 div 10)+j,(99 div 10)+i,(778 div 10)+j);
                                bar((70 div 10)+i,(662 div 10)+j,(186 div 10)+i,(691 div 10)+j);

                                bar((246 div 10)+i,(662 div 10)+j,(362 div 10)+i,(691 div 10)+j);
                                bar((333 div 10)+i,(662 div 10)+j,(362 div 10)+i,(778 div 10)+j);

                                bar((129 div 10)+i,(895 div 10)+j,(158 div 10)+i,(838 div 10)+j);
                                bar((129 div 10)+i,(895 div 10)+j,(303 div 10)+i,(866 div 10)+j);
                                bar((303 div 10)+i,(866 div 10)+j,(274 div 10)+i,(838 div 10)+j);

                                bar((129 div 10)+i,(720 div 10)+j,(158 div 10)+i,(778 div 10)+j);
                                bar((129 div 10)+i,(720 div 10)+j,(303 div 10)+i,(749 div 10)+j);
                                bar((303 div 10)+i,(778 div 10)+j,(274 div 10)+i,(720 div 10)+j);

                                bar((188 div 10)+i,(778 div 10)+j,(246 div 10)+i,(836 div 10)+j);

                                bar((1210 div 10)+i,(70 div 10)+j,(1094 div 10)+i,(99 div 10)+j);//prawy gorny
                                bar((1210 div 10)+i,(70 div 10)+j,(1181 div 10)+i,(186 div 10)+j);

                                bar((1210 div 10)+i,(246 div 10)+j,(1181 div 10)+i,(362 div 10)+j);
                                bar((1210 div 10)+i,(362 div 10)+j,(1094 div 10)+i,(333 div 10)+j);

                                bar((1034 div 10)+i,(362 div 10)+j,(918 div 10)+i,(333 div 10)+j);
                                bar((918 div 10)+i,(362 div 10)+j,(947 div 10)+i,(246 div 10)+j);

                                bar((918 div 10)+i,(70 div 10)+j,(947 div 10)+i,(186 div 10)+j);
                                bar((918 div 10)+i,(70 div 10)+j,(1034 div 10)+i,(99 div 10)+j);

                                bar((1152 div 10)+i,(128 div 10)+j,(978 div 10)+i,(157 div 10)+j);
                                bar((1152 div 10)+i,(128 div 10)+j,(1123 div 10)+i,(186 div 10)+j);
                                bar((978 div 10)+i,(128 div 10)+j,(1007 div 10)+i,(186 div 10)+j);

                                bar((1152 div 10)+i,(303 div 10)+j,(978 div 10)+i,(274 div 10)+j);
                                bar((1152 div 10)+i,(303 div 10)+j,(1123 div 10)+i,(245 div 10)+j);
                                bar((978 div 10)+i,(303 div 10)+j,(1007 div 10)+i,(245 div 10)+j);

                                bar((1037 div 10)+i,(186 div 10)+j,(1095 div 10)+i,(245 div 10)+j);

                                bar((1210 div 10)+i,(954 div 10)+j,(1181 div 10)+i,(838 div 10)+j); //prawy dolny
                                bar((1210 div 10)+i,(954 div 10)+j,(1094 div 10)+i,(925 div 10)+j);

                                bar((1210 div 10)+i,(778 div 10)+j,(1181 div 10)+i,(662 div 10)+j);
                                bar((1210 div 10)+i,(662 div 10)+j,(1094 div 10)+i,(691 div 10)+j);


                                bar((918 div 10)+i,(778 div 10)+j,(947 div 10)+i,(662 div 10)+j);
                                bar((918 div 10)+i,(662 div 10)+j,(1034 div 10)+i,(691 div 10)+j);

                                bar((1034 div 10)+i,(954 div 10)+j,(918 div 10)+i,(925 div 10)+j);
                                bar((918 div 10)+i,(954 div 10)+j,(947 div 10)+i,(838 div 10)+j);

                                bar((1152 div 10)+i,(896 div 10)+j,(978 div 10)+i,(867 div 10)+j);
                                bar((1152 div 10)+i,(896 div 10)+j,(1123 div 10)+i,(838 div 10)+j);
                                bar((978 div 10)+i,(896 div 10)+j,(1007 div 10)+i,(838 div 10)+j);

                                bar((1152 div 10)+i,(720 div 10)+j,(978 div 10)+i,(749 div 10)+j);
                                bar((1152 div 10)+i,(720 div 10)+j,(1123 div 10)+i,(778 div 10)+j);
                                bar((978 div 10)+i,(720 div 10)+j,(1007 div 10)+i,(778 div 10)+j);

                                bar((1037 div 10)+i,(778 div 10)+j,(1095 div 10)+i,(838 div 10)+j);

                                bar((1210 div 10)+i,(422 div 10)+j,(1152 div 10)+i,(509 div 10)+j);//prawy srodek
                                bar((1092 div 10)+i,(422 div 10)+j,(1034 div 10)+i,(509 div 10)+j);
                                bar((974 div 10)+i,(422 div 10)+j,(916 div 10)+i,(509 div 10)+j); //632   60

                                bar((1210 div 10)+i,(540 div 10)+j,(1152 div 10)+i,(632 div 10)+j);
                                bar((1092 div 10)+i,(540 div 10)+j,(1034 div 10)+i,(632 div 10)+j);
                                bar((974 div 10)+i,(540 div 10)+j,(916 div 10)+i,(632 div 10)+j);

                                bar((424 div 10)+i,(954 div 10)+j,(856 div 10)+i,(922 div 10)+j);//srodek srodek dol

                                bar((586 div 10)+i,(865 div 10)+j,(694 div 10)+i,(827 div 10)+j);
                                bar((694 div 10)+i,(827 div 10)+j,(640 div 10)+i,(775 div 10)+j);
                                bar((640 div 10)+i,(775 div 10)+j,(586 div 10)+i,(733 div 10)+j);
                                bar((586 div 10)+i,(733 div 10)+j,(694 div 10)+i,(694 div 10)+j);

                                bar((423 div 10)+i,(615 div 10)+j,(856 div 10)+i,(647 div 10)+j);

                                bar((393 div 10)+i,(679 div 10)+j,(531 div 10)+i,(711 div 10)+j);
                                bar((393 div 10)+i,(679 div 10)+j,(425 div 10)+i,(890 div 10)+j);
                                bar((393 div 10)+i,(890 div 10)+j,(531 div 10)+i,(858 div 10)+j);

                                bar((454 div 10)+i,(826 div 10)+j,(518 div 10)+i,(741 div 10)+j);

                                bar((886 div 10)+i,(679 div 10)+j,(748 div 10)+i,(711 div 10)+j);
                                bar((886 div 10)+i,(679 div 10)+j,(850 div 10)+i,(890 div 10)+j);
                                bar((886 div 10)+i,(890 div 10)+j,(748 div 10)+i,(858 div 10)+j);

                                bar((748 div 10)+i,(826 div 10)+j,(819 div 10)+i,(741 div 10)+j);


                                bar((424 div 10)+i,(70 div 10)+j,(856 div 10)+i,(102 div 10)+j);//srodek srodek gora
                                bar((586 div 10)+i,(159 div 10)+j,(640 div 10)+i,(322 div 10)+j);
                                bar((586 div 10)+i,(159 div 10)+j,(670 div 10)+i,(249 div 10)+j);
                                bar((640 div 10)+i,(168 div 10)+j,(685 div 10)+i,(240 div 10)+j);
                                bar((640 div 10)+i,(177 div 10)+j,(695 div 10)+i,(231 div 10)+j);
                                bar((423 div 10)+i,(379 div 10)+j,(856 div 10)+i,(406 div 10)+j);

                                bar((393 div 10)+i,(345 div 10)+j,(531 div 10)+i,(313 div 10)+j);
                                bar((393 div 10)+i,(345 div 10)+j,(425 div 10)+i,(134 div 10)+j);
                                bar((393 div 10)+i,(134 div 10)+j,(531 div 10)+i,(166 div 10)+j);

                                bar((454 div 10)+i,(198 div 10)+j,(518 div 10)+i,(283 div 10)+j);

                                bar((886 div 10)+i,(345 div 10)+j,(748 div 10)+i,(313 div 10)+j);
                                bar((886 div 10)+i,(345 div 10)+j,(850 div 10)+i,(134 div 10)+j);
                                bar((886 div 10)+i,(134 div 10)+j,(748 div 10)+i,(166 div 10)+j);

                                bar((748 div 10)+i,(198 div 10)+j,(819 div 10)+i,(283 div 10)+j);

                                bar((402 div 10)+i,(437 div 10)+j,(878 div 10)+i,(449 div 10)+j);//srodek srodkow
                                bar((402 div 10)+i,(437 div 10)+j,(414 div 10)+i,(584 div 10)+j);
                                bar((878 div 10)+i,(437 div 10)+j,(866 div 10)+i,(584 div 10)+j);
                                bar((402 div 10)+i,(584 div 10)+j,(878 div 10)+i,(572 div 10)+j);
                                setfillstyle(1,black);
                                bar((586 div 10)+i,(437 div 10)+j,(694 div 10)+i,(449 div 10)+j);


                               for i:=1 to 1 do
                               begin
                               str(i,zxc);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(150,200+100*i,'BEST: ');
                               for j:=1 to 5 do outtextxy(170+50*j,300,bestt[2,2,j]);
                               outtextxy(880,300,'.');
                               end;

                              for i:=1 to 1 do
                              begin
                               str(i,zxc);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(150,200+300*i,'YOUR: ');
                               for j:=1 to 5 do outtextxy(170+50*j,500,wena[2,2,j]);
                               outtextxy(880,500,'.');
                               end;

                             setcolor(white);
                             settextstyle(TriplexFont,HorizDir,3);
                             outtextxy(250,970,'PRESS ESC TO BACK TO MAIN MENU.');
                             setcolor(white);
                             settextstyle(TriplexFont,HorizDir,3);
                             outtextxy(300,770,'PRESS 0 TO RESET HIGHSCORE.');
                             zerowanie;
                             entermap:=true;
                             graj:=false;
                             setfillstyle(1,black);
                             bar(1,1,getmaxx,getmaxy);
                             minimapy;
                             setcolor(random(10-1+1)+1);
                             settextstyle(TriplexFont,HorizDir,8);
                             outtextxy(400,100,'WHICH MAP');

                             end;
                           if km=3 then  //map3
                             begin
                                               setfillstyle(1,black);
                               bar(1,1,getmaxx,getmaxy);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(100,50,'HIGHSCORE');


                               setcolor(yellow);             //pacman d  dol
                               setfillstyle(1,yellow);
                               pieslice(100,923,35,320,30);
                               setcolor(black);
                               setfillstyle(1,black);
                               fillellipse(105,903,5,5);

                               setcolor(random(13-9+1)+9);                                    //duszek 1
                               setfillstyle(1,random(13-9+1)+9);
                               bar(1010,110,1080,125);    //+70 x
                               bar(1015,95,1075,110);
                               bar(1020,85,1070,95);
                               bar(1025,80,1065,90);
                               bar(1035,75,1055,80);
                               bar(1010,125,1020,135);
                               bar(1025,125,1040,135);
                               bar(1050,125,1065,135);
                               bar(1070,125,1080,135);
                               setfillstyle(1,black);
                               bar(1015,130,1030,135);
                               bar(1060,130,1075,135);
                               setfillstyle(1,white);                        //OCZY
                               bar(1025,90,1035,115);
                               bar(1020,95,1040,110);
                               bar(1055,90,1065,115);
                               bar(1050,95,1070,110);
                               setfillstyle(1,black);
                               bar(1025,100,1035,110);
                               bar(1055,100,1065,110);
                               //mapka
                               i:=600;
                               j:=50;
                               setcolor(black);
                               setfillstyle(1,3);
                               bar((20 div 10)+i,(20 div 10)+j,(40 div 10)+i,(1000 div 10)+j);  //obramowanie
    bar((20 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(40 div 10)+j);
    bar((1240 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(1000 div 10)+j);
    bar((20 div 10)+i,(980 div 10)+j,(1260 div 10)+i,(1000 div 10)+j);

    bar((75 div 10)+i,(72 div 10)+j,(215 div 10)+i,(136 div 10)+j);
    bar((75 div 10)+i,(72 div 10)+j,(145 div 10)+i,(200 div 10)+j);

    bar((250 div 10)+i,(72 div 10)+j,(285 div 10)+i,(136 div 10)+j);

    bar((320 div 10)+i,(72 div 10)+j,(355 div 10)+i,(136 div 10)+j);
    bar((320 div 10)+i,(104 div 10)+j,(460 div 10)+i,(136 div 10)+j);
    bar((390 div 10)+i,(40 div 10)+j,(425 div 10)+i,(72 div 10)+j);
    bar((460 div 10)+i,(72 div 10)+j,(495 div 10)+i,(136 div 10)+j);

    bar((530 div 10)+i,(72 div 10)+j,(565 div 10)+i,(136 div 10)+j);
    bar((530 div 10)+i,(72 div 10)+j,(750 div 10)+i,(104 div 10)+j);
    bar((715 div 10)+i,(72 div 10)+j,(750 div 10)+i,(136 div 10)+j);

    bar((1205 div 10)+i,(72 div 10)+j,(1065 div 10)+i,(136 div 10)+j);
    bar((1205 div 10)+i,(72 div 10)+j,(1135 div 10)+i,(200 div 10)+j);

    bar((1030 div 10)+i,(72 div 10)+j,(995 div 10)+i,(136 div 10)+j);

    bar((960 div 10)+i,(72 div 10)+j,(925 div 10)+i,(136 div 10)+j);
    bar((960 div 10)+i,(104 div 10)+j,(820 div 10)+i,(136 div 10)+j);
    bar((890 div 10)+i,(40 div 10)+j,(855 div 10)+i,(72 div 10)+j);
    bar((785 div 10)+i,(72 div 10)+j,(820 div 10)+i,(136 div 10)+j);

    bar((600 div 10)+i,(136 div 10)+j,(680 div 10)+i,(392 div 10)+j); //krzyz gorny
    bar((390 div 10)+i,(168 div 10)+j,(890 div 10)+i,(232 div 10)+j);

    bar((925 div 10)+i,(168 div 10)+j,(960 div 10)+i,(232 div 10)+j);
    bar((925 div 10)+i,(168 div 10)+j,(1100 div 10)+i,(200 div 10)+j);

    bar((1100 div 10)+i,(232 div 10)+j,(1065 div 10)+i,(296 div 10)+j);
    bar((1100 div 10)+i,(296 div 10)+j,(960 div 10)+i,(264 div 10)+j);

    bar((1135 div 10)+i,(264 div 10)+j,(1210 div 10)+i,(296 div 10)+j);
    bar((1170 div 10)+i,(232 div 10)+j,(1210 div 10)+i,(360 div 10)+j);

    bar((1065 div 10)+i,(328 div 10)+j,(1135 div 10)+i,(360 div 10)+j);

    bar((1030 div 10)+i,(328 div 10)+j,(960 div 10)+i,(456 div 10)+j);
    bar((995 div 10)+i,(392 div 10)+j,(1100 div 10)+i,(456 div 10)+j);

    bar((1135 div 10)+i,(392 div 10)+j,(1205 div 10)+i,(456 div 10)+j);

    bar((925 div 10)+i,(456 div 10)+j,(890 div 10)+i,(264 div 10)+j);
    bar((925 div 10)+i,(264 div 10)+j,(820 div 10)+i,(296 div 10)+j);
    bar((890 div 10)+i,(296 div 10)+j,(855 div 10)+i,(318 div 10)+j);

    bar((785 div 10)+i,(264 div 10)+j,(750 div 10)+i,(392 div 10)+j);
    bar((715 div 10)+i,(360 div 10)+j,(820 div 10)+i,(328 div 10)+j);

    bar((355 div 10)+i,(168 div 10)+j,(320 div 10)+i,(232 div 10)+j);
    bar((355 div 10)+i,(168 div 10)+j,(180 div 10)+i,(200 div 10)+j);

    bar((180 div 10)+i,(232 div 10)+j,(215 div 10)+i,(296 div 10)+j);
    bar((180 div 10)+i,(296 div 10)+j,(320 div 10)+i,(264 div 10)+j);

    bar((145 div 10)+i,(264 div 10)+j,(70 div 10)+i,(296 div 10)+j);
    bar((100 div 10)+i,(232 div 10)+j,(70 div 10)+i,(360 div 10)+j);

    bar((215 div 10)+i,(328 div 10)+j,(145 div 10)+i,(360 div 10)+j);

    bar((250 div 10)+i,(328 div 10)+j,(320 div 10)+i,(456 div 10)+j);
    bar((285 div 10)+i,(392 div 10)+j,(180 div 10)+i,(456 div 10)+j);

    bar((145 div 10)+i,(392 div 10)+j,(75 div 10)+i,(456 div 10)+j);

    bar((355 div 10)+i,(456 div 10)+j,(390 div 10)+i,(264 div 10)+j);
    bar((355 div 10)+i,(264 div 10)+j,(460 div 10)+i,(296 div 10)+j);
    bar((390 div 10)+i,(296 div 10)+j,(425 div 10)+i,(318 div 10)+j);

    bar((495 div 10)+i,(264 div 10)+j,(530 div 10)+i,(392 div 10)+j);
    bar((565 div 10)+i,(360 div 10)+j,(460 div 10)+i,(328 div 10)+j);


    bar((75 div 10)+i,(948 div 10)+j,(215 div 10)+i,(884 div 10)+j);
    bar((75 div 10)+i,(948 div 10)+j,(145 div 10)+i,(820 div 10)+j);

    bar((250 div 10)+i,(948 div 10)+j,(285 div 10)+i,(884 div 10)+j);

    bar((320 div 10)+i,(884 div 10)+j,(355 div 10)+i,(948 div 10)+j);
    bar((320 div 10)+i,(884 div 10)+j,(495 div 10)+i,(916 div 10)+j);
    bar((495 div 10)+i,(884 div 10)+j,(460 div 10)+i,(948 div 10)+j);
    bar((425 div 10)+i,(948 div 10)+j,(390 div 10)+i,(1000 div 10)+j);

    bar((530 div 10)+i,(884 div 10)+j,(565 div 10)+i,(948 div 10)+j);
    bar((530 div 10)+i,(948 div 10)+j,(750 div 10)+i,(916 div 10)+j);
    bar((715 div 10)+i,(884 div 10)+j,(750 div 10)+i,(948 div 10)+j);

    bar((785 div 10)+i,(948 div 10)+j,(820 div 10)+i,(884 div 10)+j);
    bar((785 div 10)+i,(884 div 10)+j,(960 div 10)+i,(916 div 10)+j);
    bar((925 div 10)+i,(884 div 10)+j,(960 div 10)+i,(948 div 10)+j);
    bar((890 div 10)+i,(1000 div 10)+j,(855 div 10)+i,(948 div 10)+j);

    bar((995 div 10)+i,(884 div 10)+j,(1030 div 10)+i,(948 div 10)+j);

    bar((1065 div 10)+i,(884 div 10)+j,(1205 div 10)+i,(948 div 10)+j);
    bar((1205 div 10)+i,(948 div 10)+j,(1135 div 10)+i,(820 div 10)+j);

    bar((1100 div 10)+i,(852 div 10)+j,(925 div 10)+i,(820 div 10)+j);
    bar((960 div 10)+i,(852 div 10)+j,(925 div 10)+i,(788 div 10)+j);

    bar((1100 div 10)+i,(788 div 10)+j,(1065 div 10)+i,(724 div 10)+j);
    bar((1100 div 10)+i,(724 div 10)+j,(960 div 10)+i,(756 div 10)+j);

    bar((1135 div 10)+i,(724 div 10)+j,(1205 div 10)+i,(756 div 10)+j);
    bar((1170 div 10)+i,(788 div 10)+j,(1205 div 10)+i,(660 div 10)+j);

    bar((1135 div 10)+i,(660 div 10)+j,(1065 div 10)+i,(692 div 10)+j);

    bar((1135 div 10)+i,(628 div 10)+j,(1205 div 10)+i,(564 div 10)+j);

    bar((1100 div 10)+i,(564 div 10)+j,(960 div 10)+i,(628 div 10)+j);
    bar((960 div 10)+i,(564 div 10)+j,(1030 div 10)+i,(692 div 10)+j);

    bar((925 div 10)+i,(564 div 10)+j,(893 div 10)+i,(756 div 10)+j);
    bar((925 div 10)+i,(756 div 10)+j,(858 div 10)+i,(692 div 10)+j);
    bar((925 div 10)+i,(756 div 10)+j,(821 div 10)+i,(724 div 10)+j);

    bar((820 div 10)+i,(692 div 10)+j,(715 div 10)+i,(660 div 10)+j);//may krzyz
    bar((750 div 10)+i,(628 div 10)+j,(785 div 10)+i,(756 div 10)+j);

    bar((600 div 10)+i,(884 div 10)+j,(680 div 10)+i,(628 div 10)+j); //krzyz dolny
    bar((390 div 10)+i,(852 div 10)+j,(890 div 10)+i,(788 div 10)+j);

    bar((565 div 10)+i,(692 div 10)+j,(460 div 10)+i,(660 div 10)+j);//may krzyz
    bar((530 div 10)+i,(628 div 10)+j,(495 div 10)+i,(756 div 10)+j);

    bar((355 div 10)+i,(564 div 10)+j,(390 div 10)+i,(756 div 10)+j);
    bar((355 div 10)+i,(756 div 10)+j,(425 div 10)+i,(692 div 10)+j);
    bar((355 div 10)+i,(756 div 10)+j,(460 div 10)+i,(724 div 10)+j);

    bar((320 div 10)+i,(564 div 10)+j,(180 div 10)+i,(628 div 10)+j);
    bar((320 div 10)+i,(564 div 10)+j,(250 div 10)+i,(692 div 10)+j);

    bar((75 div 10)+i,(724 div 10)+j,(145 div 10)+i,(756 div 10)+j);
    bar((75 div 10)+i,(788 div 10)+j,(110 div 10)+i,(660 div 10)+j);

    bar((145 div 10)+i,(660 div 10)+j,(225 div 10)+i,(692 div 10)+j);

    bar((75 div 10)+i,(628 div 10)+j,(145 div 10)+i,(564 div 10)+j);

    bar((180 div 10)+i,(724 div 10)+j,(320 div 10)+i,(756 div 10)+j);
    bar((180 div 10)+i,(724 div 10)+j,(215 div 10)+i,(788 div 10)+j);

    bar((180 div 10)+i,(820 div 10)+j,(355 div 10)+i,(852 div 10)+j);
    bar((320 div 10)+i,(788 div 10)+j,(355 div 10)+i,(852 div 10)+j);

    bar((40 div 10)+i,(492 div 10)+j,(145 div 10)+i,(528 div 10)+j);
    bar((180 div 10)+i,(492 div 10)+j,(285 div 10)+i,(528 div 10)+j);
    bar((320 div 10)+i,(492 div 10)+j,(425 div 10)+i,(528 div 10)+j);

    bar((1240 div 10)+i,(492 div 10)+j,(1135 div 10)+i,(528 div 10)+j);
    bar((1100 div 10)+i,(492 div 10)+j,(995 div 10)+i,(528 div 10)+j);
    bar((960 div 10)+i,(492 div 10)+j,(855 div 10)+i,(528 div 10)+j);

    bar((460 div 10)+i,(424 div 10)+j,(820 div 10)+i,(456 div 10)+j); //srodek
    bar((460 div 10)+i,(596 div 10)+j,(820 div 10)+i,(564 div 10)+j);
    bar((460 div 10)+i,(424 div 10)+j,(495 div 10)+i,(596 div 10)+j);
    bar((820 div 10)+i,(424 div 10)+j,(785 div 10)+i,(596 div 10)+j);
    setfillstyle(1,black);
    bar((565 div 10)+i,(564 div 10)+j,(715 div 10)+i,(596 div 10)+j);


                               for i:=1 to 1 do
                               begin
                               str(i,zxc);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(150,200+100*i,'BEST: ');
                               for j:=1 to 5 do outtextxy(170+50*j,300,bestt[2,3,j]);
                               outtextxy(880,300,'.');
                               end;

                              for i:=1 to 1 do
                              begin
                               str(i,zxc);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(150,200+300*i,'YOUR: ');
                               for j:=1 to 5 do outtextxy(170+50*j,500,wena[2,3,j]);
                               outtextxy(880,500,'.');
                               end;

                             setcolor(white);
                             settextstyle(TriplexFont,HorizDir,3);
                             outtextxy(250,970,'PRESS ESC TO BACK TO MAIN MENU.');
                             setcolor(white);
                             settextstyle(TriplexFont,HorizDir,3);
                             outtextxy(300,770,'PRESS 0 TO RESET HIGHSCORE.');
                             zerowanie;
                             entermap:=true;
                             graj:=false;
                             setfillstyle(1,black);
                             bar(1,1,getmaxx,getmaxy);
                             minimapy;
                             setcolor(random(10-1+1)+1);
                             settextstyle(TriplexFont,HorizDir,8);
                             outtextxy(400,100,'WHICH MAP');

                             end;
                           if km=4 then  //map4
                             begin
                                                              setfillstyle(1,black);
                               bar(1,1,getmaxx,getmaxy);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(100,50,'HIGHSCORE');


                               setcolor(yellow);             //pacman d  dol
                               setfillstyle(1,yellow);
                               pieslice(100,923,35,320,30);
                               setcolor(black);
                               setfillstyle(1,black);
                               fillellipse(105,903,5,5);

                               setcolor(random(13-9+1)+9);                                    //duszek 1
                               setfillstyle(1,random(13-9+1)+9);
                               bar(1010,110,1080,125);    //+70 x
                               bar(1015,95,1075,110);
                               bar(1020,85,1070,95);
                               bar(1025,80,1065,90);
                               bar(1035,75,1055,80);
                               bar(1010,125,1020,135);
                               bar(1025,125,1040,135);
                               bar(1050,125,1065,135);
                               bar(1070,125,1080,135);
                               setfillstyle(1,black);
                               bar(1015,130,1030,135);
                               bar(1060,130,1075,135);
                               setfillstyle(1,white);                        //OCZY
                               bar(1025,90,1035,115);
                               bar(1020,95,1040,110);
                               bar(1055,90,1065,115);
                               bar(1050,95,1070,110);
                               setfillstyle(1,black);
                               bar(1025,100,1035,110);
                               bar(1055,100,1065,110);
                               //mapka
                               i:=600;
                               j:=50;
                               setcolor(black);
                               setfillstyle(1,4);
                                bar((20 div 10)+i,(20 div 10)+j,(40 div 10)+i,(1000 div 10)+j);  //obramowanie
    bar((20 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(40 div 10)+j);
    bar((1240 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(1000 div 10)+j);
    bar((20 div 10)+i,(980 div 10)+j,(1260 div 10)+i,(1000 div 10)+j);

    bar((75 div 10)+i,(72 div 10)+j,(145 div 10)+i,(200 div 10)+j);
    bar((75 div 10)+i,(104 div 10)+j,(320 div 10)+i,(168 div 10)+j);

    bar((40 div 10)+i,(232 div 10)+j,(215 div 10)+i,(264 div 10)+j);
    bar((215 div 10)+i,(232 div 10)+j,(180 div 10)+i,(456 div 10)+j);
    bar((215 div 10)+i,(552 div 10)+j,(180 div 10)+i,(776 div 10)+j);
    bar((180 div 10)+i,(776 div 10)+j,(40 div 10)+i,(744 div 10)+j);

    bar((75 div 10)+i,(712 div 10)+j,(145 div 10)+i,(680 div 10)+j);
    bar((145 div 10)+i,(712 div 10)+j,(110 div 10)+i,(648 div 10)+j);
    bar((40 div 10)+i,(648 div 10)+j,(75 div 10)+i,(584 div 10)+j);
    bar((40 div 10)+i,(584 div 10)+j,(145 div 10)+i,(616 div 10)+j);

    bar((40 div 10)+i,(552 div 10)+j,(75 div 10)+i,(456 div 10)+j);
    bar((110 div 10)+i,(552 div 10)+j,(145 div 10)+i,(456 div 10)+j);
    bar((110 div 10)+i,(488 div 10)+j,(180 div 10)+i,(520 div 10)+j);

    bar((40 div 10)+i,(424 div 10)+j,(145 div 10)+i,(392 div 10)+j);
    bar((40 div 10)+i,(424 div 10)+j,(75 div 10)+i,(360 div 10)+j);
    bar((145 div 10)+i,(360 div 10)+j,(110 div 10)+i,(296 div 10)+j);
    bar((75 div 10)+i,(296 div 10)+j,(145 div 10)+i,(328 div 10)+j);


    bar((180 div 10)+i,(40 div 10)+j,(285 div 10)+i,(72 div 10)+j);

    bar((355 div 10)+i,(72 div 10)+j,(390 div 10)+i,(232 div 10)+j);
    bar((355 div 10)+i,(72 div 10)+j,(495 div 10)+i,(104 div 10)+j);

    bar((425 div 10)+i,(136 div 10)+j,(495 div 10)+i,(200 div 10)+j);

    bar((530 div 10)+i,(136 div 10)+j,(565 div 10)+i,(40 div 10)+j);

    bar((530 div 10)+i,(168 div 10)+j,(565 div 10)+i,(264 div 10)+j);
    bar((495 div 10)+i,(232 div 10)+j,(530 div 10)+i,(296 div 10)+j);

    bar((460 div 10)+i,(232 div 10)+j,(425 div 10)+i,(296 div 10)+j);
    bar((460 div 10)+i,(296 div 10)+j,(320 div 10)+i,(264 div 10)+j);

    bar((320 div 10)+i,(232 div 10)+j,(250 div 10)+i,(200 div 10)+j);
    bar((250 div 10)+i,(200 div 10)+j,(285 div 10)+i,(328 div 10)+j);

    bar((250 div 10)+i,(360 div 10)+j,(355 div 10)+i,(392 div 10)+j);
    bar((355 div 10)+i,(392 div 10)+j,(320 div 10)+i,(328 div 10)+j);

    bar((390 div 10)+i,(328 div 10)+j,(530 div 10)+i,(360 div 10)+j);

    bar((390 div 10)+i,(392 div 10)+j,(425 div 10)+i,(616 div 10)+j);
    bar((250 div 10)+i,(424 div 10)+j,(425 div 10)+i,(456 div 10)+j);
    bar((250 div 10)+i,(584 div 10)+j,(425 div 10)+i,(616 div 10)+j);
    bar((250 div 10)+i,(552 div 10)+j,(355 div 10)+i,(488 div 10)+j);

    bar((250 div 10)+i,(648 div 10)+j,(320 div 10)+i,(680 div 10)+j);
    bar((250 div 10)+i,(648 div 10)+j,(285 div 10)+i,(712 div 10)+j);

    bar((355 div 10)+i,(648 div 10)+j,(530 div 10)+i,(680 div 10)+j);
    bar((460 div 10)+i,(680 div 10)+j,(495 div 10)+i,(600 div 10)+j);//

    bar((495 div 10)+i,(712 div 10)+j,(460 div 10)+i,(776 div 10)+j);
    bar((495 div 10)+i,(712 div 10)+j,(390 div 10)+i,(744 div 10)+j);

    bar((495 div 10)+i,(808 div 10)+j,(425 div 10)+i,(840 div 10)+j);
    bar((425 div 10)+i,(808 div 10)+j,(460 div 10)+i,(872 div 10)+j);

    bar((425 div 10)+i,(904 div 10)+j,(530 div 10)+i,(936 div 10)+j);

    bar((355 div 10)+i,(904 div 10)+j,(390 div 10)+i,(1000 div 10)+j);

    bar((390 div 10)+i,(872 div 10)+j,(355 div 10)+i,(776 div 10)+j);
    bar((355 div 10)+i,(808 div 10)+j,(320 div 10)+i,(712 div 10)+j);
    bar((320 div 10)+i,(746 div 10)+j,(250 div 10)+i,(778 div 10)+j);

    bar((75 div 10)+i,(872 div 10)+j,(145 div 10)+i,(808 div 10)+j);

    bar((75 div 10)+i,(936 div 10)+j,(320 div 10)+i,(904 div 10)+j);
    bar((180 div 10)+i,(936 div 10)+j,(215 div 10)+i,(808 div 10)+j);

    bar((320 div 10)+i,(872 div 10)+j,(250 div 10)+i,(840 div 10)+j);
    bar((250 div 10)+i,(872 div 10)+j,(285 div 10)+i,(808 div 10)+j);

    bar((1205 div 10)+i,(72 div 10)+j,(1135 div 10)+i,(200 div 10)+j);
    bar((1205 div 10)+i,(104 div 10)+j,(960 div 10)+i,(168 div 10)+j);

    bar((1240 div 10)+i,(232 div 10)+j,(1065 div 10)+i,(264 div 10)+j);
    bar((1065 div 10)+i,(232 div 10)+j,(1100 div 10)+i,(456 div 10)+j);
    bar((1065 div 10)+i,(552 div 10)+j,(1100 div 10)+i,(776 div 10)+j);
    bar((1100 div 10)+i,(776 div 10)+j,(1240 div 10)+i,(744 div 10)+j);

    bar((1205 div 10)+i,(712 div 10)+j,(1135 div 10)+i,(680 div 10)+j);
    bar((1135 div 10)+i,(712 div 10)+j,(1170 div 10)+i,(648 div 10)+j);
    bar((1240 div 10)+i,(648 div 10)+j,(1205 div 10)+i,(584 div 10)+j);
    bar((1204 div 10)+i,(584 div 10)+j,(1135 div 10)+i,(616 div 10)+j);

    bar((1240 div 10)+i,(552 div 10)+j,(1205 div 10)+i,(456 div 10)+j);
    bar((1170 div 10)+i,(552 div 10)+j,(1135 div 10)+i,(456 div 10)+j);
    bar((1170 div 10)+i,(488 div 10)+j,(1100 div 10)+i,(520 div 10)+j);

    bar((1240 div 10)+i,(424 div 10)+j,(1135 div 10)+i,(392 div 10)+j);
    bar((1240 div 10)+i,(424 div 10)+j,(1205 div 10)+i,(360 div 10)+j);
    bar((1135 div 10)+i,(360 div 10)+j,(1170 div 10)+i,(296 div 10)+j);
    bar((1205 div 10)+i,(296 div 10)+j,(1125 div 10)+i,(328 div 10)+j);


    bar((1100 div 10)+i,(40 div 10)+j,(995 div 10)+i,(72 div 10)+j);

    bar((925 div 10)+i,(72 div 10)+j,(890 div 10)+i,(232 div 10)+j);
    bar((925 div 10)+i,(72 div 10)+j,(785 div 10)+i,(104 div 10)+j);

    bar((855 div 10)+i,(136 div 10)+j,(785 div 10)+i,(200 div 10)+j);

    bar((750 div 10)+i,(136 div 10)+j,(715 div 10)+i,(40 div 10)+j);

    bar((750 div 10)+i,(168 div 10)+j,(715 div 10)+i,(264 div 10)+j);
    bar((785 div 10)+i,(232 div 10)+j,(750 div 10)+i,(296 div 10)+j);

    bar((820 div 10)+i,(232 div 10)+j,(855 div 10)+i,(296 div 10)+j);
    bar((820 div 10)+i,(296 div 10)+j,(960 div 10)+i,(264 div 10)+j);

    bar((960 div 10)+i,(232 div 10)+j,(1030 div 10)+i,(200 div 10)+j);
    bar((1030 div 10)+i,(200 div 10)+j,(995 div 10)+i,(328 div 10)+j);

    bar((1030 div 10)+i,(360 div 10)+j,(925 div 10)+i,(392 div 10)+j);
    bar((925 div 10)+i,(392 div 10)+j,(960 div 10)+i,(328 div 10)+j);

    bar((890 div 10)+i,(328 div 10)+j,(750 div 10)+i,(360 div 10)+j);

    bar((890 div 10)+i,(392 div 10)+j,(855 div 10)+i,(616 div 10)+j);
    bar((1030 div 10)+i,(424 div 10)+j,(855 div 10)+i,(456 div 10)+j);
    bar((1030 div 10)+i,(584 div 10)+j,(855 div 10)+i,(616 div 10)+j);
    bar((1030 div 10)+i,(552 div 10)+j,(925 div 10)+i,(488 div 10)+j);

    bar((1030 div 10)+i,(648 div 10)+j,(960 div 10)+i,(680 div 10)+j);
    bar((1030 div 10)+i,(648 div 10)+j,(995 div 10)+i,(712 div 10)+j);

    bar((925 div 10)+i,(648 div 10)+j,(750 div 10)+i,(680 div 10)+j);
    bar((820 div 10)+i,(680 div 10)+j,(785 div 10)+i,(600 div 10)+j);//

    bar((785 div 10)+i,(712 div 10)+j,(820 div 10)+i,(776 div 10)+j);
    bar((785 div 10)+i,(712 div 10)+j,(890 div 10)+i,(744 div 10)+j);

    bar((785 div 10)+i,(808 div 10)+j,(855 div 10)+i,(840 div 10)+j);
    bar((855 div 10)+i,(808 div 10)+j,(820 div 10)+i,(872 div 10)+j);

    bar((750 div 10)+i,(904 div 10)+j,(855 div 10)+i,(936 div 10)+j);

    bar((890 div 10)+i,(904 div 10)+j,(925 div 10)+i,(1000 div 10)+j);

    bar((890 div 10)+i,(872 div 10)+j,(925 div 10)+i,(776 div 10)+j);
    bar((925 div 10)+i,(808 div 10)+j,(960 div 10)+i,(712 div 10)+j);
    bar((960 div 10)+i,(746 div 10)+j,(1030 div 10)+i,(778 div 10)+j);

    bar((1205 div 10)+i,(872 div 10)+j,(1135 div 10)+i,(808 div 10)+j);

    bar((1205 div 10)+i,(936 div 10)+j,(960 div 10)+i,(904 div 10)+j);
    bar((1100 div 10)+i,(936 div 10)+j,(1065 div 10)+i,(808 div 10)+j);

    bar((960 div 10)+i,(872 div 10)+j,(1030 div 10)+i,(840 div 10)+j);
    bar((1030 div 10)+i,(872 div 10)+j,(995 div 10)+i,(808 div 10)+j);

    bar((565 div 10)+i,(936 div 10)+j,(715 div 10)+i,(902 div 10)+j);
    bar((600 div 10)+i,(902 div 10)+j,(680 div 10)+i,(870 div 10)+j);

    bar((600 div 10)+i,(838 div 10)+j,(530 div 10)+i,(806 div 10)+j);
    bar((530 div 10)+i,(838 div 10)+j,(565 div 10)+i,(774 div 10)+j);

    bar((680 div 10)+i,(838 div 10)+j,(750 div 10)+i,(806 div 10)+j);
    bar((750 div 10)+i,(838 div 10)+j,(725 div 10)+i,(774 div 10)+j);

    bar((530 div 10)+i,(742 div 10)+j,(750 div 10)+i,(710 div 10)+j);
    bar((565 div 10)+i,(710 div 10)+j,(715 div 10)+i,(678 div 10)+j);

    bar((565 div 10)+i,(646 div 10)+j,(715 div 10)+i,(602 div 10)+j);


    bar((565 div 10)+i,(328 div 10)+j,(715 div 10)+i,(296 div 10)+j);
    bar((600 div 10)+i,(328 div 10)+j,(680 div 10)+i,(360 div 10)+j);

    bar((600 div 10)+i,(72 div 10)+j,(680 div 10)+i,(264 div 10)+j);

    bar((460 div 10)+i,(392 div 10)+j,(820 div 10)+i,(424 div 10)+j); //srodek
    bar((460 div 10)+i,(564 div 10)+j,(820 div 10)+i,(532 div 10)+j);
    bar((460 div 10)+i,(392 div 10)+j,(495 div 10)+i,(564 div 10)+j);
    bar((820 div 10)+i,(392 div 10)+j,(785 div 10)+i,(564 div 10)+j);
    setfillstyle(1,black);
    bar((565 div 10)+i,(392 div 10)+j,(715 div 10)+i,(424 div 10)+j);


                               for i:=1 to 1 do
                               begin
                               str(i,zxc);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(150,200+100*i,'BEST: ');
                               for j:=1 to 5 do outtextxy(170+50*j,300,bestt[2,4,j]);
                               outtextxy(880,300,'.');
                               end;

                              for i:=1 to 1 do
                              begin
                               str(i,zxc);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(150,200+300*i,'YOUR: ');
                               for j:=1 to 5 do outtextxy(170+50*j,500,wena[2,4,j]);
                               outtextxy(880,500,'.');
                               end;

                             setcolor(white);
                             settextstyle(TriplexFont,HorizDir,3);
                             outtextxy(250,970,'PRESS ESC TO BACK TO MAIN MENU.');
                             setcolor(white);
                             settextstyle(TriplexFont,HorizDir,3);
                             outtextxy(300,770,'PRESS 0 TO RESET HIGHSCORE.');
                             zerowanie;
                             entermap:=true;
                             graj:=false;
                             setfillstyle(1,black);
                             bar(1,1,getmaxx,getmaxy);
                             minimapy;
                             setcolor(random(10-1+1)+1);
                             settextstyle(TriplexFont,HorizDir,8);
                             outtextxy(400,100,'WHICH MAP');

                             end;
                           if km=5 then  //map5
                             begin
                              setfillstyle(1,black);
                               bar(1,1,getmaxx,getmaxy);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(100,50,'HIGHSCORE');


                               setcolor(yellow);             //pacman d  dol
                               setfillstyle(1,yellow);
                               pieslice(100,923,35,320,30);
                               setcolor(black);
                               setfillstyle(1,black);
                               fillellipse(105,903,5,5);

                               setcolor(random(13-9+1)+9);                                    //duszek 1
                               setfillstyle(1,random(13-9+1)+9);
                               bar(1010,110,1080,125);    //+70 x
                               bar(1015,95,1075,110);
                               bar(1020,85,1070,95);
                               bar(1025,80,1065,90);
                               bar(1035,75,1055,80);
                               bar(1010,125,1020,135);
                               bar(1025,125,1040,135);
                               bar(1050,125,1065,135);
                               bar(1070,125,1080,135);
                               setfillstyle(1,black);
                               bar(1015,130,1030,135);
                               bar(1060,130,1075,135);
                               setfillstyle(1,white);                        //OCZY
                               bar(1025,90,1035,115);
                               bar(1020,95,1040,110);
                               bar(1055,90,1065,115);
                               bar(1050,95,1070,110);
                               setfillstyle(1,black);
                               bar(1025,100,1035,110);
                               bar(1055,100,1065,110);
                               //mapka
                               i:=600;
                               j:=50;
                               setcolor(black);
                               setfillstyle(1,6);
                                bar((20 div 10)+i,(20 div 10)+j,(40 div 10)+i,(1000 div 10)+j);  //obramowanie
    bar((20 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(40 div 10)+j);
    bar((1240 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(1000 div 10)+j);
    bar((20 div 10)+i,(980 div 10)+j,(1260 div 10)+i,(1000 div 10)+j);

    bar((75 div 10)+i,(72 div 10)+j,(145 div 10)+i,(104 div 10)+j); //od lewego gornego rogu
    bar((75 div 10)+i,(72 div 10)+j,(110 div 10)+i,(200 div 10)+j);
    bar((75 div 10)+i,(136 div 10)+j,(145 div 10)+i,(200 div 10)+j);
    bar((40 div 10)+i,(232 div 10)+j,(285 div 10)+i,(264 div 10)+j);
    bar((40 div 10)+i,(232 div 10)+j,(75 div 10)+i,(296 div 10)+j);
    bar((110 div 10)+i,(296 div 10)+j,(145 div 10)+i,(328 div 10)+j);
    bar((75 div 10)+i,(328 div 10)+j,(110 div 10)+i,(388 div 10)+j);
    bar((75 div 10)+i,(328 div 10)+j,(215 div 10)+i,(356 div 10)+j);
    bar((180 div 10)+i,(356 div 10)+j,(145 div 10)+i,(388 div 10)+j);
    bar((320 div 10)+i,(356 div 10)+j,(425 div 10)+i,(328 div 10)+j);
    bar((390 div 10)+i,(356 div 10)+j,(425 div 10)+i,(420 div 10)+j);
    bar((320 div 10)+i,(420 div 10)+j,(425 div 10)+i,(388 div 10)+j);
    bar((320 div 10)+i,(420 div 10)+j,(355 div 10)+i,(452 div 10)+j);
    bar((250 div 10)+i,(356 div 10)+j,(285 div 10)+i,(452 div 10)+j);
    bar((250 div 10)+i,(388 div 10)+j,(215 div 10)+i,(452 div 10)+j);
    bar((250 div 10)+i,(420 div 10)+j,(75 div 10)+i,(452 div 10)+j);
    bar((250 div 10)+i,(232 div 10)+j,(285 div 10)+i,(328 div 10)+j);
    bar((180 div 10)+i,(264 div 10)+j,(285 div 10)+i,(296 div 10)+j);
    bar((390 div 10)+i,(264 div 10)+j,(530 div 10)+i,(232 div 10)+j);
    bar((495 div 10)+i,(264 div 10)+j,(460 div 10)+i,(360 div 10)+j);
    bar((320 div 10)+i,(264 div 10)+j,(530 div 10)+i,(296 div 10)+j);
    bar((530 div 10)+i,(328 div 10)+j,(565 div 10)+i,(360 div 10)+j);
    bar((565 div 10)+i,(264 div 10)+j,(635 div 10)+i,(296 div 10)+j);
    bar((600 div 10)+i,(264 div 10)+j,(635 div 10)+i,(360 div 10)+j);
    bar((675 div 10)+i,(264 div 10)+j,(745 div 10)+i,(296 div 10)+j);
    bar((675 div 10)+i,(264 div 10)+j,(710 div 10)+i,(360 div 10)+j);
    bar((75 div 10)+i,(136 div 10)+j,(215 div 10)+i,(168 div 10)+j);
    bar((180 div 10)+i,(40 div 10)+j,(215 div 10)+i,(104 div 10)+j);
    bar((180 div 10)+i,(136 div 10)+j,(215 div 10)+i,(200 div 10)+j);
    bar((180 div 10)+i,(168 div 10)+j,(390 div 10)+i,(200 div 10)+j);
    bar((320 div 10)+i,(168 div 10)+j,(355 div 10)+i,(232 div 10)+j);
    bar((250 div 10)+i,(72 div 10)+j,(320 div 10)+i,(136 div 10)+j);
    bar((250 div 10)+i,(72 div 10)+j,(460 div 10)+i,(104 div 10)+j);
   // bar(355,72,390,200);
    bar((425 div 10)+i,(200 div 10)+j,(600 div 10)+i,(168 div 10)+j);
    bar((565 div 10)+i,(200 div 10)+j,(600 div 10)+i,(232 div 10)+j);
    bar((565 div 10)+i,(200 div 10)+j,(775 div 10)+i,(232 div 10)+j);
    bar((748 div 10)+i,(200 div 10)+j,(713 div 10)+i,(136 div 10)+j);
    bar((495 div 10)+i,(40 div 10)+j,(600 div 10)+i,(72 div 10)+j);
    bar((425 div 10)+i,(104 div 10)+j,(680 div 10)+i,(136 div 10)+j);
    bar((645 div 10)+i,(72 div 10)+j,(680 div 10)+i,(168 div 10)+j);
    bar((715 div 10)+i,(40 div 10)+j,(750 div 10)+i,(104 div 10)+j);
    bar((715 div 10)+i,(72 div 10)+j,(855 div 10)+i,(104 div 10)+j);
    bar((890 div 10)+i,(72 div 10)+j,(1030 div 10)+i,(104 div 10)+j);
    bar((995 div 10)+i,(40 div 10)+j,(1030 div 10)+i,(104 div 10)+j);
    bar((1065 div 10)+i,(72 div 10)+j,(1205 div 10)+i,(104 div 10)+j);
    bar((1170 div 10)+i,(72 div 10)+j,(1205 div 10)+i,(168 div 10)+j);
    bar((1205 div 10)+i,(136 div 10)+j,(1100 div 10)+i,(168 div 10)+j);
    bar((1100 div 10)+i,(136 div 10)+j,(1135 div 10)+i,(232 div 10)+j);
    bar((1100 div 10)+i,(200 div 10)+j,(1065 div 10)+i,(232 div 10)+j);
    bar((1065 div 10)+i,(136 div 10)+j,(785 div 10)+i,(168 div 10)+j);
    bar((1030 div 10)+i,(136 div 10)+j,(995 div 10)+i,(232 div 10)+j);
    bar((1030 div 10)+i,(200 div 10)+j,(925 div 10)+i,(232 div 10)+j);
    bar((925 div 10)+i,(232 div 10)+j,(960 div 10)+i,(296 div 10)+j);
    bar((995 div 10)+i,(264 div 10)+j,(1135 div 10)+i,(296 div 10)+j);
    bar((1170 div 10)+i,(200 div 10)+j,(1205 div 10)+i,(296 div 10)+j);
    bar((1170 div 10)+i,(200 div 10)+j,(1240 div 10)+i,(232 div 10)+j);
    bar((1100 div 10)+i,(264 div 10)+j,(1135 div 10)+i,(392 div 10)+j);
    bar((1135 div 10)+i,(360 div 10)+j,(1065 div 10)+i,(328 div 10)+j);
    bar((1170 div 10)+i,(360 div 10)+j,(1240 div 10)+i,(328 div 10)+j);
    bar((1170 div 10)+i,(392 div 10)+j,(1205 div 10)+i,(520 div 10)+j);
    bar((1170 div 10)+i,(488 div 10)+j,(1240 div 10)+i,(520 div 10)+j);
    bar((1240 div 10)+i,(552 div 10)+j,(1065 div 10)+i,(584 div 10)+j);
    bar((1205 div 10)+i,(552 div 10)+j,(1170 div 10)+i,(648 div 10)+j);
    bar((1170 div 10)+i,(616 div 10)+j,(1065 div 10)+i,(648 div 10)+j);
    bar((1205 div 10)+i,(948 div 10)+j,(1100 div 10)+i,(916 div 10)+j);
    bar((1205 div 10)+i,(948 div 10)+j,(1170 div 10)+i,(852 div 10)+j);
    bar((1135 div 10)+i,(916 div 10)+j,(1065 div 10)+i,(884 div 10)+j);
    bar((1135 div 10)+i,(948 div 10)+j,(1100 div 10)+i,(756 div 10)+j);
    bar((1135 div 10)+i,(788 div 10)+j,(995 div 10)+i,(756 div 10)+j);
    bar((1240 div 10)+i,(820 div 10)+j,(1170 div 10)+i,(788 div 10)+j);
    bar((1205 div 10)+i,(820 div 10)+j,(1170 div 10)+i,(692 div 10)+j);
    bar((1205 div 10)+i,(724 div 10)+j,(1100 div 10)+i,(692 div 10)+j);
    bar((1065 div 10)+i,(980 div 10)+j,(890 div 10)+i,(948 div 10)+j);
    bar((1030 div 10)+i,(948 div 10)+j,(925 div 10)+i,(916 div 10)+j);
    bar((1030 div 10)+i,(948 div 10)+j,(995 div 10)+i,(820 div 10)+j);
    bar((995 div 10)+i,(852 div 10)+j,(1065 div 10)+i,(820 div 10)+j);
    bar((855 div 10)+i,(948 div 10)+j,(785 div 10)+i,(916 div 10)+j);
    bar((890 div 10)+i,(916 div 10)+j,(820 div 10)+i,(884 div 10)+j);
    bar((890 div 10)+i,(916 div 10)+j,(855 div 10)+i,(820 div 10)+j);
    bar((890 div 10)+i,(852 div 10)+j,(960 div 10)+i,(884 div 10)+j);
    bar((960 div 10)+i,(820 div 10)+j,(925 div 10)+i,(756 div 10)+j);
    bar((960 div 10)+i,(788 div 10)+j,(855 div 10)+i,(756 div 10)+j);
    bar((890 div 10)+i,(788 div 10)+j,(855 div 10)+i,(692 div 10)+j);
    bar((890 div 10)+i,(724 div 10)+j,(785 div 10)+i,(692 div 10)+j);
    bar((820 div 10)+i,(724 div 10)+j,(785 div 10)+i,(596 div 10)+j);
    bar((855 div 10)+i,(564 div 10)+j,(890 div 10)+i,(660 div 10)+j); //
    bar((855 div 10)+i,(660 div 10)+j,(1030 div 10)+i,(628 div 10)+j);
    bar((960 div 10)+i,(660 div 10)+j,(925 div 10)+i,(724 div 10)+j);
    bar((960 div 10)+i,(724 div 10)+j,(1065 div 10)+i,(692 div 10)+j);
    bar((855 div 10)+i,(532 div 10)+j,(960 div 10)+i,(500 div 10)+j);   //
    bar((925 div 10)+i,(532 div 10)+j,(960 div 10)+i,(596 div 10)+j);
    bar((925 div 10)+i,(596 div 10)+j,(1030 div 10)+i,(564 div 10)+j);
    bar((995 div 10)+i,(564 div 10)+j,(1030 div 10)+i,(500 div 10)+j);
    bar((1030 div 10)+i,(500 div 10)+j,(1135 div 10)+i,(532 div 10)+j);
    bar((1100 div 10)+i,(500 div 10)+j,(1135 div 10)+i,(436 div 10)+j);
    bar((1135 div 10)+i,(436 div 10)+j,(1030 div 10)+i,(468 div 10)+j);
    bar((1030 div 10)+i,(436 div 10)+j,(1065 div 10)+i,(404 div 10)+j);
    bar((995 div 10)+i,(436 div 10)+j,(960 div 10)+i,(404 div 10)+j);
    bar((995 div 10)+i,(436 div 10)+j,(855 div 10)+i,(468 div 10)+j);
    bar((855 div 10)+i,(394 div 10)+j,(925 div 10)+i,(362 div 10)+j);
    bar((820 div 10)+i,(362 div 10)+j,(1030 div 10)+i,(330 div 10)+j);
    bar((785 div 10)+i,(298 div 10)+j,(890 div 10)+i,(266 div 10)+j);
    bar((855 div 10)+i,(330 div 10)+j,(890 div 10)+i,(202 div 10)+j);
    bar((890 div 10)+i,(202 div 10)+j,(820 div 10)+i,(234 div 10)+j);
    bar((785 div 10)+i,(362 div 10)+j,(750 div 10)+i,(330 div 10)+j);
    bar((75 div 10)+i,(948 div 10)+j,(110 div 10)+i,(884 div 10)+j);  //dol
    bar((40 div 10)+i,(852 div 10)+j,(110 div 10)+i,(820 div 10)+j);
    bar((75 div 10)+i,(820 div 10)+j,(110 div 10)+i,(692 div 10)+j);
    bar((75 div 10)+i,(692 div 10)+j,(180 div 10)+i,(724 div 10)+j);
    bar((75 div 10)+i,(628 div 10)+j,(180 div 10)+i,(660 div 10)+j);
    bar((145 div 10)+i,(692 div 10)+j,(180 div 10)+i,(628 div 10)+j);
    bar((215 div 10)+i,(692 div 10)+j,(250 div 10)+i,(660 div 10)+j);
    bar((215 div 10)+i,(692 div 10)+j,(320 div 10)+i,(724 div 10)+j);
    bar((285 div 10)+i,(724 div 10)+j,(320 div 10)+i,(596 div 10)+j);
    bar((215 div 10)+i,(596 div 10)+j,(320 div 10)+i,(628 div 10)+j);
    bar((320 div 10)+i,(596 div 10)+j,(355 div 10)+i,(660 div 10)+j);
    bar((355 div 10)+i,(692 div 10)+j,(425 div 10)+i,(724 div 10)+j);
    bar((425 div 10)+i,(596 div 10)+j,(460 div 10)+i,(628 div 10)+j);
    bar((425 div 10)+i,(724 div 10)+j,(390 div 10)+i,(532 div 10)+j);
    bar((425 div 10)+i,(468 div 10)+j,(390 div 10)+i,(500 div 10)+j);
    bar((425 div 10)+i,(564 div 10)+j,(320 div 10)+i,(532 div 10)+j);
    bar((355 div 10)+i,(564 div 10)+j,(320 div 10)+i,(500 div 10)+j);
    bar((355 div 10)+i,(532 div 10)+j,(215 div 10)+i,(500 div 10)+j);
    bar((250 div 10)+i,(500 div 10)+j,(215 div 10)+i,(564 div 10)+j);
    bar((40 div 10)+i,(500 div 10)+j,(180 div 10)+i,(532 div 10)+j);
    bar((75 div 10)+i,(500 div 10)+j,(110 div 10)+i,(596 div 10)+j);
    bar((75 div 10)+i,(596 div 10)+j,(180 div 10)+i,(564 div 10)+j);
    bar((75 div 10)+i,(948 div 10)+j,(180 div 10)+i,(916 div 10)+j);
    bar((145 div 10)+i,(948 div 10)+j,(180 div 10)+i,(820 div 10)+j);
    bar((285 div 10)+i,(852 div 10)+j,(250 div 10)+i,(756 div 10)+j);
    bar((285 div 10)+i,(756 div 10)+j,(145 div 10)+i,(788 div 10)+j);
    bar((145 div 10)+i,(852 div 10)+j,(320 div 10)+i,(820 div 10)+j);
    bar((215 div 10)+i,(884 div 10)+j,(250 div 10)+i,(980 div 10)+j);
    bar((215 div 10)+i,(948 div 10)+j,(355 div 10)+i,(916 div 10)+j);
    bar((285 div 10)+i,(820 div 10)+j,(320 div 10)+i,(884 div 10)+j);
    bar((285 div 10)+i,(884 div 10)+j,(390 div 10)+i,(852 div 10)+j);
    bar((355 div 10)+i,(884 div 10)+j,(390 div 10)+i,(756 div 10)+j);
    bar((320 div 10)+i,(788 div 10)+j,(460 div 10)+i,(756 div 10)+j);
    bar((425 div 10)+i,(756 div 10)+j,(460 div 10)+i,(948 div 10)+j);
    bar((425 div 10)+i,(948 div 10)+j,(390 div 10)+i,(916 div 10)+j);
    bar((425 div 10)+i,(884 div 10)+j,(530 div 10)+i,(852 div 10)+j);
    bar((495 div 10)+i,(884 div 10)+j,(530 div 10)+i,(820 div 10)+j);
    bar((705 div 10)+i,(980 div 10)+j,(635 div 10)+i,(948 div 10)+j);
    bar((495 div 10)+i,(948 div 10)+j,(740 div 10)+i,(916 div 10)+j);
    bar((565 div 10)+i,(916 div 10)+j,(635 div 10)+i,(884 div 10)+j);
    bar((600 div 10)+i,(884 div 10)+j,(705 div 10)+i,(852 div 10)+j);
    bar((670 div 10)+i,(852 div 10)+j,(810 div 10)+i,(820 div 10)+j);
    bar((775 div 10)+i,(852 div 10)+j,(740 div 10)+i,(884 div 10)+j);
    bar((495 div 10)+i,(852 div 10)+j,(565 div 10)+i,(820 div 10)+j);
    bar((495 div 10)+i,(788 div 10)+j,(565 div 10)+i,(756 div 10)+j);
    bar((495 div 10)+i,(788 div 10)+j,(530 div 10)+i,(596 div 10)+j);
    bar((495 div 10)+i,(660 div 10)+j,(460 div 10)+i,(724 div 10)+j);
    bar((670 div 10)+i,(660 div 10)+j,(635 div 10)+i,(596 div 10)+j);
    bar((565 div 10)+i,(596 div 10)+j,(600 div 10)+i,(724 div 10)+j);
    bar((705 div 10)+i,(596 div 10)+j,(740 div 10)+i,(724 div 10)+j);
    bar((565 div 10)+i,(724 div 10)+j,(740 div 10)+i,(692 div 10)+j);
    bar((600 div 10)+i,(724 div 10)+j,(635 div 10)+i,(820 div 10)+j);
    bar((600 div 10)+i,(788 div 10)+j,(810 div 10)+i,(756 div 10)+j);

    bar((460 div 10)+i,(392 div 10)+j,(820 div 10)+i,(424 div 10)+j); //srodek
    bar((460 div 10)+i,(564 div 10)+j,(820 div 10)+i,(532 div 10)+j);
    bar((460 div 10)+i,(392 div 10)+j,(495 div 10)+i,(564 div 10)+j);
    bar((820 div 10)+i,(392 div 10)+j,(785 div 10)+i,(564 div 10)+j);
    setfillstyle(1,black);
    bar((565 div 10)+i,(392 div 10)+j,(715 div 10)+i,(424 div 10)+j);


                               for i:=1 to 1 do
                               begin
                               str(i,zxc);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(150,200+100*i,'BEST: ');
                               for j:=1 to 5 do outtextxy(170+50*j,300,bestt[2,5,j]);
                               outtextxy(880,300,'.');
                               end;

                              for i:=1 to 1 do
                              begin
                               str(i,zxc);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(150,200+300*i,'YOUR: ');
                               for j:=1 to 5 do outtextxy(170+50*j,500,wena[2,5,j]);
                               outtextxy(880,500,'.');
                               end;

                             setcolor(white);
                             settextstyle(TriplexFont,HorizDir,3);
                             outtextxy(250,970,'PRESS ESC TO BACK TO MAIN MENU.');
                             setcolor(white);
                             settextstyle(TriplexFont,HorizDir,3);
                             outtextxy(300,770,'PRESS 0 TO RESET HIGHSCORE.');
                             zerowanie;
                             entermap:=true;
                             graj:=false;
                             setfillstyle(1,black);
                             bar(1,1,getmaxx,getmaxy);
                             minimapy;
                             setcolor(random(10-1+1)+1);
                             settextstyle(TriplexFont,HorizDir,8);
                             outtextxy(400,100,'WHICH MAP');

                             end;
                           if km=6 then  //map6
                             begin
                             setfillstyle(1,black);
                               bar(1,1,getmaxx,getmaxy);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(100,50,'HIGHSCORE');


                               setcolor(yellow);             //pacman d  dol
                               setfillstyle(1,yellow);
                               pieslice(100,923,35,320,30);
                               setcolor(black);
                               setfillstyle(1,black);
                               fillellipse(105,903,5,5);

                               setcolor(random(13-9+1)+9);                                    //duszek 1
                               setfillstyle(1,random(13-9+1)+9);
                               bar(1010,110,1080,125);    //+70 x
                               bar(1015,95,1075,110);
                               bar(1020,85,1070,95);
                               bar(1025,80,1065,90);
                               bar(1035,75,1055,80);
                               bar(1010,125,1020,135);
                               bar(1025,125,1040,135);
                               bar(1050,125,1065,135);
                               bar(1070,125,1080,135);
                               setfillstyle(1,black);
                               bar(1015,130,1030,135);
                               bar(1060,130,1075,135);
                               setfillstyle(1,white);                        //OCZY
                               bar(1025,90,1035,115);
                               bar(1020,95,1040,110);
                               bar(1055,90,1065,115);
                               bar(1050,95,1070,110);
                               setfillstyle(1,black);
                               bar(1025,100,1035,110);
                               bar(1055,100,1065,110);
                               //mapka
                               i:=600;
                               j:=50;
                               setcolor(black);
                               setfillstyle(1,random(5)+1);

    bar((20 div 10)+i,(20 div 10)+j,(40 div 10)+i,(1000 div 10)+j);  //obramowanie
    bar((20 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(40 div 10)+j);
    bar((1240 div 10)+i,(20 div 10)+j,(1260 div 10)+i,(1000 div 10)+j);
    bar((20 div 10)+i,(980 div 10)+j,(1260 div 10)+i,(1000 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((40 div 10)+i,(75 div 10)+j,(110 div 10)+i,(110 div 10)+j);
    bar((75 div 10)+i,(75 div 10)+j,(110 div 10)+i,(180 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((145 div 10)+i,(75 div 10)+j,(250 div 10)+i,(110 div 10)+j);
    bar((180 div 10)+i,(75 div 10)+j,(215 div 10)+i,(180 div 10)+j);
    bar((215 div 10)+i,(75 div 10)+j,(250 div 10)+i,(145 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((285 div 10)+i,(75 div 10)+j,(355 div 10)+i,(110 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((425 div 10)+i,(40 div 10)+j,(495 div 10)+i,(75 div 10)+j);
    bar((460 div 10)+i,(40 div 10)+j,(495 div 10)+i,(180 div 10)+j);
    bar((460 div 10)+i,(145 div 10)+j,(530 div 10)+i,(180 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((565 div 10)+i,(40 div 10)+j,(705 div 10)+i,(75 div 10)+j);
    bar((565 div 10)+i,(110 div 10)+j,(600 div 10)+i,(180 div 10)+j);
    bar((565 div 10)+i,(145 div 10)+j,(635 div 10)+i,(180 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((565 div 10)+i,(215 div 10)+j,(600 div 10)+i,(285 div 10)+j);
    bar((530 div 10)+i,(250 div 10)+j,(670 div 10)+i,(285 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((495 div 10)+i,(320 div 10)+j,(530 div 10)+i,(390 div 10)+j);
    bar((495 div 10)+i,(320 div 10)+j,(600 div 10)+i,(355 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((530 div 10)+i,(425 div 10)+j,(425 div 10)+i,(460 div 10)+j);
    bar((425 div 10)+i,(460 div 10)+j,(460 div 10)+i,(390 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((425 div 10)+i,(355 div 10)+j,(460 div 10)+i,(250 div 10)+j);
    bar((495 div 10)+i,(285 div 10)+j,(390 div 10)+i,(250 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((390 div 10)+i,(320 div 10)+j,(320 div 10)+i,(390 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((390 div 10)+i,(425 div 10)+j,(355 div 10)+i,(495 div 10)+j);
    bar((355 div 10)+i,(460 div 10)+j,(320 div 10)+i,(565 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((285 div 10)+i,(530 div 10)+j,(180 div 10)+i,(495 div 10)+j);
    bar((215 div 10)+i,(565 div 10)+j,(250 div 10)+i,(460 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((180 div 10)+i,(460 div 10)+j,(75 div 10)+i,(425 div 10)+j);
    bar((110 div 10)+i,(425 div 10)+j,(145 div 10)+i,(495 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((180 div 10)+i,(355 div 10)+j,(250 div 10)+i,(390 div 10)+j);
    bar((215 div 10)+i,(390 div 10)+j,(285 div 10)+i,(425 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((75 div 10)+i,(390 div 10)+j,(110 div 10)+i,(285 div 10)+j);
    bar((75 div 10)+i,(285 div 10)+j,(145 div 10)+i,(320 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((180 div 10)+i,(285 div 10)+j,(285 div 10)+i,(320 div 10)+j);
    bar((285 div 10)+i,(285 div 10)+j,(250 div 10)+i,(250 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((75 div 10)+i,(250 div 10)+j,(215 div 10)+i,(215 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((250 div 10)+i,(215 div 10)+j,(425 div 10)+i,(180 div 10)+j);
    bar((285 div 10)+i,(215 div 10)+j,(320 div 10)+i,(145 div 10)+j);
    bar((390 div 10)+i,(215 div 10)+j,(425 div 10)+i,(110 div 10)+j);
    bar((320 div 10)+i,(215 div 10)+j,(355 div 10)+i,(285 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((75 div 10)+i,(945 div 10)+j,(110 div 10)+i,(840 div 10)+j);
    bar((75 div 10)+i,(875 div 10)+j,(145 div 10)+i,(910 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((145 div 10)+i,(980 div 10)+j,(250 div 10)+i,(945 div 10)+j);
    bar((215 div 10)+i,(980 div 10)+j,(180 div 10)+i,(875 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((285 div 10)+i,(980 div 10)+j,(425 div 10)+i,(945 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((495 div 10)+i,(945 div 10)+j,(565 div 10)+i,(910 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((425 div 10)+i,(910 div 10)+j,(460 div 10)+i,(805 div 10)+j);
    bar((425 div 10)+i,(875 div 10)+j,(635 div 10)+i,(840 div 10)+j);
    bar((600 div 10)+i,(910 div 10)+j,(635 div 10)+i,(805 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((495 div 10)+i,(805 div 10)+j,(565 div 10)+i,(770 div 10)+j);
    bar((495 div 10)+i,(805 div 10)+j,(530 div 10)+i,(700 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((390 div 10)+i,(665 div 10)+j,(425 div 10)+i,(525 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((425 div 10)+i,(700 div 10)+j,(460 div 10)+i,(770 div 10)+j);
    bar((425 div 10)+i,(700 div 10)+j,(390 div 10)+i,(735 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((390 div 10)+i,(770 div 10)+j,(355 div 10)+i,(910 div 10)+j);
    bar((390 div 10)+i,(770 div 10)+j,(285 div 10)+i,(805 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((320 div 10)+i,(910 div 10)+j,(250 div 10)+i,(840 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((250 div 10)+i,(770 div 10)+j,(180 div 10)+i,(805 div 10)+j);
    bar((145 div 10)+i,(805 div 10)+j,(215 div 10)+i,(840 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((40 div 10)+i,(805 div 10)+j,(75 div 10)+i,(630 div 10)+j);
    bar((40 div 10)+i,(630 div 10)+j,(110 div 10)+i,(665 div 10)+j);
    bar((40 div 10)+i,(700 div 10)+j,(145 div 10)+i,(735 div 10)+j);
    bar((110 div 10)+i,(700 div 10)+j,(145 div 10)+i,(770 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((75 div 10)+i,(595 div 10)+j,(110 div 10)+i,(525 div 10)+j);
    bar((75 div 10)+i,(525 div 10)+j,(145 div 10)+i,(560 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((180 div 10)+i,(735 div 10)+j,(215 div 10)+i,(630 div 10)+j);
    bar((145 div 10)+i,(665 div 10)+j,(180 div 10)+i,(595 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((250 div 10)+i,(595 div 10)+j,(320 div 10)+i,(630 div 10)+j);
    bar((250 div 10)+i,(595 div 10)+j,(285 div 10)+i,(665 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((250 div 10)+i,(700 div 10)+j,(355 div 10)+i,(735 div 10)+j);
    bar((320 div 10)+i,(735 div 10)+j,(355 div 10)+i,(665 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1205 div 10)+i,(945 div 10)+j,(1170 div 10)+i,(805 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1135 div 10)+i,(915 div 10)+j,(1065 div 10)+i,(880 div 10)+j);
    bar((1100 div 10)+i,(880 div 10)+j,(1065 div 10)+i,(980 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1135 div 10)+i,(845 div 10)+j,(1030 div 10)+i,(810 div 10)+j);
    bar((1065 div 10)+i,(845 div 10)+j,(1100 div 10)+i,(775 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1030 div 10)+i,(945 div 10)+j,(995 div 10)+i,(875 div 10)+j);
    bar((995 div 10)+i,(910 div 10)+j,(960 div 10)+i,(805 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((925 div 10)+i,(945 div 10)+j,(855 div 10)+i,(910 div 10)+j);
    bar((855 div 10)+i,(945 div 10)+j,(890 div 10)+i,(805 div 10)+j);
    bar((925 div 10)+i,(840 div 10)+j,(820 div 10)+i,(805 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((820 div 10)+i,(945 div 10)+j,(785 div 10)+i,(875 div 10)+j);
    bar((820 div 10)+i,(910 div 10)+j,(680 div 10)+i,(945 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((680 div 10)+i,(840 div 10)+j,(785 div 10)+i,(805 div 10)+j);
    bar((715 div 10)+i,(875 div 10)+j,(750 div 10)+i,(770 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((680 div 10)+i,(770 div 10)+j,(610 div 10)+i,(735 div 10)+j);
    bar((645 div 10)+i,(735 div 10)+j,(575 div 10)+i,(700 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((715 div 10)+i,(735 div 10)+j,(820 div 10)+i,(700 div 10)+j);
    bar((785 div 10)+i,(770 div 10)+j,(890 div 10)+i,(735 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((925 div 10)+i,(770 div 10)+j,(995 div 10)+i,(735 div 10)+j);
    bar((960 div 10)+i,(770 div 10)+j,(995 div 10)+i,(700 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1030 div 10)+i,(700 div 10)+j,(1170 div 10)+i,(735 div 10)+j);
    bar((1135 div 10)+i,(700 div 10)+j,(1170 div 10)+i,(770 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1205 div 10)+i,(700 div 10)+j,(1240 div 10)+i,(630 div 10)+j);
    bar((1205 div 10)+i,(665 div 10)+j,(1170 div 10)+i,(595 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1135 div 10)+i,(665 div 10)+j,(960 div 10)+i,(630 div 10)+j);
    bar((1030 div 10)+i,(665 div 10)+j,(1065 div 10)+i,(560 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((855 div 10)+i,(630 div 10)+j,(925 div 10)+i,(700 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((855 div 10)+i,(595 div 10)+j,(995 div 10)+i,(560 div 10)+j);
    bar((960 div 10)+i,(595 div 10)+j,(925 div 10)+i,(525 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1205 div 10)+i,(75 div 10)+j,(1065 div 10)+i,(110 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1205 div 10)+i,(145 div 10)+j,(1170 div 10)+i,(215 div 10)+j);
    bar((1205 div 10)+i,(215 div 10)+j,(1135 div 10)+i,(180 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1100 div 10)+i,(215 div 10)+j,(1030 div 10)+i,(145 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1135 div 10)+i,(285 div 10)+j,(1030 div 10)+i,(320 div 10)+j);
    bar((1065 div 10)+i,(250 div 10)+j,(1100 div 10)+i,(390 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1240 div 10)+i,(285 div 10)+j,(1205 div 10)+i,(320 div 10)+j);
    bar((1205 div 10)+i,(250 div 10)+j,(1170 div 10)+i,(355 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1205 div 10)+i,(390 div 10)+j,(1170 div 10)+i,(460 div 10)+j);
    bar((1205 div 10)+i,(460 div 10)+j,(1100 div 10)+i,(425 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1170 div 10)+i,(495 div 10)+j,(1065 div 10)+i,(530 div 10)+j);
    bar((1100 div 10)+i,(530 div 10)+j,(1205 div 10)+i,(565 div 10)+j);
    bar((1100 div 10)+i,(565 div 10)+j,(1135 div 10)+i,(600 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((1030 div 10)+i,(530 div 10)+j,(995 div 10)+i,(425 div 10)+j);
    bar((1065 div 10)+i,(425 div 10)+j,(960 div 10)+i,(460 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((925 div 10)+i,(460 div 10)+j,(855 div 10)+i,(495 div 10)+j);
    bar((855 div 10)+i,(460 div 10)+j,(890 div 10)+i,(530 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((925 div 10)+i,(425 div 10)+j,(890 div 10)+i,(355 div 10)+j);
    bar((890 div 10)+i,(355 div 10)+j,(995 div 10)+i,(390 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((995 div 10)+i,(250 div 10)+j,(925 div 10)+i,(285 div 10)+j);
    bar((960 div 10)+i,(285 div 10)+j,(855 div 10)+i,(320 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((995 div 10)+i,(215 div 10)+j,(960 div 10)+i,(75 div 10)+j);
    bar((1030 div 10)+i,(75 div 10)+j,(925 div 10)+i,(110 div 10)+j);
    bar((925 div 10)+i,(110 div 10)+j,(960 div 10)+i,(145 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((890 div 10)+i,(75 div 10)+j,(750 div 10)+i,(110 div 10)+j);
    bar((855 div 10)+i,(75 div 10)+j,(820 div 10)+i,(145 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((785 div 10)+i,(145 div 10)+j,(680 div 10)+i,(180 div 10)+j);
    bar((680 div 10)+i,(215 div 10)+j,(715 div 10)+i,(110 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((820 div 10)+i,(180 div 10)+j,(925 div 10)+i,(215 div 10)+j);
    bar((890 div 10)+i,(215 div 10)+j,(855 div 10)+i,(250 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((820 div 10)+i,(250 div 10)+j,(715 div 10)+i,(285 div 10)+j);
    bar((785 div 10)+i,(250 div 10)+j,(750 div 10)+i,(215 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((680 div 10)+i,(420 div 10)+j,(575 div 10)+i,(385 div 10)+j);
    bar((645 div 10)+i,(420 div 10)+j,(610 div 10)+i,(455 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((750 div 10)+i,(320 div 10)+j,(645 div 10)+i,(355 div 10)+j);
    bar((750 div 10)+i,(320 div 10)+j,(715 div 10)+i,(455 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((785 div 10)+i,(455 div 10)+j,(820 div 10)+i,(385 div 10)+j);
    bar((820 div 10)+i,(420 div 10)+j,(855 div 10)+i,(350 div 10)+j);
    setfillstyle(1,random(5-1+1)+1);
    bar((460 div 10)+i,(490 div 10)+j,(820 div 10)+i,(665 div 10)+j); //srodek
    setfillstyle(1,black);
    bar((565 div 10)+i,(490 div 10)+j,(715 div 10)+i,(525 div 10)+j);
    bar((495 div 10)+i,(522 div 10)+j,(785 div 10)+i,(633 div 10)+j);



                               for i:=1 to 1 do
                               begin
                               str(i,zxc);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(150,200+100*i,'BEST: ');
                               for j:=1 to 5 do outtextxy(170+50*j,300,bestt[2,6,j]);
                               outtextxy(880,300,'.');
                               end;

                              for i:=1 to 1 do
                              begin
                               str(i,zxc);
                               setcolor(random(10-1+1)+1);
                               settextstyle(TriplexFont,HorizDir,3);
                               outtextxy(150,200+300*i,'YOUR: ');
                               for j:=1 to 5 do outtextxy(170+50*j,500,wena[2,6,j]);
                               outtextxy(880,500,'.');
                              end;
                              zerowanie;
                             setcolor(white);
                             settextstyle(TriplexFont,HorizDir,3);
                             outtextxy(250,970,'PRESS ESC TO BACK TO MAIN MENU.');
                             setcolor(white);
                             settextstyle(TriplexFont,HorizDir,3);
                             outtextxy(300,770,'PRESS 0 TO RESET HIGHSCORE.');
                             entermap:=true;
                             graj:=false;
                             setfillstyle(1,black);
                             bar(1,1,getmaxx,getmaxy);
                             minimapy;
                             setcolor(random(10-1+1)+1);
                             settextstyle(TriplexFont,HorizDir,8);
                             outtextxy(400,100,'WHICH MAP');



                             end;
                         end;
                   until entermap=false;
                     end;
                 end;
          until entertryb=true;
         end;


      1 :begin    //play
          setfillstyle(1,black);
          bar(1,1,getmaxx,getmaxy);
          xk:=240;
          yk:=190;
          setcolor(random(10-1+1)+1);
          settextstyle(TriplexFont,HorizDir,3);
          outtextxy(400,350,'CHOOSE MODE');
          setcolor(random(10-1+1)+1);
          outtextxy(400,450,' Survival');
          setcolor(random(10-1+1)+1);
          outtextxy(400,550,' Adventure');
          entertryb:=false;
          kt:=1;
          switch:=2;
          adel:=true;
          repeat

           if del(adel) then inc(switch);
           if switch mod 2=0 then kursormenutwarz(yk,xk)
               else kursormenuzamkniety(yk,xk);
           if switch=100 then switch:=2;


            if keypressed then
              begin
                przycisktryb:=readkey;
                przycisktryb:=upcase(przycisktryb);
                if przycisktryb=chr(83) then
                  begin
                    kursormenuzmaz(yk,xk);
                    yk:=yk+100;
                    kt:=kt+1;
                  end;
                if przycisktryb=chr(87) then
                  begin
                    kursormenuzmaz(yk,xk);
                    yk:=yk-100;
                    kt:=kt-1;
                  end;
                if przycisktryb=chr(13) then entermap:=true;
                if przycisktryb=chr(13) then entertryb:=true;
                if przycisktryb=chr(27) then entertryb:=true;
                if yk>290 then
                  begin
                    yk:=yk-100;
                    kt:=kt-1;
                  end;
                if yk<190 then
                  begin
                    yk:=yk+100;
                    kt:=kt+1;
                  end;
             end;
               if entermap=true then
                 begin
                   graj:=false;
                   setfillstyle(1,black);
                   bar(1,1,getmaxx,getmaxy);
                   if (kt=1) or (kt=2) then  //przeskok do minimap
                     begin
                      setcolor(random(10-1+1)+1);
                      settextstyle(TriplexFont,HorizDir,8);
                      outtextxy(400,100,'WHICH MAP');
                      minimapy;
                      xk:=70;
                      yk:=170;
                      km:=1;
                      switch:=2;
                      adel:=true;


                      REPEAT
                     // kursormap(xk,yk);
                     if del(adel) then inc(switch);
                     if switch mod 2=0 then kursormenutwarz(yk,xk)
                        else kursormenuzamkniety(yk,xk);
                     if switch=100 then switch:=2;


                     if keypressed then
                       begin
                         przyciskmap:=readkey;
                         przyciskmap:=upcase(przyciskmap);
                         if przyciskmap=chr(68) then
                           begin
                            kursormenuzmaz(yk,xk);
                            xk:=xk+400;
                            km:=km+1;
                           end;
                         if przyciskmap=chr(83) then
                           begin
                            kursormenuzmaz(yk,xk);
                            yk:=yk+300;
                            km:=km+3;
                           end;

                         if przyciskmap=chr(65) then
                           begin
                            kursormenuzmaz(yk,xk);
                            xk:=xk-400;
                            km:=km-1;
                           end;
                         if przyciskmap=chr(87) then
                           begin
                            kursormenuzmaz(yk,xk);
                            yk:=yk-300;
                            km:=km-3;
                           end;
                         if przyciskmap=chr(13) then graj:=true;
                         if przyciskmap=chr(13) then entermap:=false;
                       end;
                       if xk>870 then
                          begin
                           xk:=xk-400;
                           km:=km-1;
                           end;
                       if xk<0 then
                         begin
                          xk:=xk+400;
                          km:=km+1;
                         end;
                       if yk>470 then
                         begin
                          yk:=yk-300;
                          km:=km-3;
                         end;
                       if yk<100 then
                         begin
                          yk:=yk+300;
                          km:=km+3;
                         end;
                        if przyciskmap=chr(27) then
                           begin
                             kursormenuzmaz(yk,xk);
                             setfillstyle(1,black);
                             bar(1,1,getmaxx,getmaxy);
                             entermap:=false;
                             yk:=100;
                             setcolor(random(10-1+1)+1);
                             settextstyle(TriplexFont,HorizDir,3);
                             outtextxy(400,350,'CHOOSE MODE');
                             setcolor(random(10-1+1)+1);
                             outtextxy(400,450,' Survival');
                             setcolor(random(10-1+1)+1);
                             outtextxy(400,550,' Adventure');
                             entertryb:=false;
                             przyciskmap:=chr(1);
                             xk:=240;
                             yk:=190;
                             graj:=false;
                          end;

                       if graj=true then
                         begin
                          // if km=1 then //map1
                            // begin


     setfillstyle(1,black);
     bar(1,1,1279,1023);
     for i:=3 downto 0 do
     begin
     str(i,c);
     setcolor(random(10-1+1)+1);
     settextstyle(TriplexFont,HorizDir,10);
     outtextxy(640,512,c);
     delay(1000);
     setfillstyle(1,black);
     bar(1,1,1279,1023);
     end;

     getTime(godz,min,sek,ssek);


   vxd1:=-60;
   vyd1:=-50;
   kd1:=1;
   vxd2:=1110;
   vyd2:=-50;
   kd2:=1;
   vxd3:=1110;
   vyd3:=868;
   kd1:=1;
   zmiana:=0;
   x:=80;
   y:=900;
   vxd4:=-60;
   vyd4:=868;
   x:=650;
   y:=550;

   if km=1 then maap1
      else if km=2 then map2
           else if km=3 then map3
                else if km=4 then map4
                     else if km=5 then map5
                          else if km=6 then map6;

   i:=1;

   if kt=2 then siateczka;

   randomize;
   repeat


   P(kierunek,kolorop);//PACMAN
   duch(vxd1,vyd1,11,white,kd1);//1
   duch(vxd2,vyd2,7,white,kd2);//2
   duch(vxd3,vyd3,5,white,kd1);//3

   delay(100);

   P(kierunek,0);//PACMAN
   duch(vxd1,vyd1,0,0,kd1);//1
   duch(vxd2,vyd2,0,0,kd2);//2
   duch(vxd3,vyd3,0,0,kd1);//3

   if (kt=2) and (i=20) then siatka(x,y,pkt);

   motion;

   x:=x+10*x1;
   y:=y+10*y1;

   //DUCH1
   gonitwa(vxd1,vyd1,kd1);
   motionduch(vxd1,vyd1,kd1);
   vxd1:=vxd1+xd;
   vyd1:=vyd1+yd;
   //DUCH2
   gonitwa(vxd2,vyd2,kd2);
   motionduch(vxd2,vyd2,kd2);
   vxd2:=vxd2+xd;
   vyd2:=vyd2+yd;
  // DUCH3
   gonitwa(vxd3,vyd3,kd1);
   motionduch(vxd3,vyd3,kd1);
   vxd3:=vxd3+xd;
   vyd3:=vyd3+yd;

  /////////////////////////////////DUCH GONI///////////////////////////////////////
   inc(i);
   inc(zmiana);
   until ((abs(x-vxd1-230)<20) and (abs(y-vyd1-200)<20)) or
   ((abs(x-vxd2-230)<20) and (abs(y-vyd2-200)<20)) or (ord(z)=27);


   gettime(godz2,min2,sek2,ssek2);

   setfillstyle(1,black);
   bar(1,1,getmaxx,getmaxy);

   i:=0;
   k:=0;
   repeat
     inc(i);
     setcolor(i);
     settextstyle(TriplexFont,HorizDir,10);
     outtextxy(310,490,'GAME OVER');
     delay(200);
     if i=10 then i:=1;
     inc(k);
   until k=15;

   setfillstyle(1,black);
   bar(1,1,getmaxx,getmaxy);

  g:=godz2-godz;
  m:=min2-min;
  s:=sek2-sek;
  ss:=ssek2-ssek;
   if ss<0 then
     begin
       s:=s-1;
       ss:=ss+100;
     end;
   if s<0 then
     begin
      m:=m-1;
      s:=s+60;
     end;
   if m<0 then
    begin
      g:=g-1;
      m:=m+60;
    end;

  cojarobie2[kt,km,1]:=g;
  cojarobie2[kt,km,2]:=m;
  cojarobie2[kt,km,3]:=s;
  cojarobie2[kt,km,4]:=ss;

  str(g,go);
  str(m,mi);
  str(s,se);
  str(ss,sse);

  setcolor(white);
  settextstyle(TriplexFont,HorizDir,3);
  outtextxy(110,410,'Duch zlapal Cie po: ');
  outtextxy(580,410,go);
  outtextxy(640,410,':');
  outtextxy(680,410,mi);
  outtextxy(740,410,':');
  outtextxy(780,410,se);
  outtextxy(860,410,':');
  outtextxy(900,410,sse);
  outtextxy(940,410,'. Gratulacje!');
  i:=1;

repeat

until readkey=chr(27);

  entermap:=false;
  str(pkt,pkts);
  if kt=2 then
  begin
  wena[kt,km,1]:='0';
  wena[kt,km,2]:='0';
  wena[kt,km,3]:='0';
  wena[kt,km,4]:=pkts;
  wena[kt,km,5]:=uzytkownik;
  end;
  if kt=1 then
  begin
  wena[kt,km,1]:=go;
  wena[kt,km,2]:=mi;
  wena[kt,km,3]:=se;
  wena[kt,km,4]:=sse;
  wena[kt,km,5]:=uzytkownik;
  end;
  if cojarobie2[kt,km,1]>cojarobie[kt,km,1] then
    begin
     bestt[kt,km,1]:=wena[kt,km,1];
     bestt[kt,km,2]:=wena[kt,km,2];
     bestt[kt,km,3]:=wena[kt,km,3];
     bestt[kt,km,4]:=wena[kt,km,4];
     bestt[kt,km,5]:=wena[kt,km,5];
     cojarobie[kt,km,1]:=cojarobie2[kt,km,1];
     cojarobie[kt,km,2]:=cojarobie2[kt,km,2];
     cojarobie[kt,km,3]:=cojarobie2[kt,km,3];
     cojarobie[kt,km,4]:=cojarobie2[kt,km,4];
     cojarobie[kt,km,5]:=cojarobie2[kt,km,5];
    end;
   if (cojarobie2[kt,km,1]=cojarobie[kt,km,1]) and (cojarobie2[kt,km,2]>cojarobie[kt,km,2]) then
    begin
     bestt[kt,km,1]:=wena[kt,km,1];
     bestt[kt,km,2]:=wena[kt,km,2];
     bestt[kt,km,3]:=wena[kt,km,3];
     bestt[kt,km,4]:=wena[kt,km,4];
     bestt[kt,km,5]:=wena[kt,km,5];
     cojarobie[kt,km,1]:=cojarobie2[kt,km,1];
     cojarobie[kt,km,2]:=cojarobie2[kt,km,2];
     cojarobie[kt,km,3]:=cojarobie2[kt,km,3];
     cojarobie[kt,km,4]:=cojarobie2[kt,km,4];
     cojarobie[kt,km,5]:=cojarobie2[kt,km,5];
    end;
    if (cojarobie2[kt,km,1]=cojarobie[kt,km,1]) and (cojarobie2[kt,km,2]=cojarobie[kt,km,2]) and (cojarobie2[kt,km,3]>cojarobie[kt,km,3]) then
    begin
     bestt[kt,km,1]:=wena[kt,km,1];
     bestt[kt,km,2]:=wena[kt,km,2];
     bestt[kt,km,3]:=wena[kt,km,3];
     bestt[kt,km,4]:=wena[kt,km,4];
     bestt[kt,km,5]:=wena[kt,km,5];
     cojarobie[kt,km,1]:=cojarobie2[kt,km,1];
     cojarobie[kt,km,2]:=cojarobie2[kt,km,2];
     cojarobie[kt,km,3]:=cojarobie2[kt,km,3];
     cojarobie[kt,km,4]:=cojarobie2[kt,km,4];
     cojarobie[kt,km,5]:=cojarobie2[kt,km,5];
    end;
     if (cojarobie2[kt,km,1]=cojarobie[kt,km,1]) and (cojarobie2[kt,km,2]=cojarobie[kt,km,2]) and (cojarobie2[kt,km,3]=cojarobie[kt,km,3]) and (cojarobie2[kt,km,4]>cojarobie[kt,km,4]) then
    begin
     bestt[kt,km,1]:=wena[kt,km,1];
     bestt[kt,km,2]:=wena[kt,km,2];
     bestt[kt,km,3]:=wena[kt,km,3];
     bestt[kt,km,4]:=wena[kt,km,4];
     bestt[kt,km,5]:=wena[kt,km,5];
     cojarobie[kt,km,1]:=cojarobie2[kt,km,1];
     cojarobie[kt,km,2]:=cojarobie2[kt,km,2];
     cojarobie[kt,km,3]:=cojarobie2[kt,km,3];
     cojarobie[kt,km,4]:=cojarobie2[kt,km,4];
     cojarobie[kt,km,5]:=cojarobie2[kt,km,5];
    end;
    end;

    until entermap=false;
    end;
    end;

    until entertryb=true;
    end;
    end;

until koniec=true;

  CloseGraph;

  opcje[1]:=muzyka;
  opcje[2]:=diflvl;
  opcje[3]:=speedd;
  opcje[4]:=kolorop;

  assign(sett, 'C:\Wyniki\ustawienia.txt');
  rewrite(sett);

  for i:=1 to 4 do writeln(sett,opcje[i]);

  close(sett);
  assign(sur, 'C:\Wyniki\wyniksur.txt');
  rewrite(sur);
  for i:=1 to 6 do
  begin
    for j:=1 to 4 do writeln(sur,cojarobie[1,i,j]);
  end;
  close(sur);


  assign(hero,'C:\Wyniki\hero.txt');
  rewrite(hero);
  for j:=1 to 2 do
    begin
     for i:=1 to 6 do
      begin
       writeln(hero,bestt[j,i,5]);
       end;
    end;
  close(hero);
end.
