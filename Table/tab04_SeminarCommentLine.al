table 50104 "CSD Seminar Comment Line"
{
    Caption = 'Seminar Comment Line';
    LookupPageId = "CSD Seminar Comment List";
    DrillDownPageId = "CSD Seminar Comment List";

    fields
    {
        field(10; "Table Name"; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'Table Name';
            OptionMembers = "Seminar","Seminar Registration Header","Posted Seminar Reg. Header";
            OptionCaption = 'Seminar, Seminar Registration Header, Posted Seminar Reg. Header';
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
                                "CSD Seminar";
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

}