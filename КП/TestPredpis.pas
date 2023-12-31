unit TestPredpis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg;

type
  TQuestion = record
    ImageFileName: string;
    Options: array[0..3] of string;
    CorrectAnswer: Integer;
  end;

  TForm6 = class(TForm)
    Image1: TImage;
    ResultLabel: TLabel;
    QuestionImage: TImage;
    Image2: TImage;
    OptionGroup: TRadioGroup;
    ExitButton: TButton;
    NextButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure NextButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    Questions: array of TQuestion;
    CurrentQuestionIndex: Integer;
    CorrectAnswersCount: Integer;
    procedure DisplayQuestion(QuestionIndex: Integer);
    function CheckAnswer: Boolean;
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

uses Menu;

procedure TForm6.FormCreate(Sender: TObject);
var
  FileLines: TStringList;
  i: Integer;
begin
  FileLines := TStringList.Create;
  try
    FileLines.LoadFromFile(ExtractFilePath(ParamStr(0)) +'��������������.txt', TEncoding.UTF8);

    SetLength(Questions, FileLines.Count div 6);

    for i := 0 to Length(Questions) - 1 do
    begin
      Questions[i].ImageFileName := FileLines[i * 6];
      Questions[i].Options[0] := FileLines[i * 6 + 1];
      Questions[i].Options[1] := FileLines[i * 6 + 2];
      Questions[i].Options[2] := FileLines[i * 6 + 3];
      Questions[i].Options[3] := FileLines[i * 6 + 4];
      Questions[i].CorrectAnswer := StrToInt(FileLines[i * 6 + 5]);
    end;

    CurrentQuestionIndex := 0;
    CorrectAnswersCount := 0;
    DisplayQuestion(CurrentQuestionIndex);

  finally
    FileLines.Free;
  end;
end;

procedure TForm6.Image2Click(Sender: TObject);
begin
Form6.Hide;
Form2.Show;
    CurrentQuestionIndex := 0;
    CorrectAnswersCount := 0;
    DisplayQuestion(CurrentQuestionIndex);
    ResultLabel.Caption := '';
    NextButton.Enabled := True;
end;

procedure TForm6.DisplayQuestion(QuestionIndex: Integer);
begin
  QuestionImage.Picture.LoadFromFile(Questions[QuestionIndex].ImageFileName);
  OptionGroup.Items.Clear;
  OptionGroup.Items.Add(Questions[QuestionIndex].Options[0]);
  OptionGroup.Items.Add(Questions[QuestionIndex].Options[1]);
  OptionGroup.Items.Add(Questions[QuestionIndex].Options[2]);
  OptionGroup.Items.Add(Questions[QuestionIndex].Options[3]);

  OptionGroup.ItemIndex := -1;
end;

procedure TForm6.ExitButtonClick(Sender: TObject);
begin
Form6.Hide;
Form2.Show;
    CurrentQuestionIndex := 0;
    CorrectAnswersCount := 0;
    DisplayQuestion(CurrentQuestionIndex);
    ResultLabel.Caption := '';
    NextButton.Enabled := True;
end;

function TForm6.CheckAnswer: Boolean;
begin
  Result := OptionGroup.ItemIndex = Questions[CurrentQuestionIndex].CorrectAnswer;
end;

procedure TForm6.NextButtonClick(Sender: TObject);
begin
  if OptionGroup.ItemIndex <> -1 then
  begin
    if CheckAnswer then
      Inc(CorrectAnswersCount);

    Inc(CurrentQuestionIndex);
    if CurrentQuestionIndex < Length(Questions) then
      DisplayQuestion(CurrentQuestionIndex)
    else
    begin
      ResultLabel.Caption := Format('���� ��������! ���������� ���������� �������: %d �� %d', [CorrectAnswersCount, Length(Questions)]);
      NextButton.Enabled := False;
    end;
  end
  else
    ShowMessage('�������� ������� ������!');
end;

end.
