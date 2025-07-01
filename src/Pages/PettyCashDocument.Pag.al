page 50102 "Petty Cash Document"
{
    ApplicationArea = All;
    Caption = 'Petty Cash Document';
    PageType = Card;
    SourceTable = "Petty Cash Document Header";

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

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Posting Date" := Today();
    end;
}
