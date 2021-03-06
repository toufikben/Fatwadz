unit SPLASHSCREEN;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.WinXCtrls,MMSystem;

type
  TForm1 = class(TForm)
    ActivityIndicator1: TActivityIndicator;
    Image1: TImage;
    Timer1: TTimer;
   procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
   public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit1;


procedure TForm1.FormCreate(Sender: TObject);
//begin if FileExists( 'pic\2.png') then Image1.Picture.LoadFromFile('pic\2.png');
var
vExeFile: string;
  RS: TResourceStream;
  begin
if not DirectoryExists('pic') then
 begin
 CreateDir('pic');  end;
if FileExists( 'pic\splash.png')   then
 begin
  Image1.Picture.LoadFromFile('pic\splash.png')
  end
  else
  begin
   RS := TResourceStream.Create(HInstance,'splash', RT_RCDATA);
   try
    vExeFile := ExtractFilePath(ParamStr(0)) +'pic\'+'splash.png';
      RS.SaveToFile(vExeFile);
     Image1.Picture.LoadFromFile('pic\splash.png');
  finally
    RS.Free;
  end;
end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
vExeFile: string;
  RS: TResourceStream;
  begin
if not DirectoryExists('sound') then
 begin
 CreateDir('sound');  end;
if FileExists( 'sound\besmala.wav')   then
 begin
 sndPlaySound('sound\besmala.wav',SND_SYNC );
 Timer1.Enabled := false;
 ActivityIndicator1.Animate := False;
 form1.hide;
  main.Visible := true;

 end
  else
  begin
   RS := TResourceStream.Create(HInstance,'besmala', RT_RCDATA);

  try
    // setting up the temporary file name
    vExeFile := ExtractFilePath(ParamStr(0)) +'sound\'+'besmala.wav';
      RS.SaveToFile(vExeFile);
      sndPlaySound('sound\besmala.wav',SND_SYNC );
       ActivityIndicator1.Animate := False;
 Timer1.Enabled := false;
 form1.hide;
 main.show;
  finally
    RS.Free;
  end;
   end;
 end;
end.
