VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Resim Döndürme Uygulamasý"
   ClientHeight    =   9390
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   13980
   LinkTopic       =   "Form1"
   ScaleHeight     =   626
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   932
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text3 
      Height          =   375
      Left            =   4920
      TabIndex        =   12
      Text            =   "1"
      Top             =   840
      Width           =   735
   End
   Begin VB.CommandButton Command6 
      Caption         =   "Kaydet"
      Height          =   615
      Left            =   60
      TabIndex        =   10
      Top             =   4680
      Width           =   1095
   End
   Begin VB.CommandButton Command5 
      Caption         =   "Kaydet"
      Height          =   615
      Left            =   60
      TabIndex        =   9
      Top             =   2040
      Width           =   1095
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Arka Plan Rengi"
      Height          =   615
      Left            =   5520
      TabIndex        =   8
      Top             =   120
      Width           =   1815
   End
   Begin VB.TextBox Text2 
      Height          =   375
      Left            =   3720
      TabIndex        =   7
      Text            =   "6"
      Top             =   840
      Width           =   735
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Yumuþak Çizim"
      Height          =   615
      Left            =   3720
      TabIndex        =   6
      Top             =   120
      Width           =   1695
   End
   Begin VB.PictureBox ÇizimA 
      AutoRedraw      =   -1  'True
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   1935
      Left            =   1200
      ScaleHeight     =   129
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   569
      TabIndex        =   5
      Top             =   4680
      Width           =   8535
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      Height          =   1815
      Left            =   7440
      MultiLine       =   -1  'True
      TabIndex        =   4
      Text            =   "Form1.frx":0000
      Top             =   120
      Width           =   5775
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Çizdir"
      Height          =   615
      Left            =   1920
      TabIndex        =   3
      Top             =   120
      Width           =   1695
   End
   Begin VB.PictureBox Çizim 
      AutoRedraw      =   -1  'True
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   2295
      Left            =   1200
      ScaleHeight     =   153
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   569
      TabIndex        =   2
      Top             =   2040
      Width           =   8535
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Resim Yükle"
      Height          =   615
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   1695
   End
   Begin VB.PictureBox Nesne 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      Height          =   405
      Left            =   120
      Picture         =   "Form1.frx":0002
      ScaleHeight     =   27
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   29
      TabIndex        =   0
      Top             =   840
      Width           =   435
   End
   Begin VB.Label Label2 
      Caption         =   "x"
      Height          =   255
      Left            =   4560
      TabIndex        =   13
      Top             =   960
      Width           =   495
   End
   Begin VB.Label Label1 
      Caption         =   "Resim Adeti :"
      Height          =   375
      Left            =   2040
      TabIndex        =   11
      Top             =   960
      Width           =   1575
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Form2.Show
End Sub

Private Sub Command2_Click()
On Error Resume Next
Dim En, Boy As Integer      'En boy oraný
Dim dU, yX, YY As Double    'Uzunluk ve yeni noktalar
Dim alfa As Double          ' Açý
Dim COSB As Double
Dim SINB As Double
Dim X As Integer
Dim Y As Integer
Dim R1 As Long
Dim R2 As Long
Dim TaneX As Integer
Dim TaneY As Integer

En = Nesne.ScaleWidth
Boy = Nesne.ScaleHeight
TaneX = Text2.Text
TaneY = Text3.Text

dU = U(0, 0, En, Boy)
Text1.Text = "Yatay Uzaklýk : " & dU \ 1 & vbNewLine & "Dikey Uzaklýk : " & dU \ 1 & vbNewLine & "Yatayda Toplam Uzaklýk : " & (dU \ 1) * TaneX




COSB = En / dU
SINB = Boy / dU

Çizim.Cls
List1.Clear
Çizim.Width = (dU \ 1) * TaneX
Çizim.Height = (dU \ 1) * TaneY
ÇizimA.Width = Çizim.Width
ÇizimA.Height = Çizim.Height

Text1.Text = "readimagefile(" & Chr(34) & "resimadý.bmp" & Chr(34) & ",0,0," & Çizim.Width & "," & Çizim.Height & " );" & vbNewLine & _
"for (int r=0;r<" & TaneX * TaneY & ";r++){" & vbNewLine & _
"rgemim[r]= malloc(imagesize(0 ,0," & dU \ 1 & "," & dU \ 1 & "));" & vbNewLine _
& "getimage((r%" & TaneX & ")*" & dU \ 1 & ",(r/" & TaneX & ")*" & dU \ 1 & ",(r%" & TaneX & ")*" & dU \ 1 & "+" & dU \ 1 & ",(r/" & TaneX & ")*" & dU \ 1 & "+" & dU \ 1 & ", rgemim[r]);" & vbNewLine & _
"}"

For i = 0 To TaneX * TaneY
alfa = i * 6.283 / (TaneX * TaneY)



