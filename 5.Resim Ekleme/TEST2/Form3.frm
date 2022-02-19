VERSION 5.00
Begin VB.Form Form3 
   Caption         =   "ArkaPlan Rengi"
   ClientHeight    =   2640
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   9480
   LinkTopic       =   "Form3"
   ScaleHeight     =   176
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   632
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command1 
      Caption         =   "Uygula"
      Height          =   615
      Left            =   7440
      TabIndex        =   9
      Top             =   1920
      Width           =   1935
   End
   Begin VB.HScrollBar M 
      Height          =   375
      Left            =   3960
      Max             =   255
      TabIndex        =   5
      Top             =   1080
      Width           =   3375
   End
   Begin VB.HScrollBar Y 
      Height          =   375
      Left            =   3960
      Max             =   255
      TabIndex        =   4
      Top             =   600
      Width           =   3375
   End
   Begin VB.HScrollBar K 
      Height          =   375
      Left            =   3960
      Max             =   255
      TabIndex        =   3
      Top             =   120
      Width           =   3375
   End
   Begin VB.PictureBox PR 
      BorderStyle     =   0  'None
      Height          =   2625
      Left            =   0
      ScaleHeight     =   175
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   200
      TabIndex        =   1
      Top             =   0
      Width           =   3000
      Begin VB.PictureBox Renk 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   375
         Index           =   0
         Left            =   0
         ScaleHeight     =   23
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   23
         TabIndex        =   2
         Top             =   0
         Width           =   375
      End
   End
   Begin VB.PictureBox Anarenk 
      BackColor       =   &H00000000&
      Height          =   1335
      Left            =   7440
      ScaleHeight     =   1275
      ScaleWidth      =   1875
      TabIndex        =   0
      Top             =   120
      Width           =   1935
   End
   Begin VB.Label MM 
      Caption         =   "M: 0"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   12
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3000
      TabIndex        =   8
      Top             =   1200
      Width           =   975
   End
   Begin VB.Label YY 
      Caption         =   "Y: 0"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   12
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3000
      TabIndex        =   7
      Top             =   720
      Width           =   975
   End
   Begin VB.Label KK 
      Caption         =   "K: 0"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   12
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3000
      TabIndex        =   6
      Top             =   240
      Width           =   975
   End
End
Attribute VB_Name = "Form3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Form1.Çizim.BackColor = Anarenk.BackColor
Form1.ÇizimA.BackColor = Anarenk.BackColor
Me.Hide
End Sub

Private Sub Form_Load()
Dim Y As Integer
Y = 25
PR.Move 0, 0, 8 * Y, 7 * Y
Renk(0).BackColor = 0
For i = 1 To 7
    Load Renk(i)
    Renk(i).Visible = True
    Renk(i).Left = i * Y
    Renk(i).BackColor = RGB(i * 255 / 7, i * 255 / 7, i * 255 / 7)
Next
For i = 8 To 15
    Load Renk(i):    Renk(i).Visible = True
    Renk(i).Move (i - 8) * Y, Y * (i \ 8)
    Renk(i).BackColor = RGB((i - 8) * 255 / 7, 0, 0)
Next
For i = 16 To 23
    Load Renk(i):    Renk(i).Visible = True
    Renk(i).Move (i - 16) * Y, Y * (i \ 8)
    Renk(i).BackColor = RGB(0, (i - 16) * 255 / 7, 0)
Next
For i = 24 To 31
    Load Renk(i):    Renk(i).Visible = True
    Renk(i).Move (i - 24) * Y, Y * (i \ 8)
    Renk(i).BackColor = RGB(0, 0, (i - 24) * 255 / 7)
Next
For i = 32 To 39
    Load Renk(i):    Renk(i).Visible = True
    Renk(i).Move (i - 32) * Y, Y * (i \ 8)
    Renk(i).BackColor = RGB((i - 32) * 255 / 7, 0, (i - 32) * 255 / 7)
Next
For i = 40 To 47
    Load Renk(i):    Renk(i).Visible = True
    Renk(i).Move (i - 40) * Y, Y * (i \ 8)
    Renk(i).BackColor = RGB((i - 40) * 255 / 7, (i - 40) * 255 / 7, 0)
Next
For i = 48 To 55
    Load Renk(i):    Renk(i).Visible = True
    Renk(i).Move (i - 48) * Y, Y * (i \ 8)
    Renk(i).BackColor = RGB(0, (i - 48) * 255 / 7, (i - 48) * 255 / 7)
Next


End Sub

Private Sub K_Change()
Anarenk.BackColor = RGB(K.Value, Y.Value, M.Value)
KK.Caption = "K: " & K.Value
End Sub

Private Sub M_Change()
Anarenk.BackColor = RGB(K.Value, Y.Value, M.Value)
MM.Caption = "M: " & M.Value
End Sub

Private Sub Renk_Click(Index As Integer)
Anarenk.BackColor = Renk(Index).BackColor
End Sub

Private Sub Y_Change()
Anarenk.BackColor = RGB(K.Value, Y.Value, M.Value)
YY.Caption = "Y: " & Y.Value
End Sub
