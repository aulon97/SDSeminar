page 50136 "CSD Posted Seminar Reg. List"
{
    // CSD1.00 - 2018-01-01 - D. E. Veloper
    //   Chapter 7 - Lab 3
    //     - Created new page

    Caption = 'Seminar Registration List';
    CardPageID = "CSD Posted Seminar Reg.";
    Editable = false;
    PageType = List;
    SourceTable = "CSD Posted Seminar Reg. Header";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                }
                field("Seminar No."; Rec."Seminar No.")
                {
                    ApplicationArea = All;
                }
                field("Seminar Name"; Rec."Seminar Name")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = All;
                }
                field("Maximum Participants"; Rec."Maximum Participants")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(factboxes)
        {
            part("Seminar Details"; "CSD Seminar Details FactBox")
            {
                SubPageLink = "No." = Field("Seminar No.");
                ApplicationArea = All;
            }
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
        area(navigation)
        {
            group("&Seminar Registration")
            {
                Caption = '&Seminar Registration';
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = Comment;
                    RunObject = Page 50106;
                    RunPageLink = "No." = Field("No.");
                    RunPageView = where("Table Name" = const("Posted Seminar Registration Header"));
                }
                action("&Charges")
                {
                    Caption = '&Charges';
                    Image = Costs;
                    RunObject = Page "CSD Posted Seminar Charges";
                    RunPageLink = "Document No." = Field("No.");
                }
            }
        }
    }
}

