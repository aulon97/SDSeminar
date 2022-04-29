page 50141 "CSD My Seminar"
{
    PageType = ListPart;
    SourceTable = "CSD My Seminar";
    Caption = 'My Seminars';

    layout
    {
        area(Content)
        {
            repeater(group)
            {
                field("Seminar No."; Rec."Seminar No.")
                {
                    ApplicationArea = All;
                }
                field(Name; Seminar.Name)
                {
                    ApplicationArea = All;
                }
                field(Duration; Seminar."Seminar Duration")
                {
                    ApplicationArea = All;
                }
                field(Price; Seminar."Seminar Price")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Open)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    OpenSeminarCard;
                end;
            }
        }
    }
    var
        Seminar: Record "CSD Seminar";

    trigger OnOpenPage();
    begin
        Rec.SetRange("User ID", UserId)
    end;

    trigger OnAfterGetRecord()
    begin
        if Seminar.Get(Rec."Seminar No.") then;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Clear(Seminar);
    end;

    local procedure OpenSeminarCard()
    begin
        if Seminar."No." <> '' then
            Page.Run(Page::"CSD Seminar Card", Seminar);
    end;
}