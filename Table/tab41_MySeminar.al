table 50141 "CSD My Seminar"
{
    DataClassification = ToBeClassified;
    Caption = 'My Seminar';

    fields
    {
        field(10; "User ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = User;
            Caption = 'User Id';
        }
        field(20; "Seminar No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "CSD Seminar";
            Caption = 'Seminar No.';
        }
    }

    keys
    {
        key(PK; "User ID", "Seminar No.")
        {
            Clustered = true;
        }
    }


}