page 50107 "CSD Seminar Comment List"
{
    PageType = List;
    SourceTable = "CSD Seminar Comment Line";
    Caption = 'Seminar Comment List';
    Editable = false;
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