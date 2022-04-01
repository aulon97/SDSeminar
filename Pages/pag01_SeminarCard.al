page 50101 "CSD Seminar Card"
{
    PageType = Card;
    SourceTable = "CSD Seminar";
    Caption = 'Seminar Card';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    Caption = 'No.';
                    ApplicationArea = All;
                    AssistEdit = true;

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit then
                            CurrPage.Update;

                    end;
                }

                field("Name"; Rec.Name)
                {
                    ApplicationArea = All;
                }

                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = All;
                }

                field("Seminar Duration"; Rec."Seminar Duration")
                {
                    ApplicationArea = All;
                    Style = StrongAccent;
                }

                field("Minimum Partecipations"; Rec."Minimum Partecipants")
                {
                    ApplicationArea = All;
                }

                field("Maximum Partecipations"; Rec."Maximum Partecipants")
                {
                    ApplicationArea = All;
                }

                field("Blocked"; Rec.Blocked)
                {
                    ApplicationArea = All;
                }

                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = All;
                }




            }

            group(Invoicing)
            {
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                }

                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = All;
                }

                field("Seminar Price"; Rec."Seminar Price")
                {
                    ApplicationArea = All;
                    AutoFormatType = 10;
                    AutoFormatExpression = '1,EUR';
                    Style = Favorable;
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

            }
        }
    }

}