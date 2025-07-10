page 50205 "Petty Cash Doc List Posted"
{
    ApplicationArea = All;
    Caption = 'Petty Cash Document List - Posted';
    PageType = List;
    SourceTable = "Petty Cash Doc Header Posted";
    CardPageId = "Petty Cash Document Posted";
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
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
        }
    }
}