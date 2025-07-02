table 50104 "Petty Cash Doc Line Posted"
{
    Caption = 'Petty Cash Document Line - Posted';
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
