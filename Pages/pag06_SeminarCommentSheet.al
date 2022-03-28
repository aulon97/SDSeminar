page 50106 "CSD Seminar Comment Sheet"
{
    PageType = List;
    SourceTable = "CSD Seminar Comment Line";
    Caption = 'Seminar Comment Sheet';

    layout
    {
        area(Content)
        {
            group(Repeater)
            {
                field(Date; Rec.Date)
                {
                }

                field(Code; Rec.Code)
                {
                    Visible = false;
                }

                field("Comment"; Rec.Comment)
                {
                }

            }
        }
    }


}