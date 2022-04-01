page 50106 "CSD Seminar Comment Sheet"
{
    PageType = List;
    SourceTable = "CSD Seminar Comment Line";
    Caption = 'Seminar Comment Sheet';
    AutoSplitKey = true;
    //UsageCategory = Lists;


    layout
    {
        area(Content)
        {
            repeater(group)
            {
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                }

                field(Code; Rec.Code)
                {
                    Visible = false;
                    ApplicationArea = All;
                }

                field("Comment"; Rec.Comment)
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.SetupNewLine();
    end;

}