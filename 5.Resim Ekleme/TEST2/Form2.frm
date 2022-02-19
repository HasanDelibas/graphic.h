VERSION 5.00
Begin VB.Form Form2 
   Caption         =   "Dosya Seç"
   ClientHeight    =   4215
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   5235
   LinkTopic       =   "Form2"
   ScaleHeight     =   4215
   ScaleWidth      =   5235
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Seç"
      Height          =   495
      Left            =   3480
      TabIndex        =   4
      Top             =   3480
      Width           =   1455
   End
   Begin VB.FileListBox File1 
      Height          =   3015
      Left            =   2520
      Pattern         =   "*.bmp;*.jpg"
      TabIndex        =   2
      Top             =   240
      Width           =   2415
   End
   Begin VB.DirListBox Dir1 
      Height          =   2565
      Left            =   240
      TabIndex        =   1
      Top             =   720
      Width           =   2175
   End
   Begin VB.DriveListBox Drive1 
      Height          =   315
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   2175
   End
   Begin VB.Label Label1 
      Caption         =   "Resim dosyasý seçiniz."
      Height          =   495
      Left            =   240
      TabIndex        =   3
      Top             =   3600
      Width           =   2895
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Form1.Nesne.Picture = LoadPicture(File1.Path & "\" & File1.FileName)
Me.Hide
End Sub

Private Sub Dir1_Change()
File1.Path = Dir1.Path
End Sub

Private Sub Drive1_Change()
Dir1.Path = Drive1.Drive
End Sub
