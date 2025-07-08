page 50104 "Petty Cash Document Posted"
{
    ApplicationArea = All;
    Caption = 'Petty Cash Document - Posted';
    PageType = Card;
    SourceTable = "Petty Cash Doc Header Posted";
    Editable = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Partner Type"; Rec."Partner Type")
                {
                    ApplicationArea = All;
                }
                field("Partner No."; Rec."Partner No.")
                {
                    ApplicationArea = All;
                }
                field("Partner Name"; Rec."Partner Name")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
            }
            part(PettyCashDocumentLine; "Petty Cash Document Line")
            {
                ApplicationArea = All;
                Caption = 'Petty Cash Document Line';
                SubPageLink = Type = field(Type), "No." = field("No.");
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(CashReceiptRDLC)
            {
                Caption = 'Cash Receipt - RDLC';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Download;

                trigger OnAction()
                var
                    PettyCashDocHeaderPosted: Record "Petty Cash Doc Header Posted";
                    PettyCashDocLinePosted: Record "Petty Cash Doc Line Posted";
                    CashReceipt: Report "Cash Receipt - RDLC";
                begin
                    PettyCashDocHeaderPosted.SetRange("No.", Rec."No.");
                    Rec.SetRange("No.", PettyCashDocLinePosted."No.");
                    CashReceipt.SetTableView(PettyCashDocHeaderPosted);
                    CashReceipt.Run();
                end;
            }
            action(CashReceiptWord)
            {
                Caption = 'Cash Receipt - Word';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Download;

                trigger OnAction()
                var
                    PettyCashDocHeaderPosted: Record "Petty Cash Doc Header Posted";
                    PettyCashDocLinePosted: Record "Petty Cash Doc Line Posted";
                    CashReceipt: Report "Cash Receipt - Word";
                begin

                    PettyCashDocHeaderPosted.SetRange("No.", Rec."No.");
                    PettyCashDocLinePosted.SetRange("No.", PettyCashDocHeaderPosted."No.");

                    CashReceipt.SetTableView(PettyCashDocHeaderPosted);
                    CashReceipt.Run();
                end;
            }
        }
    }
}