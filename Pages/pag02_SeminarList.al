page 50102 "CSD Seminar List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "CSD Seminar";
    Editable = false;
    CardPageId = 50101;
    Caption = 'Seminar List';

    layout
    {
        area(Content)
        {
            repeater(group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;

                }

                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }

                field("Seminar Duration"; Rec."Seminar Duration")
                {
                    ApplicationArea = All;
                }

                field("Seminar Price"; Rec."Seminar Price")
                {
                    ApplicationArea = All;
                    AutoFormatType = 10;
                    AutoFormatExpression = '1,EUR';
                }

                field("Minimum Partecipants"; Rec."Minimum Partecipants")
                {
                    ApplicationArea = All;
                }

                field("Maximum Partecipants"; Rec."Maximum Partecipants")
                {
                    ApplicationArea = All;
                }

            }
        }

        area(FactBoxes)
        {
            systempart("Links"; Links)
            {
                ApplicationArea = All;
            }

            systempart("Notes"; Notes)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("&Seminar")
            {
                action("Co&mments")
                {
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = Comment;
                    ApplicationArea = All;
                    PromotedOnly = true;
                    RunObject = page "CSD Seminar Comment Sheet";
                    RunPageLink = "Table Name" = const(Seminar), "No." = field("No.");
                }
                action("Ledger Entries")
                {
                    Caption = 'Ledger Entries';
                    RunObject = Page "CSD Seminar Ledger Entries";
                    RunPageLink = "Seminar No." = Field("No.");
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortcutKey = "Ctrl + F7";
                    Image = WarrantyLedger;
                }

                action("Registrations")
                {
                    caption = '&Registrations';
                    RunObject = Page "CSD Seminar Registration List";
                    RunPageLink = "Seminar No." = Field("No.");
                    image = Timesheet;
                    Promoted = true;
                    PromotedCategory = Process;
                }

            }
        }
        area(Processing)
        {
            action("Seminar Registration")
            {
                RunObject = page "CSD Seminar Registration";
                RunPageLink = "Seminar No." = Field("No.");
                RunPageMode = Create;
                Image = NewTimesheet;
                Promoted = true;
                PromotedCategory = New;
            }
        }

    }

    var
        myInt: Integer;
}