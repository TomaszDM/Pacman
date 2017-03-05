uses crt,wincrt,graph,dos;

var
  ster, tryb : integer;
  go,mi,se,sse,c,uzytkownik,uzytkownik2,zxc: string;
  x, y, i,j, zmiana,vxp, vyp, iv,vxd1,vyd1, vxd2,vyd2,vxd3,vyd3, x1,xd,yd, y1, vxd,vyd,ko,kolorop,diflvl,speedd,muzyka,tr : integer;
  godz,min,sek,godz2,min2,sek2,ssek,ssek2,ss,g,m,s,xk,yk:word;
  l,pkt: int64;  //wyniki czs
 kierunek, kk , kd1,kd2,kd3 : byte;

  xtekst,ytekst,vxd1tekst,vyd1tekst,vxd2tekst,vyd2tekst,vxd3tekst,vyd3tekst:string;
  k,kt,km:int64;
  v:longint;
  przycisk,n,z,przycisktryb,przyciskmap,przyciskekran:char;
  koniec, essc,enteer,entertryb,entermap,graj,enterko,esc,entero : boolean;
  kolor : array[0..7] of integer;
  tp : array[1..10,1..100] of integer;
  bestt : array[1..2,1..10,1..100] of string;
  ts : array[1..10,1..100] of integer;
  wena : array[1..2,0..10,0..100] of string;
  wynik : int64;
  wynikplik1 : file of int64;
  map1: file of int64;
  cojarobie : array[1..10,1..100] of integer;
  opcje : array[1..5] of integer;
  sett,sur,adv : text;


function kursormenu(yk:word):word;
 begin
   setcolor(kolorop);             //pacman d     gora
                setfillstyle(1,kolorop);
                pieslice(140,310+yk,35,320,30);
                setcolor(black);
                setfillstyle(1,black);
                fillellipse(145,290+yk,5,5);
                pieslice(140,310+yk,320,360,30);
                pieslice(140,310+yk,0,35,30);
                delay(400);
                setfillstyle(1,kolorop);
                pieslice(140,310+yk,0,360,30);
                setfillstyle(1,black);
                fillellipse(145,290+yk,5,5);
                delay(300);
                fillellipse(140,310+yk,30,30);
 end;

function kursormenutwarz(yk:word):word;
  begin
                setcolor(kolorop);             //pacman d     gora
                setfillstyle(1,kolorop);
                pieslice(140,310+yk,35,320,30);
                setcolor(black);
                setfillstyle(1,black);
                fillellipse(145,290+yk,5,5);
                pieslice(140,310+yk,320,360,30);
                pieslice(140,310+yk,0,35,30);

  end;
function kursormenuzamkniety(yk:word):word;
  begin
     setfillstyle(1,kolorop);
     pieslice(140,310+yk,0,360,30);
     setcolor(black);
                setfillstyle(1,black);
                fillellipse(145,290+yk,5,5);
  end;

function kursormenuzmaz(yk:word):word;
  begin
                setfillstyle(1,black);
                fillellipse(145,290+yk,5,5);
                fillellipse(140,310+yk,30,30);

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
end;
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

function siatka(x,y,pkt:longint):integer;
var
xsiatka,ysiatka,i,j:integer;
znajdzki: array[1..1682,1..2] of integer;
pozw1,pozw2:boolean;
punkty: array[1..1682] of boolean;
begin
i:=1;
if getpixel(30,30)=black then for xsiatka:=1 to 41 do
 begin
  for ysiatka:=1 to 41 do
    begin
        znajdzki[i,1]:=30*xsiatka;
        znajdzki[i,2]:=30*ysiatka;
        punkty[i]:=false;
        inc(i);
    end;
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
       begin
         if punkty[j]=false then setcolor(white)
          else setcolor(black);
        fillellipse(30*xsiatka,30*ysiatka,3,3);
       end;
     setcolor(black);
     setfillstyle(1,black);
     bar(490,450,790,564);
     bar(565,564,700,596);
     setcolor(white);
     inc(j);
    end;
 end;


//nie mam pomyslu jak zliczac punkty

end;
//***************************************************************************\\

begin
  clrscr;
  randomize;

  initgraph(ster, tryb ,'  ');
  map3;
  siatka(1,1,0);

//  map3;
readln;


  CloseGraph;


end.
