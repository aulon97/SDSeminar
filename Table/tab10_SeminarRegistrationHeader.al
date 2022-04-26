table 50110 "CSD Seminar Reg. Header"
{
    // CSD1.00 - 2018-01-01 - D. E. Veloper
    //   Chapter 6 - Lab 1-3 & Lab 1-4
    //     - Created new table

    Caption = 'Seminar Registration Header';


    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                if "No." <> xRec."No." then begin
                    SeminarSetup.Get;
                    NoSeriesMgt.TestManual(SeminarSetup."Seminar Registration Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                if "Starting Date" <> xRec."Starting Date" then
                    TestField(Status, Status::Planning);
            end;
        }
        field(3; "Seminar No."; Code[20])
        {
            TableRelation = "CSD Seminar";
            Caption = 'Seminar No.';
            DataClassification = ToBeClassified;


            trigger OnValidate();
            begin
                if "Seminar No." <> xRec."Seminar No." then begin
                    SeminarRegLine.Reset;
                    SeminarRegLine.SetRange("Document No.", "No.");
                    SeminarRegLine.SetRange(Registered, true);
                    if not SeminarRegLine.Isempty then
                        ERROR(
                          Text002,
                          FieldCaption("Seminar No."),
                          SeminarRegLine.TableCaption,
                          SeminarRegLine.FieldCaption(Registered),
                          true);

                    Seminar.Get("Seminar No.");
                    Seminar.TestField(Blocked, false);
                    Seminar.TestField("Gen. Prod. Posting Group");
                    Seminar.TestField("VAT Prod. Posting Group");
                    "Seminar Name" := Seminar.Name;
                    Duration := Seminar."Seminar Duration";
                    "Seminar Price" := Seminar."Seminar Price";
                    "Gen. Prod. Posting Group" := Seminar."Gen. Prod. Posting Group";
                    "VAT Prod. Posting Group" := Seminar."VAT Prod. Posting Group";
                    "Minimum Participants" := Seminar."Minimum Partecipants";
                    "Maximum Participants" := Seminar."Maximum Partecipants";
                end;
            end;
        }
        field(4; "Seminar Name"; Text[50])
        {
            Caption = 'Seminar Name';
            DataClassification = ToBeClassified;

        }
        field(5; "Instructor Resource No."; Code[10])
        {
            TableRelation = Resource where(Type = const(Instructor));
            Caption = 'Instructor Code';
            DataClassification = ToBeClassified;


            trigger OnValidate();
            begin
                CalcFields("Instructor Name");
            end;
        }
        field(6; "Instructor Name"; Text[100])
        {
            CalcFormula = Lookup(Resource.Name where("No." = Field("Instructor Resource No."),
                                                      Type = const(Instructor)));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Instructor Name';

        }
        field(7; Status; Enum "Status")
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
        }
        field(8; Duration; Decimal)
        {
            DecimalPlaces = 0 : 1;
            Caption = 'Duration';
            DataClassification = ToBeClassified;
        }
        field(9; "Maximum Participants"; Integer)
        {
            Caption = 'Maximum Partecipants';
            DataClassification = ToBeClassified;
        }
        field(10; "Minimum Participants"; Integer)
        {
            Caption = 'Minimum Partecipants';
            DataClassification = ToBeClassified;
        }
        field(11; "Room Resource No."; Code[10])//behet room resource no.
        {
            TableRelation = Resource where(Type = const(Room));
            Caption = 'Room Code';
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                if "Room Resource No." = '' then begin
                    "Room Name" := '';
                    "Room Address" := '';
                    "Room Address 2" := '';
                    "Room Post Code" := '';
                    "Room City" := '';
                    "Room County" := '';
                    "Room Country/Reg. Code" := '';
                end else begin
                    SeminarRoom.GET("Room Resource No.");
                    "Room Name" := SeminarRoom.Name;
                    "Room Address" := SeminarRoom.Address;
                    "Room Address 2" := SeminarRoom."Address 2";
                    "Room Post Code" := SeminarRoom."Post Code";
                    "Room City" := SeminarRoom.City;
                    "Room County" := SeminarRoom.County;
                    "Room Country/Reg. Code" := SeminarRoom."Country/Region Code";

                    if (CurrFieldNo <> 0) then begin
                        if (SeminarRoom."CSD Maximum Partecipants" <> 0) and
                           (SeminarRoom."CSD Maximum Partecipants" < "Maximum Participants")
                        then begin
                            if Confirm(Text004, true,
                                 "Maximum Participants",
                                 SeminarRoom."CSD Maximum Partecipants",
                                 FieldCaption("Maximum Participants"),
                                 "Maximum Participants",
                                 SeminarRoom."CSD Maximum Partecipants")
                            then
                                "Maximum Participants" := SeminarRoom."CSD Maximum Partecipants";
                        end;
                    end;
                end;
            end;
        }
        field(12; "Room Name"; Text[30])
        {
            Caption = 'Room Name';
            DataClassification = ToBeClassified;
        }
        field(13; "Room Address"; Text[30])
        {
            Caption = 'Room Address';
            DataClassification = ToBeClassified;
        }
        field(14; "Room Address 2"; Text[30])
        {
            Caption = 'Room Address 2';
            DataClassification = ToBeClassified;
        }
        field(15; "Room Post Code"; Code[20])
        {
            TableRelation = "Post Code".Code;
            ValidateTableRelation = false;
            Caption = 'Room Post Code';
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                PostCode.ValidatePostCode("Room City", "Room Post Code", "Room County", "Room Country/Reg. Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(16; "Room City"; Text[30])
        {
            Caption = 'Room City';
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                PostCode.ValidateCity("Room City", "Room Post Code", "Room County", "Room Country/Reg. Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(17; "Room Country/Reg. Code"; Code[10])
        {
            TableRelation = "Country/Region";
            Caption = 'Room Country/Reg. Code';
            DataClassification = ToBeClassified;
        }
        field(18; "Room County"; Text[30])
        {
            Caption = 'Room County';
            DataClassification = ToBeClassified;
        }
        field(19; "Seminar Price"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Seminar Price';
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                if ("Seminar Price" <> xRec."Seminar Price") and
                   (Status <> Status::Canceled)
                then begin
                    SeminarRegLine.Reset;
                    SeminarRegLine.SetRange("Document No.", "No.");
                    SeminarRegLine.SetRange(Registered, false);
                    if SeminarRegLine.FindSet(false, false) then
                        if Confirm(Text005, false,
                             FieldCaption("Seminar Price"),
                             SeminarRegLine.TableCaption)
                        then begin
                            repeat
                                SeminarRegLine.VALIDATE("Seminar Price", "Seminar Price");
                                SeminarRegLine.modify;
                            until SeminarRegLine.NEXT = 0;
                            modify;
                        end;
                end;
            end;
        }
        field(20; "Gen. Prod. Posting Group"; Code[10])
        {
            TableRelation = "Gen. Product Posting Group".Code;
            Caption = 'Gen. Product Posting Group';
            DataClassification = ToBeClassified;
        }
        field(21; "VAT Prod. Posting Group"; Code[10])
        {
            TableRelation = "VAT Product Posting Group".Code;
            Caption = 'VAT Product Posting Group';
            DataClassification = ToBeClassified;
        }
        field(22; Comment; Boolean)
        {
            CalcFormula = Exist("CSD Seminar Comment Line" where("Table Name" = const("Seminar Registration Header"),
                                                              "No." = Field("No.")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Comment';
        }
        field(23; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = ToBeClassified;
        }
        field(24; "Document Date"; Date)
        {
            Caption = ' Document Date';
            DataClassification = ToBeClassified;
        }
        field(25; "Reason Code"; Code[10])
        {
            TableRelation = "Reason Code".Code;
            Caption = 'Reason Code';
            DataClassification = ToBeClassified;
        }
        field(26; "No. Series"; Code[10])
        {
            Editable = false;
            Caption = 'No. Series';
            TableRelation = "No. Series".Code;
            DataClassification = ToBeClassified;
        }
        field(27; "Posting No. Series"; Code[10])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Posting No. Series';
            DataClassification = ToBeClassified;

            trigger OnLookup();
            begin

                SeminarRegHeader := Rec;
                SeminarSetup.GET;
                SeminarSetup.TestField("Seminar Registration Nos.");
                SeminarSetup.TestField("Posted Seminar Reg. Nos.");
                if NoSeriesMgt.LookupSeries(SeminarSetup."Posted Seminar Reg. Nos.", SeminarRegHeader."Posting No. Series")
                then begin
                    VALIDATE("Posting No. Series");
                end;
                Rec := SeminarRegHeader;

            end;

            trigger OnValidate();
            begin
                if "Posting No. Series" <> '' then begin
                    SeminarSetup.GET;
                    SeminarSetup.TestField("Seminar Registration Nos.");
                    SeminarSetup.TestField("Posted Seminar Reg. Nos.");
                    NoSeriesMgt.TestSeries(SeminarSetup."Posted Seminar Reg. Nos.", "Posting No. Series");
                end;
                TestField("Posting No.", '');
            end;
        }
        field(28; "Posting No."; Code[20])
        {
            Caption = 'Posting No.';
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK; "No.")
        {
        }
        key(Key2; "Room Resource No.")
        {
            SumIndexFields = Duration;
        }
    }

    var
        PostCode: Record "Post Code";
        Seminar: Record "CSD Seminar";
        SeminarCommentLine: Record "CSD Seminar Comment Line";
        SeminarCharge: Record "CSD Seminar Charge";
        SeminarRegHeader: Record "CSD Seminar Reg. Header";
        SeminarRegLine: Record "CSD Seminar Registration Line";
        SeminarRoom: Record Resource;
        SeminarSetup: Record "CSD Seminar Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Text001: Label 'You cannot delete the Seminar Registration, because there is at least one %1 where %2=%3.';
        Text002: Label 'You cannot change the %1, because there is at least one %2 with %3=%4.';
        Text004: Label 'This Seminar is for %1 participants. \The selected Room has a maximum of %2 participants \Do you want to change %3 for the Seminar from %4 to %5?';
        Text005: Label 'Should the new %1 be copied to all %2 that are not yet invoiced?';
        Text006: Label 'You cannot delete the Seminar Registration, because there is at least one %1.';

    trigger OnDelete();
    begin
        if (CurrFieldNo > 0) then
            TestField(Status, Status::Canceled);


        SeminarRegLine.RESET;
        SeminarRegLine.SETRANGE("Document No.", "No.");
        SeminarRegLine.SETRANGE(Registered, true);
        if SeminarRegLine.FIND('-') then
            ERROR(
              Text001,
              SeminarRegLine.TableCaption,
              SeminarRegLine.FieldCaption(Registered),
              true);
        SeminarRegLine.SETRANGE(Registered);
        SeminarRegLine.deleteALL(true);

        SeminarCharge.RESET;
        SeminarCharge.SETRANGE("Document No.", "No.");
        if not SeminarCharge.ISEMPTY then
            ERROR(Text006, SeminarCharge.TableCaption);

        SeminarCommentLine.RESET;
        SeminarCommentLine.SETRANGE("Table Name", SeminarCommentLine."Table Name"::"Seminar Registration Header");
        SeminarCommentLine.SETRANGE("No.", "No.");
        SeminarCommentLine.deleteALL;
    end;

    trigger OnInsert();
    begin
        if "No." = '' then begin
            SeminarSetup.GET;
            SeminarSetup.TestField("Seminar Registration Nos.");
            NoSeriesMgt.InitSeries(SeminarSetup."Seminar Registration Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        InitRecord();
        if GetFilter("Seminar No.") <> '' then
            if GetRangeMin("Seminar No.") = GetRangeMax("Seminar No.") then
                Validate("Seminar No.", GetRangeMin("Seminar No."));
    end;


    procedure InitRecord()  //inicializon rekordet
    begin
        if "Posting Date" = 0D then
            "Posting Date" := WORKDATE;
        "Document Date" := WORKDATE;
        SeminarSetup.GET;
        NoSeriesMgt.SetDefaultSeries("Posting No. Series", SeminarSetup."Posted Seminar Reg. Nos.");

    end;



    procedure AssistEdit(OldSeminarRegHeader: Record "CSD Seminar Reg. Header"): Boolean;
    begin

        SeminarRegHeader := Rec;
        SeminarSetup.GET;
        SeminarSetup.TestField("Seminar Registration Nos.");
        if NoSeriesMgt.SelectSeries(SeminarSetup."Seminar Registration Nos.", OldSeminarRegHeader."No. Series", SeminarRegHeader."No. Series") then begin
            SeminarSetup.GET;
            SeminarSetup.TestField("Seminar Registration Nos.");
            NoSeriesMgt.SetSeries(SeminarRegHeader."No.");
            Rec := SeminarRegHeader;
            exit(true);
        end;

    end;
}

