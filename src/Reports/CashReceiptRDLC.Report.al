report 50200 "Cash Receipt - RDLC"
{
    Caption = 'Cash Receipt - RDLC';
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
                IncludeCaption = true;
            }
            column(No; "No.")
            {
                IncludeCaption = true;
            }
            column(PartnerType; "Partner Type")
            {
                IncludeCaption = true;
            }
            column(PartnerNo; "Partner No.")
            {
            }
            column(PartnerName; "Partner Name")
            {
                IncludeCaption = true;
            }
            column(PostingDate; "Posting Date")
            {
                IncludeCaption = true;
            }
            dataitem(PettyCashDocumentLine; "Petty Cash Document Line")
            {
                DataItemLink = Type = field(Type), "No." = field("No.");
                DataItemTableView = sorting(Type, "No.", "Line No.");

                column(LineNo; "Line No.")
                {
                    IncludeCaption = true;
                }
                column(Description; Description)
                {
                    IncludeCaption = true;
                }
                column(Amount; Amount)
                {
                    IncludeCaption = true;
                }
            }
        }
    }
    rendering
    {
        layout(CashReceiptLayout)
        {
            Type = RDLC;
            LayoutFile = './src/Reports/CashReceiptLayout.rdl';
            Caption = 'CashReceiptLayout';
            Summary = 'RDLC Layout of Cash Receipt.';
        }
    }
}