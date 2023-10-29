unit Menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Vcl.Menus, Vcl.Buttons, Vcl.Imaging.pngimage, ShellAPI;

type
  TForm2 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    Image2: TImage;
    Image1: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    procedure Image1Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure a1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses TestZapr, TestPrior, TestPredupr, TestPredpis, Zastavka, InfoPredupr, InfoKategor, Quest;

procedure TForm2.a1Click(Sender: TObject);
begin
  ShellExecute(0, PChar('Open'), PChar('Source\�������.chm'), nil, nil, SW_SHOW);

end;

procedure TForm2.Image1Click(Sender: TObject);
begin
Form2.Hide;
Form11.Show;
end;

procedure TForm2.Image3Click(Sender: TObject);
begin
Form2.Hide;
Form3.Show;
end;

procedure TForm2.Image4Click(Sender: TObject);
begin
Form2.Hide;
Form4.Show;
end;

procedure TForm2.Image5Click(Sender: TObject);
begin
Form2.Hide;
Form5.Show;
end;

procedure TForm2.Image6Click(Sender: TObject);
begin
Form2.Hide;
Form6.Show;
end;

procedure TForm2.Image7Click(Sender: TObject);
begin
Form2.Hide;
Form12.Show;
end;

procedure TForm2.Image8Click(Sender: TObject);
begin
Close;
end;

procedure TForm2.N1Click(Sender: TObject);
begin
ShellExecute(0, PChar('Open'), PChar('�������.chm'), nil, nil, SW_SHOW);
end;

end.
