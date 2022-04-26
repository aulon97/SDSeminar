page 50122 "CSD Seminar Registers"
// CSD1.00 - 2018-01-01 - D. E. Veloper
//   Chapter 7 - Lab 2-11

{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "CSD Seminar Register";
    Caption = 'Seminar Register';
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = All;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                }
                field("Source Code"; Rec."Source Code")
                {
                    ApplicationArea = All;
                }
                field("Journal Batch Name"; Rec."Journal Batch Name")
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
        area(Navigation)
        {
            action("Seminar Ledgers")
            {
                image = WarrantyLedger;
                RunObject = codeunit "CSD Seminar Reg.-Show Ledger";
                ApplicationArea = All;
            }
        }
    }
}