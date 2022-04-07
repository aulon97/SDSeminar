codeunit 50132 "CSD Seminar Jnl.-Check Line"
// CSD1.00 - 2018-01-01 - D. E. Veloper
//   Chapter 7 - Lab 2-1


{
    TableNo = "CSD Seminar Journal Line";

    trigger OnRun()
    begin
        RunCheck(Rec)
    end;

    var
        GlSetup: Record "General Ledger Setup";
        UserSetup: Record "User Setup";
        AllowPostingFrom: Date;
        AllowPostingTO: Date;
        ClosingDateTxt: Label 'cannot be a closing date.';
        PostingDateTxt: Label 'is not within your range of allowed posting dates';


    procedure RunCheck(var SemJnLine: Record "CSD Seminar Journal Line")
    var
        myInt: Integer;
    begin
        with SemJnLine do begin
            if EmptyLine then
                exit;

            TestField("Posting Date");
            TestField("Instructor Resource No.");
            TestField("Seminar No.");

            Case "Charge Type" of
                "Charge Type"::Instructor:
                    TestField("Instructor Resource No.");
                "Charge Type"::Room:
                    TestField("Room Resource No.");
                "Charge Type"::Participant:
                    TestField("Participant Contact No.");
            End;

            if Chargeable then
                TestField("Bill-to Customer No.");

            if "Posting Date" = ClosingDate("Posting Date") then
                FieldError("Posting Date", ClosingDateTxt);

            if (AllowPostingTO = 0D) AND (AllowPostingFrom = 0D) then begin
                if UserId <> '' then
                    if UserSetup.GET(UserId) then begin
                        AllowPostingFrom := UserSetup."Allow Posting From";
                        AllowPostingTO := UserSetup."Allow Posting To";
                    end;
                if (AllowPostingFrom = 0D) and (AllowPostingTO = 0D)
                then begin
                    GLSetup.GET;
                    AllowPostingFrom := GLSetup."Allow Posting From";
                    AllowPostingTO := GLSetup."Allow Posting To";
                end;
                if AllowPostingTO = 0D then
                    AllowPostingTO := DMY2Date(31, 12, 9999);
            end;
            if ("Posting Date" < AllowPostingFrom) OR ("Posting Date" > AllowPostingTO) then
                FieldError("Posting Date", PostingDateTxt);

            if ("Document Date" <> 0D) then
                if ("Document Date" = CLOSINGDATE("Document Date")) then
                    FieldError("Document Date", PostingDateTxt);
        end;
    end;
}