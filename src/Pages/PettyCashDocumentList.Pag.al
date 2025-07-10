page 50201 "Petty Cash Document List"
{
    ApplicationArea = All;
    Caption = 'Petty Cash Document List';
    PageType = List;
    SourceTable = "Petty Cash Document Header";
    CardPageId = "Petty Cash Document";
    UsageCategory = Lists;

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
