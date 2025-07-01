table 50100 "Petty Cash Setup"
{
    Caption = 'Petty Cash Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            TableRelation = "No. Series";
        }
        field(2; "Outgoing No. Series"; Code[20])
        {
            Caption = 'Outgoing No. Series';
            TableRelation = "No. Series";
        }
        field(3; "Incoming No. Series"; Code[20])
        {
            Caption = 'Incoming No. Series';
            TableRelation = "No. Series";
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
