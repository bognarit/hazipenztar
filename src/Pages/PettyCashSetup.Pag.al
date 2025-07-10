page 50200 "Petty Cash Setup"
{
    PageType = Card;
    ApplicationArea = All;
    Caption = 'Petty Cash Setup';
    SourceTable = "Petty Cash Setup";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Outgoing No. Series"; Rec."Outgoing No. Series")
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                }
                field("Incoming No. Series"; Rec."Incoming No. Series")
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                }
            }
        }
    }
}
