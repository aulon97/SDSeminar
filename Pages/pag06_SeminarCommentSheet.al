page 50106 "CSD Seminar Comment Sheet"
{
    PageType = List;
    SourceTable = "CSD Seminar Comment Line";
    Caption = 'Seminar Comment Sheet';
    UsageCategory = Lists;
    ApplicationArea = All;



    layout
    {
        area(Content)
        {
            group(Repeater)
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


}