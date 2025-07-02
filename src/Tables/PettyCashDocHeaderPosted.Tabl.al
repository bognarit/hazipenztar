table 50103 "Petty Cash Doc Header Posted"
{
    Caption = 'Petty Cash Document Header - Posted';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Type"; Enum Types)
        {
            Caption = 'Type';
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
        }
        field(5; "Partner Name"; Text[100])
        {
            Caption = 'Partner Name';
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