page 50102 "CSD Seminar List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "CSD Seminar";
    Editable = false;
    CardPageId = 50101;

    layout
    {
        area(Content)
        {
            group(Repeater)
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

                }

            }
        }
    }

    var
        myInt: Integer;
}