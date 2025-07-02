page 50106 "Petty Cash Doc Line Posted"
{
    ApplicationArea = All;
    Caption = 'Petty Cash Document Line - Posted';
    PageType = ListPart;
    SourceTable = "Petty Cash Doc Line Posted";
    AutoSplitKey = true;
    Editable = false;

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