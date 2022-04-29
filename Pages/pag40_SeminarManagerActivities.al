page 50140 "CSD Seminar Manager Activities"
{
    PageType = CardPart;
    Caption = 'Seminar Manager Activities';
    Editable = false;
    SourceTable = "CSD Seminar Cue";

    layout
    {
        area(Content)
        {
            cuegroup(Registrations)
            {
                Caption = 'Registrations';
                field(Planned; Rec.Planned)
                {
                    ApplicationArea = All;
                }
                field(Registered; Rec.Registered)
                {
                    ApplicationArea = All;
                }
                actions
                {
                    action(New)
                    {
                        Caption = 'New';
                        RunObject = page "CSD Seminar Registration";
                        RunPageMode = Create;
                    }
                }

            }

            cuegroup("For Posting")
            {
                field(Closed; Rec.Closed)
                {

                }
            }
        }

    }

    trigger OnOpenPage()

    begin
        if not Rec.Get then begin
            rec.Init();
            rec.Insert()
        end;
    end;

}
