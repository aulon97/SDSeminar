page 50142 "CSD Seminar Manager RoleCenter"
{
    PageType = RoleCenter;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Seminar Manager RoleCenter';

    layout
    {
        area(RoleCenter)
        {
            group(Column1)
            {
                part("Seminar Manager Activities"; "CSD Seminar Manager Activities")
                {
                    ApplicationArea = All;
                }
                part("My Seminars"; "CSD My Seminar")
                {
                    ApplicationArea = All;
                }

            }
            group(Column2)
            {
                part("My Customers"; "My Customers")
                {
                    ApplicationArea = All;
                }

                systempart("My Notes"; MyNotes)
                {
                    ApplicationArea = All;
                }
                part("ReportInbox"; "Report Inbox Part")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {
        area(Embedding)
        {
            action(SeminarRegistrations)
            {
                ApplicationArea = All;
                Caption = 'Seminar Registrations';
                RunObject = page "CSD Posted Seminar Reg. List";
                ToolTip = 'Create Seminar Registrations';
            }
            action(Seminars)
            {
                ApplicationArea = All;
                Caption = 'Seminar';
                Image = List;
                RunObject = Page "CSD Seminar List";
                ToolTip = 'View all seminars';
            }
            action(Instructors)
            {
                ApplicationArea = All;
                Caption = 'Instructors';
                RunObject = page "Resource List";
                RunPageView = where(Type = const(Instructor));
                ToolTip = 'View all resources registers as Instructors.';
            }
            action(Room)
            {
                ApplicationArea = All;
                Caption = 'Room';
                RunObject = page "Resource List";
                RunPageView = where(Type = const(Room));
                ToolTip = 'View all resources registeres as Rooms.';
            }
            action("Sales Invoices")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Invoices';
                Image = Invoice;
                RunObject = Page "Sales Invoice List";
                ToolTip = 'Registers your sales to invoice';
            }
            action("Sales Credit Memos")
            {
                ApplicationArea = All;
                Caption = 'Sales Credit Memos';
                RunObject = page "Sales Credit Memos";
                ToolTip = 'Revert the financial transactions involved when your customers want to cancel a purchase';
            }
            action(Customers)
            {
                Caption = 'Customers';
                ApplicationArea = All;
                RunObject = page "Customer List";
                ToolTip = 'View or edit detailed information for the customers that you trade with';
            }
        }
        area(Sections)
        {
            group("Posted Documents")
            {
                Caption = 'Posted Documents';
                Image = FiledPosted;
                ToolTip = 'View History for Sales,shipmentsmand inventory.';

                action("Posted Seminar Registrations")
                {
                    Caption = 'Posted Seminar Registration';
                    Image = Timesheet;
                    RunObject = page "CSD Posted Seminar Reg. List";
                    ToolTip = 'Open the list of posted Registrations.';
                }
                action("Posted Sales Invoice")
                {
                    Caption = 'Posted Sales Invoice';
                    Image = PostedOrder;
                    RunObject = page "Posted Sales Invoices";
                    ToolTip = 'Open List of posted sales invoices.';
                }
                action("Posted Sales Credit Memos")
                {
                    Caption = 'Posted Sales Credit Memos';
                    Image = PostedOrder;
                    RunObject = page "Posted Sales Credit Memos";
                    ToolTip = 'Open list of the posted sales credit memos.';
                }
                action("Registers")
                {
                    Caption = 'Seminar Registers';
                    Image = PostedShipment;
                    RunObject = page "CSD Seminar Registers";
                    ToolTip = 'Open the list of seminar registers';
                }
            }
        }
        area(Creation)
        {
            action(NewSeminarRegistration)
            {
                Caption = 'Seminar Registration';
                Image = NewTimesheet;
                RunObject = page "CSD Seminar Registration";
                RunPageMode = Create;
            }
            action(NewSalesInvoice)
            {
                Caption = 'Sales Invoice';
                RunObject = page "Sales Invoice";
                Image = NewSalesInvoice;
                RunPageMode = Create;
            }

        }
        area(Processing)
        {
            action(CreateInvoices)
            {
                Caption = 'Create Invoices';
                Image = CreateJobSalesInvoice;
                RunObject = report "CSD Create Seminar Invoices";
            }
            action(Navigate)
            {
                Caption = 'Navigate';
                Image = Navigate;
                RunObject = page Navigate;
                RunPageMode = edit;
            }
        }
    }

}