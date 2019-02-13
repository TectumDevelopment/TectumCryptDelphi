unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,z_lib;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit3: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    OpenDialog1: TOpenDialog;
    Button3: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  ep:real;       

implementation

{$R *.dfm}

procedure GetFileDIdent(FName:string; var d,d2:cardinal);
var f:file of byte; i,k:integer;z:cardinal;
  InF: file;
  NumRead: longint;
  Buf: array[1..2048] of byte;
begin
    d:=0;z:=0;d2:=0;k:=1;
    AssignFile(InF,FName);
    Reset(InF,1);	        { Record size = 1 }
      repeat
        BlockRead (InF, Buf, SizeOf(Buf), NumRead);
        for i:=1 to NumRead do begin inc(d,buf[i]);k:=k*-1;inc(d2,buf[i]*k);end;
      until (NumRead = 0);
      CloseFile(InF);
end;


procedure S_Pack(var Lne:string);
var s:string;R,i:cardinal;

procedure String_Pack_self(R,X,n:cardinal;var s:string);
var i:cardinal;d:byte;_ep:real;
  function _GenCiclNam(R,d,N:cardinal):cardinal;
  var i:cardinal;
  begin
    _ep:=d;
    for i:=1 to N do begin
    _ep:=abs(sin(_ep));
    _ep:=_ep*R;
    end;
    _GenCiclNam:=trunc(ep);
  end;
  function _GenP(gran:cardinal):word;
  begin
    _ep:=abs(sin(_ep));
    _ep:=_ep*100;
    _ep:=_ep-trunc(_ep);
    _GenP:=trunc(_ep*gran);
  end;
begin
    _GenCiclNam(R,X,n);
    for i:=1 to length(s) do begin
    d:=ord(s[i])+_GenP(20);
    s[i]:=chr(d);
    end;
    s:=inttostr(R)+s;
    String_Pack(s);
end;

begin
   for i:=1 to 1000 do begin
     s:=Lne;
     R:=gen(10000,99999)*10000+gen(1000,9999);//429496729;
     String_Pack_self(R,11,1,s);
     if pos('_',s)=0 then break;
   end;
     Lne:=s;
end;

procedure TForm1.Button1Click(Sender: TObject);
var s:string;
begin
    s:=edit1.Text;
    SPack(s);
    edit2.Text:=s;
end;



procedure S_UnPack(var Lne:string);
var s,h:string;R:cardinal;i:integer;

procedure String_UnPack_self(R,X,n:cardinal;var s:string);
var i:cardinal;d:byte;_ep:real;
  function _GenCiclNam(d,N:cardinal):cardinal;
  var i:cardinal;
  begin
    _ep:=d;
    for i:=1 to N do begin
    _ep:=abs(sin(_ep));
    _ep:=_ep*R;
    end;
    _GenCiclNam:=trunc(ep);
  end;
  function _GenP(gran:cardinal):word;
  begin
    _ep:=abs(sin(_ep));
    _ep:=_ep*100;
    _ep:=_ep-trunc(_ep);
    _GenP:=trunc(_ep*gran);
  end;
begin
    _GenCiclNam(X,n);
    for i:=1 to length(s) do begin
    d:=ord(s[i])-_GenP(20);
    s[i]:=chr(d);
    end;
end;
begin
     s:=Lne;
     String_UnPack(s);
     h:=s;
     setlength(h,9);
     R:=strtoint(h);
     h:='';
     for i:=10 to length(s) do h:=h+s[i];
     String_UnPack_self(R,11,1,h);
     Lne:=h;
end;

procedure TForm1.Button2Click(Sender: TObject);
var s:string;
begin
    s:=edit2.Text;
    SUnPack(s);
    edit3.Text:=s;
end;

procedure TForm1.Button3Click(Sender: TObject);
var d,d2:cardinal;
begin
   if OpenDialog1.Execute then begin
   GetFileDIdent(OpenDialog1.FileName,d,d2);
   edit1.Text:=inttostr(d)+' '+inttostr(d2);
   end;
end;

end.
