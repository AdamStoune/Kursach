unit InfoZapr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Vcl.Imaging.jpeg;

type
  TForm7 = class(TForm)
    ImagePicture: TImage;
    MemoText: TMemo;
    ButtonNext: TButton;
    Image1: TImage;
    ButtonMenu: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ButtonNextClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure ButtonMenuClick(Sender: TObject);
  private
    { Private declarations }
    ImagePaths: TStringList;
    CurrentIndex: Integer;
    Texts: TStringList;
  public
    { Public declarations }
    destructor Destroy; override;
  end;

var
  Form7: TForm7;

implementation

{$R *.dfm}

uses InfoKategor, Menu;

procedure TForm7.FormCreate(Sender: TObject);
var
  Text: string;
begin
  ImagePaths := TStringList.Create;
  ImagePaths.LoadFromFile(ExtractFilePath(ParamStr(0)) +'zapr.txt', TEncoding.UTF8);

  CurrentIndex := 0;

  if ImagePaths.Count > 0 then
    ImagePicture.Picture.LoadFromFile(ImagePaths[CurrentIndex]);

  Texts := TStringList.Create;
  Texts.LoadFromFile(ExtractFilePath(ParamStr(0)) +'zaprtext.txt', TEncoding.UTF8);

  if Texts.Count > 0 then
  begin
    Text := StringReplace(Texts[CurrentIndex], '*', sLineBreak, [rfReplaceAll]);
    MemoText.Text := StringReplace(Text, '*', '', [rfReplaceAll]);
  end;
end;

procedure TForm7.Image1Click(Sender: TObject);
begin
Form7.Hide;
Form11.Show;
end;

procedure TForm7.ButtonMenuClick(Sender: TObject);
begin
Form7.Hide;
Form2.Show;
end;

procedure TForm7.ButtonNextClick(Sender: TObject);
begin
  Inc(CurrentIndex);
  if CurrentIndex >= ImagePaths.Count then
    CurrentIndex := 0;

  if Texts.Count > CurrentIndex then
  begin
    Text := StringReplace(Texts[CurrentIndex], '*', sLineBreak, [rfReplaceAll]);
    MemoText.Text := StringReplace(Text, '*', '', [rfReplaceAll]);
  end;

  ImagePicture.Picture.LoadFromFile(ImagePaths[CurrentIndex]);
end;

destructor TForm7.Destroy;
begin
  ImagePaths.Free;
  Texts.Free;
  inherited Destroy;
end;

end.
