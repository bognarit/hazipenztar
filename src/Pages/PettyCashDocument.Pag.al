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

    actions
    {
        area(Processing)
        {
            action(Post)
            {
                Caption = 'Post';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Post;

                trigger OnAction()
                var
                    PettyCashDocPosted: Record "Petty Cash Doc Header Posted";
                begin
                    if Confirm(StrSubstNo(Text001, Rec."No.")) then begin
                        PettyCashDocPosted.Init();
                        PettyCashDocPosted.Type := Rec.Type;
                        PettyCashDocPosted."No." := Rec."No.";
                        PettyCashDocPosted."Partner Type" := Rec."Partner Type";
                        PettyCashDocPosted."Partner No." := Rec."Partner No.";
                        PettyCashDocPosted."Partner Name" := Rec."Partner Name";
                        PettyCashDocPosted."Posting Date" := Rec."Posting Date";
                        PettyCashDocPosted.Insert();
                        Rec.Delete();
                    end;
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Posting Date" := Today();
    end;

    var
        Text001: Label 'Are you sure to post the %1 document?';
}