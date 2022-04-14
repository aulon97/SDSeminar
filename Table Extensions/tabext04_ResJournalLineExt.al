tableextension 50104 "CSD Res. Journal Line Ext" extends "Res. Journal Line"
// CSD1.00 - 2018-01-01 - D. E. Veloper
//   Chapter 7 - Lab 4-2


{
    fields
    {
        field(50100; "CSD Seminar No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Seminar No.';
            TableRelation = "CSD Seminar";
        }

        field(50101; "CSD Seminar Registration No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Seminar Registration No.';
            TableRelation = "CSD Seminar Reg. Header";
        }
    }

    var
        myInt: Integer;
}