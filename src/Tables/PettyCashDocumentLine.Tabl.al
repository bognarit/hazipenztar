table 50102     "Petty Cash Document Line"
{
    Caption = 'Petty Cash Document Line';
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
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(5; Amount; Decimal)
        {
            Caption = 'Amount';
        }
    }
    keys
    {
        key(PK; "Type", "No.", "Line No.")
        {
            Clustered = true;
        }
    }
}