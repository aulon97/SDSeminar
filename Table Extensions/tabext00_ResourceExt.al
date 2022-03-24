tableextension 50100 "CSD ResourceExt" extends Resource

// CSD1.00 - 2018-01-01 - D. E. Veloper

{
    fields
    {
        modify("Profit %")
        {
            trigger OnAfterValidate()
            begin
                Rec.TestField("Unit Cost");
            end;

        }

        field(50101; "CSD Resource Type"; Enum "CSD Resource Type")
        {
            Caption = 'Resource Type';
            DataClassification = ToBeClassified;
        }

        field(50102; "CSD Maximum Partecipants"; Integer)
        {
            Caption = 'Maximum Partecipants';
            DataClassification = ToBeClassified;

        }

        field(50103; "CSD Quantity Per Day"; Decimal)
        {
            Caption = 'Quantity Per Day';
            DataClassification = ToBeClassified;

        }

    }

    var
        myInt: Integer;
}