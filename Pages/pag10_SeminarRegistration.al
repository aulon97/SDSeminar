page 50110 "CSD Seminar Registration"
{
    // CSD1.00 - 2018-01-01 - D. E. Veloper
    //   Chapter 6 - Lab 3-1
    //     - Created new page
    //Chapter 7 - Lab 4-8 
    // Added Action Post

    Caption = 'Seminar Registration';
    PageType = Document;
    SourceTable = "CSD Seminar Reg. Header";
    //UsageCategory = Tasks;


    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    AssistEdit = true;
                    trigger OnAssistEdit();
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.UPDATE;
                    end;
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
                field("Instructor Resource No."; Rec."Instructor Resource No.")
                {
                    ApplicationArea = All;
                }
                field("Instructor Name"; Rec."Instructor Name")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("Document Date"; Rec."Document Date")
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
                field("Minimum Participants"; Rec."Minimum Participants")
                {
                    ApplicationArea = All;
                }
                field("Maximum Participants"; Rec."Maximum Participants")
                {
                    ApplicationArea = All;
                }
            }

            part(SeminarRegistrationLine; "CSD Seminar Reg. Subpage")
            {
                Caption = 'Lines';
                SubPageLink = "Document No." = field("No.");
            }

            group("Seminar Room")
            {
                field("Room Resource No."; Rec."Room Resource No.")
                {
                    ApplicationArea = All;
                }
                field("Room Name"; Rec."Room Name")
                {
                    ApplicationArea = All;
                }
                field("Room Address"; Rec."Room Address")
                {
                    ApplicationArea = All;
                }
                field("Room Address 2"; Rec."Room Address 2")
                {
                    ApplicationArea = All;
                }
                field("Room Post Code"; Rec."Room Post Code")
                {
                    ApplicationArea = All;
                }
                field("Room City"; Rec."Room City")
                {
                    ApplicationArea = All;
                }
                field("Room Country/Reg. Code"; Rec."Room Country/Reg. Code")
                {
                    ApplicationArea = All;
                }
                field("Room County"; Rec."Room County")
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
                }
            }
        }
        area(factboxes)
        {
            part("Seminar Details FactBox"; "CSD Seminar Details FactBox")
            {
                SubPageLink = "No." = field("Seminar No.");
            }

            part("Customer Details FactBox"; "Customer Details FactBox")
            {
                Provider = SeminarRegistrationLine;
                SubPageLink = "No." = field("Bill-to Customer No.");
            }
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
                    RunPageView = where("Table Name" = Const("Seminar Registration Header"));
                }
                action("&Charges")
                {
                    Caption = '&Charges';
                    Image = Costs;
                    RunObject = Page 50124;
                    RunPageLink = "Document No." = Field("No.");
                }
            }
            group("&Post Seminar")
            {
                action("&Post")
                {
                    Caption = '&Post';
                    Image = PostDocument;
                    Promoted = true;
                    PromotedIsBig = true;
                    ShortcutKey = F9;
                    RunObject = codeunit "CSD Seminar-Post (Yes/No)";
                }
            }
        }
    }
}

