unit InfoKategor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.jpeg;

type
  TForm11 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Image2: TImage;
    Image3: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

{$R *.dfm}

uses InfoZapr, InfoPrior, InfoPredupr, InfoPredpis, Menu;

procedure TForm11.Button1Click(Sender: TObject);
begin
Form11.Hide;
Form7.Show;
end;

procedure TForm11.Button2Click(Sender: TObject);
begin
Form11.Hide;
Form8.Show;
end;

procedure TForm11.Button3Click(Sender: TObject);
begin
Form11.Hide;
Form9.Show;
end;

procedure TForm11.Button4Click(Sender: TObject);
begin
Form11.Hide;
Form10.Show;
end;

procedure TForm11.Image2Click(Sender: TObject);
begin
Form11.Hide;
Form2.Show;
end;

end.
