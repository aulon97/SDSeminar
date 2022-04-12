codeunit 50139 "CSD EventSubcriptions"
// CSD1.00 - 2018-01-01 - D. E. Veloper
//   Chapter 7 - Lab 4-4 
{
    [EventSubscriber(ObjectType::Codeunit, 212, 'OnBeforeResLedgEntryInsert', '', true, true)]
    local procedure PostResJnlLineOnBeforeResLedgEntryInsert(var ResLedgerEntry: Record "Res. Ledger Entry"; ResJournalLine: Record "Res. Journal Line")
    var

    begin

        ResLedgerEntry."CSD Seminar No." := ResJournalLine."CSD Seminar No.";
        ResLedgerEntry."CSD Seminar Registration No." := ResJournalLine."CSD Seminar Registration No.";

    end;
}