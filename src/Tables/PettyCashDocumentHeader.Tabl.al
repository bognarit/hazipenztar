table 50201 "Petty Cash Document Header"
{
    Caption = 'Petty Cash Document Header';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Type"; Enum Types)
        {
            Caption = 'Type';

            trigger OnValidate()
            var
                PettyCashSetup: Record "Petty Cash Setup";
                NoSeries: Codeunit "No. Series";
            begin
                PettyCashSetup.Get();
                if Type = Type::Outgoing then begin
                    PettyCashSetup.TestField("Outgoing No. Series");
                    if Rec."No." <> '' then
                        NoSeries.TestManual(PettyCashSetup."Outgoing No. Series")
                    else
                        Rec."No." := NoSeries.GetNextNo(PettyCashSetup."Outgoing No. Series", WorkDate(), false);
                end else if Type = Type::Incoming then begin
                    PettyCashSetup.TestField("Incoming No. Series");
                    if Rec."No." <> '' then
                        NoSeries.TestManual(PettyCashSetup."Incoming No. Series")
                    else
                        Rec."No." := NoSeries.GetNextNo(PettyCashSetup."Incoming No. Series", WorkDate(), false);
                end;
            end;
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(3; "Partner Type"; Enum "Partner Types")
        {
            Caption = 'Partner Type';
        }
        field(4; "Partner No."; Code[20])
        {
            Caption = 'Partner No.';
            TableRelation = if ("Partner Type" = const(Customer)) Customer."No." else
            Vendor."No.";
            ValidateTableRelation = false;

            trigger OnValidate()
            var
                Customer: Record Customer;
                Vendor: Record Vendor;
            begin
                if Rec."Partner No." <> '' then begin
                    if "Partner Type" = "Partner Type"::Customer then begin
                        Customer.Get(Rec."Partner No.");
                        Rec."Partner Name" := Customer.Name;
                    end else if "Partner Type" = "Partner Type"::Vendor then begin
                        Vendor.Get(Rec."Partner No.");
                        Rec."Partner Name" := Vendor.Name;
                    end;
                end;
            end;
        }
        field(5; "Partner Name"; Text[100])
        {
            Caption = 'Partner Name';
            Editable = false;
        }
        field(6; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
    }
    keys
    {
        key(PK; "Type", "No.")
        {
            Clustered = true;
        }
    }
}
