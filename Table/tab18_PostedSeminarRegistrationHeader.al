table 50118 "CSD Posted Seminar Reg. Header"
{
    // CSD1.00 - 2018-01-01 - D. E. Veloper
    //   Chapter 7 - Lab 3-1

    Caption = 'Posted Seminar Registration Header';
    DrillDownPageId = "CSD Posted Seminar Reg. List";
    LookupPageId = "CSD Posted Seminar Reg. List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            DataClassification = ToBeClassified;
        }
        field(3; "Seminar No."; Code[20])
        {
            TableRelation = "CSD Seminar";
            Caption = 'Seminar No.';
            DataClassification = ToBeClassified;
        }
        field(4; "Seminar Name"; Text[50])
        {
            Caption = 'Seminar Name';
            DataClassification = ToBeClassified;

        }
        field(5; "Instructor Code"; Code[10])
        {
            TableRelation = Resource where(Type = const(Instructor));
            Caption = 'Instructor Code';
            DataClassification = ToBeClassified;
        }
        field(6; "Instructor Name"; Text[100])
        {
            CalcFormula = Lookup(Resource.Name where("No." = Field("Instructor Code"),
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
        field(11; "Room Code"; Code[10])//behet room resource no.
        {
            TableRelation = Resource where(Type = const(Room));
            Caption = 'Room Code';
            DataClassification = ToBeClassified;
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
        }
        field(16; "Room City"; Text[30])
        {
            Caption = 'Room City';
            DataClassification = ToBeClassified;
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
            CalcFormula = Exist("CSD Seminar Comment Line" where("Table Name" = const("Posted Seminar Registration Header"),
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
        }
        field(29; "User Id"; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'User Id';
            TableRelation = User;
            ValidateTableRelation = false;
        }

        field(30; "Source Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Source Code";
            Caption = 'Source Code';
        }


    }

    keys
    {
        key(PK; "No.")
        {
        }
        key(Key2; "Room Code")
        {
            SumIndexFields = Duration;
        }
    }


}

