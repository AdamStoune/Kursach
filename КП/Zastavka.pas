unit Zastavka;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    Label2: TLabel;
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

uses Menu;


procedure TForm1.FormCreate(Sender: TObject);
begin
timer1.Enabled:=true;
end;


procedure TForm1.Timer1Timer(Sender: TObject);
begin
progressbar1.Position:= progressbar1.Position + 1;
if progressbar1.Position = progressbar1.Max then
begin
timer1.Enabled := false;
Form1.Hide;
Form2.Show;
end;
end;

end.
