table 50121 "CSD Posted Seminar Charge"
{
    // CSD1.00 - 2018-01-01 - D. E. Veloper
    //   Chapter 7 - Lab 3-4

    Caption = 'Posted Seminar Charge';

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            NotBlank = true;
            TableRelation = "CSD Seminar Reg. Header";
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
        }
        field(3; Type; Enum "Type")
        {
            Caption = 'Type';
            DataClassification = ToBeClassified;
        }
        field(4; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = if (Type = const(Resource)) Resource."No."
            else
            if (Type = const("G/L Account")) "G/L Account"."No.";
            DataClassification = ToBeClassified;
        }
        field(5; Description; Text[50])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(6; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
            DataClassification = ToBeClassified;
        }
        field(7; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            AutoFormatType = 2;
            MinValue = 0;
            DataClassification = ToBeClassified;
        }
        field(8; "Total Price"; Decimal)
        {
            Caption = 'Total Price';
            AutoFormatType = 1;
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(9; "To Invoice"; Boolean)
        {
            Caption = 'To Invoice';
            InitValue = true;
            DataClassification = ToBeClassified;
        }
        field(10; "Bill-to Customer No."; Code[20])
        {
            Caption = 'Bill-to Customer No.';
            TableRelation = Customer."No.";
            DataClassification = ToBeClassified;
        }
        field(11; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            TableRelation = if (Type = const(Resource)) "Resource Unit of Measure".Code where("Resource No." = Field("No."))
            else
            "Unit of Measure".Code;
            DataClassification = ToBeClassified;
        }
        field(12; "Gen. Prod. Posting Group"; Code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group".Code;
            DataClassification = ToBeClassified;
        }
        field(13; "VAT Prod. Posting Group"; Code[10])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group".Code;
            DataClassification = ToBeClassified;
        }
        field(14; "Qty. per Unit of Measure"; Decimal)
        {
            Caption = 'Qty. per Unit of Measure';
            DataClassification = ToBeClassified;
        }
        field(15; Registered; Boolean)
        {
            Caption = 'Registered';
            Editable = false;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
        }
    }

}