For X = -dU \ 2 To dU \ 2
    For Y = -dU \ 2 To dU \ 2
        yX = Cos(alfa) * X - Sin(alfa) * Y
        YY = Sin(alfa) * X + Cos(alfa) * Y
        If yX < En \ 2 And yX > -En \ 2 And YY < Boy \ 2 And YY > -Boy \ 2 Then
            ' Renk Düzeni Yapma Ksmý
        'Çizim.ForeColor = RenkKýsmý(yX + En \ 2, yY + Boy \ 2)
                        
                        
                        
        Çizim.ForeColor = Nesne.Point(yX + En \ 2, YY + Boy \ 2)
        Çizim.PSet (X + (i Mod TaneX) * dU \ 1 + dU \ 2, Y + dU \ 2 + (i \ TaneX) * (dU \ 1))
        
        End If
        
    Next
DoEvents
Next
'List1.AddItem (i Mod TaneX) * dU \ 1 + dU \ 2 & "-" & dU \ 2 + (i / TaneX) * (dU \ 1)
Next
End Sub
Function RenkKýsmý(yX As Double, YY As Double) As Long
Dim A, B, Bölge
A = yX - (yX \ 1)
B = YY - (YY \ 1)
If A < 0 Then A = A + 1
If B < 0 Then B = B + 1
Bölge = 0
List1.AddItem A & " - " & B

If A <= B And A <= 1 - B Then
RenkKýsmý = RenkArasý(Nesne.Point(yX \ 1, YY \ 1), Nesne.Point(yX \ 1, YY \ 1 + 1), B, 1)
End If

If A >= B And A <= 1 - B Then
RenkKýsmý = RenkArasý(Nesne.Point(yX \ 1, YY \ 1), Nesne.Point(yX \ 1 + 1, YY \ 1), A, 1)
End If

If A >= B And A >= 1 - B Then
RenkKýsmý = RenkArasý(Nesne.Point(yX \ 1 + 1, YY \ 1), Nesne.Point(yX \ 1 + 1, YY \ 1 + 1), B, 1)
End If

If A <= B And A >= 1 - B Then
RenkKýsmý = RenkArasý(Nesne.Point(yX \ 1, YY \ 1 + 1), Nesne.Point(yX \ 1 + 1, YY \ 1 + 1), A, 1)
End If




End Function


' ---------------------RENK AYARLARI

Function RenkArasý(R1, R2, Oran, Bölüm)
Dim R, G, B As Integer
'On Error Resume Next
If RK(R1) < RK(R2) Then
R = Int(RK(R1) + ((RK(R2) - RK(R1)) / Bölüm) * Oran)
Else
R = Int(RK(R2) + ((RK(R1) - RK(R2)) / Bölüm) * Oran)
End If

If RY(R1) < RY(R2) Then
G = Int(RY(R1) + ((RY(R2) - RY(R1)) / Bölüm) * Oran)
Else
G = Int(RY(R2) + ((RY(R1) - RY(R2)) / Bölüm) * Oran)
End If

If RM(R1) < RM(R2) Then
B = Int(RM(R1) + ((RM(R2) - RM(R1)) / Bölüm) * Oran)
Else
B = Int(RM(R2) + ((RM(R1) - RM(R2)) / Bölüm) * Oran)
End If
If B < 0 Then B = 0
If G < 0 Then G = 0
If R < 0 Then R = 0

RenkArasý = RGB(R, G, B)
End Function

Function RK(R)
RK = (R Mod 256)
End Function

Function RY(R)
RY = Val((R - RM(R) * 65536 - RK(R)) / 256)
End Function

Function RM(R)
RM = Int(R / (65536))
End Function
'Matmatik Kýsmý
Function U(X1, Y1, x2, y2) As Double
U = Sqr((X1 - x2) ^ 2 + (Y1 - y2) ^ 2)
End Function



Private Sub Command3_Click()
For Y = 0 To Çizim.Height - 1
    For X = 0 To Çizim.Width - 1
        ÇizimA.ForeColor = RGB((RK(Çizim.Point(X, Y)) * 3 + RK(Çizim.Point(X, Y + 1)) + RK(Çizim.Point(X + 1, Y)) + RK(Çizim.Point(X + 1, Y + 1))) / 6, (RY(Çizim.Point(X, Y)) * 3 + RY(Çizim.Point(X, Y + 1)) + RY(Çizim.Point(X + 1, Y)) + RY(Çizim.Point(X + 1, Y + 1))) / 6, (RM(Çizim.Point(X, Y)) * 3 + RM(Çizim.Point(X, Y + 1)) + RM(Çizim.Point(X + 1, Y)) + RM(Çizim.Point(X + 1, Y + 1))) / 6)
        ÇizimA.PSet (X, Y)
    Next
DoEvents
Next
ÇizimA.ForeColor = ÇizimA.BackColor
ÇizimA.Line (Çizim.Width - 1, 0)-(Çizim.Width - 1, Çizim.Height)
ÇizimA.Line (0, Çizim.Height - 1)-(Çizim.Width - 1, Çizim.Height - 1)
End Sub

Private Sub Command4_Click()
Form3.Show
End Sub

Private Sub Command5_Click()
SavePicture Çizim.Image, App.Path & "\Resimnormal.bmp"
MsgBox App.Path & "\Resimnormal.bmp  -> konumuna kaydedildi."
End Sub

Private Sub Command6_Click()
SavePicture ÇizimA.Image, App.Path & "\ResimMask.bmp"
MsgBox App.Path & "\ResimMask.bmp  -> konumuna kaydedildi."
End Sub

Private Sub Form_Unload(Cancel As Integer)
End
End Sub
