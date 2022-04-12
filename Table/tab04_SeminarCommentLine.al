table 50104 "CSD Seminar Comment Line"
// CSD1.00 - 2018-01-01 - D. E. Veloper
//   Chapter 5 - Lab 2-1
//   Chapter 7 - Lab 3-2
{
    Caption = 'Seminar Comment Line';
    LookupPageId = "CSD Seminar Comment List";
    DrillDownPageId = "CSD Seminar Comment List";

    fields
    {
        field(10; "Table Name"; Enum "Table Name")
        {
            DataClassification = ToBeClassified;
            Caption = 'Table Name';
        }

        field(20; "Document Line No."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Document Line No.';
        }

        field(30; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Table Name" = const(Seminar))
                                "CSD Seminar"
            else
            if ("Table Name" = const("Seminar Registration Header"))
                                "CSD Seminar Reg. Header"
            else
            if ("Table Name" = const("Posted Seminar Registration Header"))
                                "CSD Posted Seminar Reg. Header";
            Caption = 'No.';
        }

        field(40; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Line No.';
        }

        field(50; Date; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Date';
        }

        field(60; Code; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code';
        }

        field(70; "Comment"; Text[80])
        {
            DataClassification = ToBeClassified;
            Caption = 'Comment';
        }

    }

    keys
    {
        key(PK; "Table Name", "Document Line No.", "No.", "Line No.")
        {
            Clustered = true;
        }

    }




    trigger OnInsert()
    begin
        ;

    end;

    trigger OnModify()
    begin
    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

    procedure SetupNewLine()
    var
        SeminarCommentLine: Record "CSD Seminar Comment Line";
    begin
        SeminarCommentLine.SetRange("Table Name", "Table Name");
        SeminarCommentLine.SetRange("No.", "No.");
        SeminarCommentLine.SetRange("Document Line No.", "Document Line No.");
        SeminarCommentLine.SetRange(Date, WorkDate);

        if SeminarCommentLine.IsEmpty then
            Date := WorkDate;

    end;

}