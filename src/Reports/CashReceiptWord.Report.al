report 50101 "Cash Receipt - Word"
{
    Caption = 'Cash Receipt - Word';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = CashReceiptLayout;

    dataset
    {
        dataitem(PettyCashDocHeaderPosted; "Petty Cash Doc Header Posted")
        {
            PrintOnlyIfDetail = true;
            
            column(Type; "Type")
            {
            }
            column(No; "No.")
            {
            }
            column(PartnerType; "Partner Type")
            {
            }
            column(PartnerNo; "Partner No.")
            {
            }
            column(PartnerName; "Partner Name")
            {
            }
            dataitem(PettyCashDocumentLine; "Petty Cash Document Line")
            {
                DataItemLink = Type = field(Type), "No." = field("No.");
                DataItemTableView = sorting(Type, "No.", "Line No.");

                column(LineNo; "Line No.")
                {
                }
                column(Description; Description)
                {
                }
                column(Amount; Amount)
                {
                }
                column(TotalAmount; TotalAmount)
                {
                }
            }

            trigger OnPreDataItem()
            var
                PettyCashDocLine: Record "Petty Cash Document Line";
            begin
                PettyCashDocLine.SetRange(Type, Type);
                PettyCashDocLine.SetRange("No.", "No.");
                PettyCashDocLine.Calcsums(Amount);
                TotalAmount := PettyCashDocLine.Amount;
            end;
        }
    }

    rendering
    {
        layout(CashReceiptLayout)
        {
            Type = Word;
            LayoutFile = './src/Reports/CashReceiptLayout.docx';
            Caption = 'CashReceiptLayout';
            Summary = 'Word Layout of Cash Receipt.';
        }
    }
    var
        TotalAmount: Decimal;
}