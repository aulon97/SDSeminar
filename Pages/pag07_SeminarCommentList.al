page 50107 "CSD Seminar Comment List"
{
    PageType = List;
    SourceTable = "CSD Seminar Comment Line";
    Caption = 'Seminar Comment List';
    Editable = false;

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