unit Quest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;

type
  TQuestion = record
    ImageFileName: string;
    QuestionText: string;
    CorrectAnswer: Boolean;
  end;

  TForm12 = class(TForm)
    ImageQuestion: TImage;
    LabelQuestion: TLabel;
    ButtonYes: TButton;
    ButtonNo: TButton;
    LabelResult: TLabel;
    Image2: TImage;
    procedure FormCreate(Sender: TObject);
    procedure ButtonYesClick(Sender: TObject);
    procedure ButtonNoClick(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    Questions: array of TQuestion;
    CurrentQuestionIndex: Integer;
    CorrectAnswersCount: Integer;
    procedure DisplayQuestion(QuestionIndex: Integer);
    procedure ShowResult;
  end;

var
  Form12: TForm12;

implementation

{$R *.dfm}

uses Menu;

procedure TForm12.FormCreate(Sender: TObject);
var
  FileLines: TStringList;
  i: Integer;
begin
  FileLines := TStringList.Create;
  try
    FileLines.LoadFromFile(ExtractFilePath(ParamStr(0)) +'quest.txt', TEncoding.UTF8);

    SetLength(Questions, FileLines.Count div 3);

    for i := 0 to Length(Questions) - 1 do
    begin
      Questions[i].ImageFileName := FileLines[i * 3];
      Questions[i].QuestionText := FileLines[i * 3 + 1];
      Questions[i].CorrectAnswer := StrToBool(FileLines[i * 3 + 2]);
    end;

    CurrentQuestionIndex := 0;
    CorrectAnswersCount := 0;
    DisplayQuestion(CurrentQuestionIndex);
  finally
    FileLines.Free;
  end;
end;

procedure TForm12.Image2Click(Sender: TObject);
begin
Form12.Close;
Form2.Show;
    CurrentQuestionIndex := 0;
    CorrectAnswersCount := 0;
    DisplayQuestion(CurrentQuestionIndex);
    LabelResult.Caption :='';
    ButtonYes.Enabled := True;
    ButtonNo.Enabled := True;

end;

procedure TForm12.DisplayQuestion(QuestionIndex: Integer);
begin
  ImageQuestion.Picture.LoadFromFile(Questions[QuestionIndex].ImageFileName);
  LabelQuestion.Caption := Questions[QuestionIndex].QuestionText;
end;

procedure TForm12.ButtonYesClick(Sender: TObject);
begin
  if Questions[CurrentQuestionIndex].CorrectAnswer then
    Inc(CorrectAnswersCount);

  Inc(CurrentQuestionIndex);

  if CurrentQuestionIndex < Length(Questions) then
    DisplayQuestion(CurrentQuestionIndex)
  else
    ShowResult;
end;

procedure TForm12.ButtonNoClick(Sender: TObject);
begin
  if not Questions[CurrentQuestionIndex].CorrectAnswer then
    Inc(CorrectAnswersCount);

  Inc(CurrentQuestionIndex);

  if CurrentQuestionIndex < Length(Questions) then
    DisplayQuestion(CurrentQuestionIndex)
  else
    ShowResult;
end;

procedure TForm12.ShowResult;
var
  Score: Double;
begin
  Score := (CorrectAnswersCount / Length(Questions)) * 100;
  LabelResult.Caption := Format('���� ��������! ���������� �������: %d �� %d (%.2f%%)', [CorrectAnswersCount, Length(Questions), Score]);
  ButtonYes.Enabled := False;
  ButtonNo.Enabled := False;
end;

end.
