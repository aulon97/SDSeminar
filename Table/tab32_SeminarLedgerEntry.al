table 50132 "CSD Seminar Ledger Entry"
{
    // CSD1.00 - 2018-01-01 - D. E. Veloper
    //   Chapter 7 - Lab 1
    //     - Created new table

    Caption = 'Seminar Ledger Entry';
    LookupPageId = "CSD Seminar Ledger Entries";
    DrillDownPageId = "CSD Seminar Ledger Entries";

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Seminar No."; Code[20])
        {
            Caption = 'Seminar No.';
            DataClassification = ToBeClassified;
            TableRelation = "CSD Seminar";
        }
        field(3; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Validate("Document Date", "Posting Date");
            end;
        }
        field(4; "Document Date"; Date)
        {
            Caption = 'Document Date';
            DataClassification = ToBeClassified;
        }
        field(5; "Entry Type"; Enum "Entry Type")
        {
            Caption = 'Entry Type';
            DataClassification = ToBeClassified;
        }
        field(6; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = ToBeClassified;
        }
        field(7; Description; Text[50])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(8; "Bill-to Customer No."; Code[20])
        {
            Caption = 'Bill-to Customer No.';
            DataClassification = ToBeClassified;
            TableRelation = Customer;
        }
        field(9; "Charge Type"; Enum "Charge Type")
        {
            Caption = 'Charge Type';
            DataClassification = ToBeClassified;
        }
        field(10; Type; Enum "Type")
        {
            Caption = 'Type';
            DataClassification = ToBeClassified;
        }
        field(11; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 5;
        }
        field(12; "Unit Price"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Price';
            DataClassification = ToBeClassified;
        }
        field(13; "Total Price"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Total Price';
            DataClassification = ToBeClassified;
        }
        field(14; "Participant Contact No."; Code[20])
        {
            Caption = 'Participant Contact No.';
            DataClassification = ToBeClassified;
            TableRelation = Contact;
        }
        field(15; "Participant Name"; Text[50])
        {
            Caption = 'Participant Name';
            DataClassification = ToBeClassified;
        }
        field(16; Chargeable; Boolean)
        {
            Caption = 'Chargeable';
            DataClassification = ToBeClassified;
            InitValue = true;
        }
        field(17; "Room Resource No."; Code[20])
        {
            Caption = 'Room Resource No.';
            DataClassification = ToBeClassified;
            TableRelation = Resource where(Type = const(Machine));
        }
        field(18; "Instructor Resource No."; Code[20])
        {
            Caption = 'Instructor Resource No.';
            DataClassification = ToBeClassified;
            TableRelation = Resource where(Type = const(Person));
        }
        field(19; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            DataClassification = ToBeClassified;
        }
        field(20; "Seminar Registration No."; Code[20])
        {
            Caption = 'Seminar Registration No.';
            DataClassification = ToBeClassified;
        }
        field(21; "Res. Ledger Entry No."; Integer)
        {
            Caption = 'Res. Ledger Entry No.';
            DataClassification = ToBeClassified;
            TableRelation = "Res. Ledger Entry";
        }
        field(22; "Source Type"; Enum "Source Type")
        {
            Caption = 'Source Type';
            DataClassification = ToBeClassified;
        }
        field(23; "Source No."; Code[20])
        {
            Caption = 'Source No.';
            DataClassification = ToBeClassified;
            TableRelation = if ("Source Type" = const(Seminar)) "CSD Seminar";
        }
        field(24; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
            DataClassification = ToBeClassified;
        }
        field(25; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Source Code";
        }
        field(26; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            DataClassification = ToBeClassified;
            TableRelation = "Reason Code";
        }
        field(27; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(28; "User ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'User ID';
            TableRelation = "User" where("User Name" = field("User ID"));
            ValidateTableRelation = false;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
        }
        key(Key2; "Document No.", "Posting Date")
        {

        }
    }


}

