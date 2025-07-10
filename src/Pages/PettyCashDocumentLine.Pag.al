page 50203 "Petty Cash Document Line"
{
    ApplicationArea = All;
    Caption = 'Petty Cash Document Line';
    PageType = ListPart;
    SourceTable = "Petty Cash Document Line";
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                // field(Type; Rec.Type)
                // {
                //     ApplicationArea = All;
                // }
                // field("No."; Rec."No.")
                // {
                //     ApplicationArea = All;
                // }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
