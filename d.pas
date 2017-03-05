uses crt,wincrt, graph,dos;

var
  ster, tryb : integer;
  go,mi,se,sse,c,uzytkownik,uzytkownik2,zxc: string;
  x, y, i,j, zmiana,vxp, vyp, iv,vxd1,vyd1, vxd2,vyd2,vxd3,vyd3, x1,xd,yd, y1, vxd,vyd,ko,kolorop,diflvl,speedd,muzyka,tr : integer;
  godz,min,sek,godz2,min2,sek2,ssek,ssek2,ss,g,m,s,xk,yk:word;
  l: int64;  //wyniki czs
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

//***************************************************************************\\

begin
  clrscr;
  randomize;

  initgraph(ster, tryb ,'  ');



  testmap;
readln;


  CloseGraph;


end.
