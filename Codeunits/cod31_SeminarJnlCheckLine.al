codeunit 50131 "CSD Seminar Jnl.-Check Line"
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

    begin
        if SemJnLine.EmptyLine() then
            exit;

        SemJnLine.TestField("Posting Date");
        SemJnLine.TestField("Instructor Resource No.");
        SemJnLine.TestField("Seminar No.");

        Case SemJnLine."Charge Type" of
            SemJnLine."Charge Type"::Instructor:
                SemJnLine.TestField("Instructor Resource No.");
            SemJnLine."Charge Type"::Room:
                SemJnLine.TestField("Room Resource No.");
            SemJnLine."Charge Type"::Participant:
                SemJnLine.TestField("Participant Contact No.");
        End;

        if SemJnLine.Chargeable then
            SemJnLine.TestField("Bill-to Customer No.");

        if SemJnLine."Posting Date" = ClosingDate(SemJnLine."Posting Date") then
            SemJnLine.FieldError("Posting Date", ClosingDateTxt);

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
        if (SemJnLine."Posting Date" < AllowPostingFrom) OR (SemJnLine."Posting Date" > AllowPostingTO) then
            SemJnLine.FieldError("Posting Date", PostingDateTxt);

        if (SemJnLine."Document Date" <> 0D) then
            if (SemJnLine."Document Date" = CLOSINGDATE(SemJnLine."Document Date")) then
                SemJnLine.FieldError("Document Date", PostingDateTxt);

    end;
}