codeunit 50100 "CSD Seminar-Post"
{
    // CSD1.00 - 2018-01-01 - D. E. Veloper
    //   Chapter 7 - Lab 5-2
    //     - Created new codeunit

    TableNo = "CSD Seminar Reg. Header";

    trigger OnRun();
    begin
    end;

    var
        SeminarRegHeader: Record "CSD Seminar Reg. Header";
        SeminarRegLine: Record "CSD Seminar Registration Line";
        PstdSeminarRegHeader: Record "CSD Posted Seminar Reg. Header";
        PstdSeminarRegLine: Record "CSD Posted Seminar Reg. Line";
        SeminarCommentLine: Record "CSD Seminar Comment Line";
        SeminarCommentLine2: Record "CSD Seminar Comment Line";
        SeminarCharge: Record "CSD Seminar Charge";
        PstdSeminarCharge: Record "CSD Posted Seminar Charge";
        Room: Record Resource;
        Instructor: Record Resource;
        Customer: Record Customer;
        ResLedgEntry: Record "Res. Ledger Entry";
        SeminarJnlLine: Record "CSD Seminar Journal Line";
        SourceCodeSetup: Record "Source Code Setup";
        ResJnlLine: Record "Res. Journal Line";
        SeminarJnlPostLine: Codeunit "CSD Seminar Jnl.-Post Line";
        ResJnlPostLine: Codeunit "Res. Jnl.-Post Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        DimMgt: Codeunit DimensionManagement;
        Window: Dialog;
        SourceCode: Code[10];
        LineCount: Integer;
        Text001: Label 'There is no participant to post.';
        Text002: Label 'Posting lines              #2######\';
        Text003: Label 'Registration';
        Text004: Label 'Registration %1  -> Posted Reg. %2';
        Text005: Label 'The combination of dimensions used in %1 is blocked. %2';
        Text006: Label 'The combination of dimensions used in %1,  line no. %2 is blocked. %3';
        Text007: Label 'The dimensions used in %1 are invalid. %2';
        Text008: Label 'The dimensions used in %1, line no. %2 are invalid. %3';

    local procedure CopyCommentLines(FromDocumentType: Integer; ToDocumentType: Enum "Table Name"; FromNumber: Code[20]; ToNumber: Code[20]);
    begin
        SeminarCommentLine.Reset();
        SeminarCommentLine.SetRange("Table Name", FromDocumentType);
        SeminarCommentLine.SetRange("No.", FromNumber);

        if SeminarCommentLine.FindSet() then
            repeat
                SeminarCommentLine2 := SeminarCommentLine;
                SeminarCommentLine2."Table Name" := ToDocumentType;
                SeminarCommentLine2."No." := ToNumber;
                SeminarCommentLine2.Insert();
            until SeminarCommentLine.Next() = 0;

    end;

    local procedure CopyCharges(FromNumber: Code[20]; ToNumber: Code[20]);
    begin
        SeminarCharge.Reset();
        SeminarCharge.SetRange("Document No.", FromNumber);

        if SeminarCharge.FindSet then
            repeat
                PstdSeminarCharge.TransferFields(SeminarCharge);
                PstdSeminarCharge."Document No." := ToNumber;
                PstdSeminarCharge.Insert();
            until SeminarCharge.Next = 0;
    end;

    local procedure PostResJnlLine(Resource: Record Resource): Integer;
    begin

        if Resource."CSD Quantity Per Day" = 0 then
            exit;

        ResJnlLine.Init();
        ResJnlLine."Entry Type" := ResJnlLine."Entry Type"::Usage;
        ResJnlLine."Document No." := PstdSeminarRegHeader."No.";
        ResJnlLine."Resource No." := Resource."No.";

        ResJnlLine."Posting Date" := SeminarRegHeader."Posting Date";
        ResJnlLine."Reason Code" := SeminarRegHeader."Reason Code";
        ResJnlLine.Description := SeminarRegHeader."Seminar Name";
        ResJnlLine."Gen. Prod. Posting Group" := SeminarRegHeader."Gen. Prod. Posting Group";
        ResJnlLine."Posting No. Series" := SeminarRegHeader."Posting No. Series";
        ResJnlLine."Source Code" := SourceCode;
        ResJnlLine."Reason Code" := SeminarRegHeader."Reason Code";
        ResJnlLine."Resource No." := Resource."No.";
        ResJnlLine."Unit of Measure Code" := Resource."Base Unit of Measure";
        ResJnlLine."Unit Cost" := Resource."Unit Cost";
        ResJnlLine."Qty. per Unit of Measure" := 1;

        ResJnlLine.Quantity := SeminarRegHeader.Duration * Resource."CSD Quantity Per Day";
        ResJnlLine."Total Cost" := ResJnlLine."Unit Cost" * ResJnlLine.Quantity;
        ResJnlLine."CSD Seminar No." := SeminarRegHeader."Seminar No.";
        ResJnlLine."CSD Seminar Registration No." := PstdSeminarRegHeader."No.";
        ResJnlPostLine.RunWithCheck(ResJnlLine);

        //-------//

        ResLedgEntry.FindLast();
        exit(ResLedgEntry."Entry No.");
    end;

    local procedure PostSeminarJnlLine(ChargeType: Enum "Charge Type");
    begin
        SeminarJnlLine.Init();
        SeminarJnlLine."Seminar No." := SeminarRegHeader."Seminar No.";
        SeminarJnlLine."Posting Date" := SeminarRegHeader."Posting Date";
        SeminarJnlLine."Document Date" := SeminarRegHeader."Document Date";
        SeminarJnlLine."Document No." := PstdSeminarRegHeader."No.";
        SeminarJnlLine."Charge Type" := ChargeType;
        SeminarJnlLine."Instructor Resource No." := SeminarRegHeader."Instructor Resource No.";
        SeminarJnlLine."Starting Date" := SeminarRegHeader."Starting Date";
        SeminarJnlLine."Seminar Registration No." := PstdSeminarRegHeader."No.";
        SeminarJnlLine."Room Resource No." := SeminarRegHeader."Room Resource No.";
        SeminarJnlLine."Source Type" := SeminarJnlLine."Source Type"::Seminar;
        SeminarJnlLine."Source No." := SeminarRegHeader."Seminar No.";
        SeminarJnlLine."Source Code" := SourceCode;
        SeminarJnlLine."Reason Code" := SeminarRegHeader."Reason Code";
        SeminarJnlLine."Posting No. Series" := SeminarRegHeader."Posting No. Series";

        case ChargeType Of
            ChargeType::Instructor:
                begin
                    Instructor.Get(SeminarRegHeader."Instructor Resource No.");
                    SeminarJnlLine.Description := Instructor.Name;
                    SeminarJnlLine.Type := SeminarJnlLine.Type::Resource;
                    SeminarJnlLine.Chargeable := false;
                    SeminarJnlLine.Quantity := SeminarRegHeader.Duration;
                    SeminarJnlLine."Res. Ledger Entry No." := PostResJnlLine(Instructor);
                end;

            ChargeType::Room:
                begin
                    Room.Get(SeminarRegHeader."Room Resource No.");
                    SeminarJnlLine.Description := Room.Name;
                    SeminarJnlLine.Type := SeminarJnlLine.Type::Resource;
                    SeminarJnlLine.Chargeable := false;
                    SeminarJnlLine.Quantity := SeminarRegHeader.Duration;
                    SeminarJnlLine."Res. Ledger Entry No." := PostResJnlLine(Room);
                end;
            ChargeType::Participant:
                begin
                    SeminarJnlLine."Bill-to Customer No." := SeminarRegLine."Bill-to Customer No.";
                    SeminarJnlLine."Participant Contact No." := SeminarRegLine."Participant Contact No.";
                    SeminarJnlLine."Participant Name" := SeminarRegLine."Participant Name";
                    SeminarJnlLine.Description := SeminarRegLine."Participant Name";
                    SeminarJnlLine.Type := SeminarJnlLine.Type::Resource;
                    SeminarJnlLine.Chargeable := SeminarRegLine."To Invoice";
                    SeminarJnlLine.Quantity := 1;
                    SeminarJnlLine."Unit Price" := SeminarRegLine.Amount;
                    SeminarJnlLine."Total Price" := SeminarRegLine.Amount;
                end;

            ChargeType::Charge:
                begin
                    SeminarJnlLine.Description := SeminarCharge.Description;
                    SeminarJnlLine."Bill-to Customer No." := SeminarCharge."Bill-to Customer No.";
                    SeminarJnlLine.Type := SeminarCharge.Type;
                    SeminarJnlLine.Quantity := SeminarCharge.Quantity;
                    SeminarJnlLine."Unit Price" := SeminarCharge."Unit Price";
                    SeminarJnlLine."Total Price" := SeminarCharge."Total Price";
                    SeminarJnlLine.Chargeable := SeminarCharge."To Invoice";
                end;
        end;
        SeminarJnlPostLine.RunWithCheck(SeminarJnlLine);
    end;

    local procedure PostCharges();
    begin
        SeminarCharge.Reset();
        SeminarCharge.SetRange("Document No.", SeminarRegHeader."No.");
        if SeminarCharge.FindSet(false, false) then
            repeat
                PostSeminarJnlLine("Charge Type"::Charge);
            until SeminarCharge.Next = 0;
    end;
}

