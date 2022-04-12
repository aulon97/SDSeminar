page 50121 "CSD Seminar Ledger Entries"
{
    PageType = List;

    UsageCategory = Lists;
    SourceTable = "CSD Seminar Ledger Entry";
    Caption = 'Seminar Ledger Entry';
    Editable = false;


    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }

                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }

                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    Visible = false;
                }

                field("Entry Type"; Rec."Entry Type")
                {
                    ApplicationArea = All;
                }

                field("Seminar No."; Rec."Seminar No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }


                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ApplicationArea = All;
                }

                field("Charge Type"; Rec."Charge Type")
                {
                    ApplicationArea = All;
                }

                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }

                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }

                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                }
                field("Total Price"; Rec."Total Price")
                {
                    ApplicationArea = All;
                }
                field(Chargeable; Rec.Chargeable)
                {
                    ApplicationArea = All;
                }
                field("Participant Contact No."; Rec."Participant Contact No.")
                {
                    ApplicationArea = All;
                }
                field("Participant Name"; Rec."Participant Name")
                {
                    ApplicationArea = All;
                }
                field("Instructor Resource No."; Rec."Instructor Resource No.")
                {
                    ApplicationArea = All;
                }
                field("Room Resource No."; Rec."Room Resource No.")
                {
                    ApplicationArea = All;
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                }
                field("Seminar Registration No."; Rec."Seminar Registration No.")
                {
                    ApplicationArea = All;
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }


            }
        }
        area(Factboxes)
        {
            systempart("Links"; Links)
            {

            }

            systempart("Notes"; Notes)
            {

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}