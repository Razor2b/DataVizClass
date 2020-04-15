Sub a()

Dim StartRow As Double
Dim StopRow As Double
Dim Ticker As String
Dim TickerRow As Double
 

Dim TickerGI As String
Dim GI As Double
GI = 0
Dim TickerGD As String
Dim GD As Double
GD = 0
Dim TickerGV As String
Dim GV As Double
GV = 0
 

TickerRow = 2

 
Range("J1") = "Ticker"
Range("K1") = "Yearly Change"
Range("L1") = "Percent Change"
Range("M1") = "Total Stock Volume"
Range("Q1") = "Ticker"
Range("R1") = "Value"
Range("P2") = "Greatest % Increase"
Range("P3") = "Greatest % Decrease"
Range("P4") = "Greatest Total Volume"
Range("P2").HorizontalAlignment = xlRight
Range("P3").HorizontalAlignment = xlRight
Range("P4").HorizontalAlignment = xlRight
Range("R2").NumberFormat = "0.00%"
Range("R3").NumberFormat = "0.00%"
Range("R4").NumberFormat = "#,##0"
ActiveSheet.Range("A2").Select

Do Until ActiveCell.Value = ""

    Ticker = ActiveCell.Value()
    StartRow = ActiveCell.Row()
    StopRow = StartRow
    ActiveCell.Offset(1).Select
 
    While ActiveCell.Value() = Ticker
        StopRow = StopRow + 1
        ActiveCell.Offset(1).Select
    Wend
    Cells(TickerRow, 10).Value = Ticker
    Cells(TickerRow, 11).Value = Cells(StartRow, 3).Value - Cells(StopRow, 6).Value
    Cells(TickerRow, 11).NumberFormat = "#,##0.00"

    If Cells(TickerRow, 11).Value > 0 Then
        Cells(TickerRow, 11).Interior.Color = vbGreen

    ElseIf Cells(TickerRow, 11).Value < 0 Then
        Cells(TickerRow, 11).Interior.Color = vbRed

    End If
   

    If Cells(StopRow, 6).Value > 0 Then
        Cells(TickerRow, 12).Value = (Cells(StartRow, 3).Value - Cells(StopRow, 6).Value) / Cells(StopRow, 6).Value
        Cells(TickerRow, 12).NumberFormat = "0.00%"
    End If
        Cells(TickerRow, 13).Value = "=sum(G" & StartRow & ":G" & StopRow & ")"
        Cells(TickerRow, 13).NumberFormat = "#,##0"

    If GI = 0 Then
        TickerGI = Ticker
        GI = Cells(TickerRow, 12).Value
        TickerGD = Ticker
        GD = Cells(TickerRow, 12).Value
        TickerGV = Ticker
        GV = Cells(TickerRow, 13).Value

    Else
        If Cells(TickerRow, 12).Value > GI Then
            TickerGI = Ticker
            GI = Cells(TickerRow, 12).Value
        ElseIf Cells(TickerRow, 12).Value < GD Then
            TickerGD = Ticker
            GD = Cells(TickerRow, 12).Value
        End If

        If Cells(TickerRow, 13).Value > GV Then
            TickerGV = Ticker
            GV = Cells(TickerRow, 13).Value
        End If
    End If
    TickerRow = TickerRow + 1
Loop

Range("Q2") = TickerGI
Range("Q3") = TickerGD
Range("Q4") = TickerGV
Range("R2") = GI
Range("R3") = GD
Range("R4") = GV


End Sub