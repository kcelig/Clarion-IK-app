

   MEMBER('IKApp.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('IKAPP004.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form Vrsta_promjene_ispita
!!! </summary>
UpdateVrsta_promjene_ispita PROCEDURE 

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
History::Vrs:Record  LIKE(Vrs:RECORD),THREAD
QuickWindow          WINDOW('Vrsta promjene ispita'),AT(,,415,271),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdateVrsta_promjene_ispita'),SYSTEM
                       SHEET,AT(4,4,409,248),USE(?CurrentTab)
                         TAB('Unos/izmjena'),USE(?Tab:1)
                           PROMPT('<138>ifra vrste promjene:'),AT(13,28),USE(?Vrs:Sifra_vrste_promjene:Prompt),TRN
                           ENTRY(@n-14),AT(105,28,64,10),USE(Vrs:Sifra_vrste_promjene),RIGHT(1),DISABLE,READONLY
                           PROMPT('Vrsta promjene ispita:'),AT(13,42),USE(?Vrs:Naziv_promjene_ispita:Prompt),TRN
                           ENTRY(@s30),AT(105,42,124,10),USE(Vrs:Naziv_promjene_ispita)
                         END
                       END
                       BUTTON('Potvrdi'),AT(311,255,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('Odustani'),AT(362,255,51,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       BUTTON('&Help'),AT(8,255,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),DISABLE,FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
                    END

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Record Will Be Added'
  OF ChangeRecord
    ActionMessage = 'Record Will Be Changed'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateVrsta_promjene_ispita')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Vrs:Sifra_vrste_promjene:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Vrs:Record,History::Vrs:Record)
  SELF.AddHistoryField(?Vrs:Sifra_vrste_promjene,1)
  SELF.AddHistoryField(?Vrs:Naziv_promjene_ispita,2)
  SELF.AddUpdateFile(Access:Vrsta_promjene_ispita)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Vrsta_promjene_ispita.Open                        ! File Vrsta_promjene_ispita used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Vrsta_promjene_ispita
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?Vrs:Sifra_vrste_promjene{PROP:ReadOnly} = True
    ?Vrs:Naziv_promjene_ispita{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateVrsta_promjene_ispita',QuickWindow)  ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  ToolBarForm.HelpButton=?Help
  SELF.AddItem(ToolbarForm)
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Vrsta_promjene_ispita.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateVrsta_promjene_ispita',QuickWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
  RETURN ReturnValue


ThisWindow.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receive all EVENT:Accepted's
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OK
      ThisWindow.Update
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Report
!!! Report the Stavka_odjave File
!!! </summary>
IspisOdjava PROCEDURE 

Progress:Thermometer BYTE                                  !
Process:View         VIEW(Stavka_odjave)
                       PROJECT(Sta1:Sif_odjave)
                       PROJECT(Sta1:Sif_predmeta_o)
                       JOIN(Odj:PK_Odjava,Sta1:Sif_odjave)
                         PROJECT(Odj:Datum)
                         PROJECT(Odj:Klas_a)
                         PROJECT(Odj:UrBr)
                         PROJECT(Odj:Oib)
                         JOIN(Uce:PK_Ucenik,Odj:Oib)
                           PROJECT(Uce:Ime)
                           PROJECT(Uce:Oib)
                           PROJECT(Uce:Prezime)
                         END
                       END
                       JOIN(Pre:PK_Predmet_odjava,Sta1:Sif_predmeta_o)
                         PROJECT(Pre:Naziv_predmeta_o)
                       END
                     END
ProgressWindow       WINDOW('Report Stavka_odjave'),AT(,,142,59),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Report'), |
  TIP('Cancel Report')
                     END

Report               REPORT('Stavka_odjave Report'),AT(6,131,203,47),PRE(RPT),PAPER(PAPER:A4),FONT('Times New Roman', |
  11,,FONT:regular,CHARSET:EASTEUROPE),MM
                       HEADER,AT(6,6,203,125),USE(?Header),FONT('Times New Roman',11,,FONT:regular,CHARSET:EASTEUROPE)
                         STRING(@K###-##/##-##/##K),AT(52,24,35),USE(Odj:Klas_a)
                         STRING(@K####-##-##-###K),AT(52,30,26),USE(Odj:UrBr)
                         STRING(@D06.),AT(38,35,23),USE(Odj:Datum)
                         STRING(@s50),AT(36,93,114),USE(Uce:Ime)
                         STRING(@s70),AT(36,98,131,5),USE(Uce:Prezime)
                         STRING(@s15),AT(36,103,52),USE(Uce:Oib)
                         STRING('Tehnièka <154>kola Ruðera Bo<154>koviæa Vinkovci'),AT(19,13,,6),USE(?STRING3),FONT(, |
  ,,FONT:bold)
                         STRING('Stanka Vraza 15, 32100 Vinkovci'),AT(19,19,55,4),USE(?STRING3:2)
                         STRING('Klasa:'),AT(19,24,23,4),USE(?STRING3:3)
                         STRING('Urud<158>beni broj:'),AT(19,30,27,4),USE(?STRING3:4)
                         STRING('Vinkovci,'),AT(19,35,15,4),USE(?STRING3:5)
                         STRING('Na temelju èlanka 17. Pravilnika o polaganju dr<158>avne mature (<132>Narodne n' & |
  'ovine<147> broj 1/13),'),AT(19,52),USE(?STRING4)
                         STRING('<138>kolsko ispitno povjerenstvo na sjednici odr<158>anoj dana'),AT(19,57,87),USE(?STRING5)
                         STRING(@D06.),AT(108,57,17,4),USE(Odj:Datum,,?Odj:Datum:2)
                         STRING('donosi'),AT(129,57,15,4),USE(?STRING3:6)
                         STRING('O D L U K U'),AT(79,72,29,4),USE(?STRING3:7),FONT(,,,FONT:bold)
                         STRING('o opravdanosti zamolbe za sljedeæeg uèenika:'),AT(19,84,73,7),USE(?STRING5:2)
                         STRING('Ime:'),AT(19,93,15,4),USE(?STRING3:8)
                         STRING('Prezime:'),AT(19,98,15,4),USE(?STRING3:9)
                         STRING('OIB:'),AT(19,103,15,4),USE(?STRING3:10)
                         STRING('Odjava ispita:'),AT(19,117,51,6),USE(?STRING3:11)
                       END
Detail                 DETAIL,AT(0,0,203,6),USE(?Detail)
                         STRING(@s50),AT(32,1,119),USE(Pre:Naziv_predmeta_o)
                       END
                       FOOTER,AT(6,180,203,72),USE(?Footer)
                         STRING('Date:'),AT(8,81,9,3),USE(?ReportDatePrompt:2),FONT('Arial',8,,FONT:regular),DISABLE, |
  HIDE,TRN
                         STRING('<<-- Date Stamp -->'),AT(17,81,23,3),USE(?ReportDateStamp:2),FONT('Arial',8,,FONT:regular), |
  DISABLE,HIDE,TRN
                         STRING('Time:'),AT(46,81,7,3),USE(?ReportTimePrompt:2),FONT('Arial',8,,FONT:regular),DISABLE, |
  HIDE,TRN
                         STRING('<<-- Time Stamp -->'),AT(54,81,23,3),USE(?ReportTimeStamp:2),FONT('Arial',8,,FONT:regular), |
  DISABLE,HIDE,TRN
                         STRING(@pPage <<#p),AT(182,81,18,3),USE(?PageCount:2),FONT('Arial',8,,FONT:regular),PAGENO, |
  DISABLE,HIDE
                         STRING('Predsjednik <154>kolskoga ispitnoga povjerenstva'),AT(113,4,72),USE(?STRING1)
                         STRING('Dostaviti:'),AT(19,42,42),USE(?STRING2)
                         LINE,AT(112,26,69,0),USE(?LINE1)
                         STRING('Mate Vuku<154>iæ, prof.'),AT(113,10,61,5),USE(?STRING1:2)
                         STRING('1. Uèenik'),AT(25,47,43,4),USE(?STRING2:2)
                         STRING('2. Nacionalni centar za vanjsko vrednovanje obrazovanja'),AT(25,52,98,6),USE(?STRING2:3)
                         STRING('3. Arhiva <154>kole za dr<158>avnu maturu'),AT(25,57,62,4),USE(?STRING2:4)
                       END
                       FORM,AT(6,6,203,125),USE(?Form),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT)
                         IMAGE,AT(0,0,200,135),USE(?FormImage),TILED
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('IspisOdjava')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Stavka_odjave.SetOpenRelated()
  Relate:Stavka_odjave.Open                                ! File Stavka_odjave used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IspisOdjava',ProgressWindow)               ! Restore window settings from non-volatile store
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:Stavka_odjave, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Sta1:Sif_odjave)
  ThisReport.AddSortOrder(Sta1:PK_Stavka_odjave)
  ThisReport.AddRange(Sta1:Sif_odjave,Relate:Stavka_odjave,Relate:Odjava)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Stavka_odjave.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Stavka_odjave.Close
  END
  IF SELF.Opened
    INIMgr.Update('IspisOdjava',ProgressWindow)            ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportDateStamp:2{PROP:Text} = FORMAT(TODAY(),@D17)
  END
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportTimeStamp:2{PROP:Text} = FORMAT(CLOCK(),@T7)
  END
  RETURN ReturnValue


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detail)
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Report
!!! Report the Izostanak File
!!! </summary>
IspisIzostanak PROCEDURE 

Progress:Thermometer BYTE                                  !
Process:View         VIEW(Izostanak)
                       PROJECT(Opr:Datum)
                       PROJECT(Opr:Datum_ispita)
                       PROJECT(Opr:K__lasa)
                       PROJECT(Opr:Sifra_izostanka)
                       PROJECT(Opr:Urbr)
                       PROJECT(Opr:Sifra_predmeta_o)
                       PROJECT(Opr:Sif_ispitnog_roka)
                       PROJECT(Opr:Sif_razloga)
                       PROJECT(Opr:Oib)
                       JOIN(Pre:PK_Predmet_odjava,Opr:Sifra_predmeta_o)
                         PROJECT(Pre:Naziv_predmeta_o)
                       END
                       JOIN(Isp:PK_Ispitni_rok,Opr:Sif_ispitnog_roka)
                         PROJECT(Isp:Naziv_ispitnog_roka_dativ)
                       END
                       JOIN(Raz:PK_Razlog_izostanka,Opr:Sif_razloga)
                         PROJECT(Raz:Razlog)
                       END
                       JOIN(Uce:PK_Ucenik,Opr:Oib)
                         PROJECT(Uce:Ime)
                         PROJECT(Uce:Oib)
                         PROJECT(Uce:Prezime)
                       END
                     END
ProgressWindow       WINDOW('Report Izostanak'),AT(,,142,59),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Report'), |
  TIP('Cancel Report')
                     END

Report               REPORT('Izostanak Report'),AT(6,146,200,19),PRE(RPT),PAPER(PAPER:A4),FONT('MS Sans Serif', |
  8,,FONT:regular,CHARSET:DEFAULT),MM
                       HEADER,AT(6,6,200,142),USE(?Header),FONT('Times New Roman',11,,FONT:regular,CHARSET:EASTEUROPE)
                         STRING(@K###-##/##-##/##K),AT(47,23,50,4),USE(Opr:K__lasa),LEFT
                         STRING(@K####-##-##-###K),AT(47,29,48,4),USE(Opr:Urbr),LEFT
                         STRING(@D06.),AT(33,35,48,4),USE(Opr:Datum),LEFT
                         STRING(@D06.),AT(26,106,21,4),USE(Opr:Datum_ispita),LEFT
                         STRING('Temeljem èlanaka 18. i 22. Pravilnika o polaganju dr<158>avne mature, <138>kols' & |
  'ko ispitno povjerenstvo je dana '),AT(15,51),USE(?STRING1)
                         STRING('donijelo sljedeæu'),AT(38,57,32),USE(?STRING2)
                         STRING('Vinkovci, '),AT(15,35),USE(?STRING3)
                         STRING('O D L U K U'),AT(90,69,28,4),USE(?STRING3:2),FONT(,,,FONT:bold)
                         STRING('Smatra se da uèenik:'),AT(15,79,37),USE(?STRING4)
                         STRING('Ime:'),AT(15,85,12,4),USE(?STRING4:2)
                         STRING('Prezime:'),AT(15,91,17,4),USE(?STRING4:3)
                         STRING('OIB:'),AT(15,97,12,4),USE(?STRING4:4)
                         STRING('dana '),AT(15,106,11,4),USE(?STRING3:3)
                         STRING('nije pristupio na prijavljeni ispit iz'),AT(49,106,55,5),USE(?STRING3:4)
                         STRING(@s50),AT(106,106,87),USE(Pre:Naziv_predmeta_o)
                         STRING(@s29),AT(53,111,50),USE(Isp:Naziv_ispitnog_roka_dativ)
                         STRING('na dr<158>avnoj maturi  -'),AT(15,111,34,5),USE(?STRING3:6)
                         STRING('Obrazlo<158>enje:'),AT(15,120,23,7),USE(?STRING3:7)
                         STRING('Uèenik nije pristupio ispitu/dijelu ispita dr<158>avne mature iz razloga:'),AT(15, |
  129,104,5),USE(?STRING3:8)
                         STRING(@s50),AT(15,135,78),USE(Raz:Razlog)
                         STRING('Tehnièka <154>kola Ruðera Bo<154>koviæa Vinkovci'),AT(15,11,85,4),USE(?STRING3:9), |
  FONT(,,,FONT:bold)
                         STRING('Klasa:'),AT(15,23,13,4),USE(?STRING3:10)
                         STRING('Urud<158>beni broj:'),AT(15,29,28,6),USE(?STRING3:11)
                         STRING(@s50),AT(33,85,89,6),USE(Uce:Ime)
                         STRING(@s70),AT(33,91,129),USE(Uce:Prezime)
                         STRING(@s15),AT(33,97,72),USE(Uce:Oib)
                         STRING(@D06.),AT(15,57,21,4),USE(Opr:Datum,,?Opr:Datum:2),LEFT
                         STRING('Stanka Vraza 15, 32100 Vinkovci'),AT(15,17,66,4),USE(?STRING3:5)
                       END
Detail                 DETAIL,AT(0,0,200,4),USE(?Detail)
                       END
                       FOOTER,AT(6,166,200,88),USE(?Footer),FONT('Times New Roman',11,,,CHARSET:EASTEUROPE)
                         STRING('Date:'),AT(7,79,9,3),USE(?ReportDatePrompt:2),FONT('Arial',8,,FONT:regular),DISABLE, |
  HIDE,TRN
                         STRING('<<-- Date Stamp -->'),AT(16,79,23,3),USE(?ReportDateStamp:2),FONT('Arial',8,,FONT:regular), |
  DISABLE,HIDE,TRN
                         STRING('Time:'),AT(45,79,7,3),USE(?ReportTimePrompt:2),FONT('Arial',8,,FONT:regular),DISABLE, |
  HIDE,TRN
                         STRING('<<-- Time Stamp -->'),AT(52,79,23,3),USE(?ReportTimeStamp:2),FONT('Arial',8,,FONT:regular), |
  DISABLE,HIDE,TRN
                         STRING(@pPage <<#p),AT(178,79,18,3),USE(?PageCount:2),FONT('Arial',8,,FONT:regular),PAGENO, |
  DISABLE,HIDE
                         STRING('Predsjednik <154>kolskoga ispitnoga povjerenstva'),AT(116,8),USE(?STRING5)
                         STRING('Mate Vuku<154>iæ, prof.'),AT(116,13,53,5),USE(?STRING5:2)
                         LINE,AT(116,31,66,0),USE(?LINE1)
                         STRING('Dostaviti:'),AT(15,46),USE(?STRING6)
                         STRING('1. Uèenik'),AT(20,52,23,4),USE(?STRING6:2)
                         STRING('2. Nacionalni centar za vanjsko vrednovanje obrazovanja'),AT(20,58,103,6),USE(?STRING6:3)
                         STRING('3. Arhiva <154>kole za dr<158>avnu maturu'),AT(20,64,67,4),USE(?STRING6:4)
                       END
                       FORM,AT(6,6,200,138),USE(?Form),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT)
                         IMAGE,AT(0,0,200,138),USE(?FormImage),TILED
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('IspisIzostanak')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Izostanak.Open                                    ! File Izostanak used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IspisIzostanak',ProgressWindow)            ! Restore window settings from non-volatile store
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:Izostanak, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Opr:Sifra_izostanka)
  ThisReport.AddSortOrder(Opr:PK_Opravdani_izostanak)
  ThisReport.AddRange(Opr:Sifra_izostanka)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Izostanak.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Izostanak.Close
  END
  IF SELF.Opened
    INIMgr.Update('IspisIzostanak',ProgressWindow)         ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportDateStamp:2{PROP:Text} = FORMAT(TODAY(),@D17)
  END
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportTimeStamp:2{PROP:Text} = FORMAT(CLOCK(),@T7)
  END
  RETURN ReturnValue


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detail)
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Report
!!! Report the Stavka_promjene File
!!! </summary>
IspisPromjena PROCEDURE 

Progress:Thermometer BYTE                                  !
Process:View         VIEW(Stavka_promjene)
                       PROJECT(Sta:Sif_predmeta_o)
                       PROJECT(Sta:Sif_predmeta_p)
                       PROJECT(Sta:Sif_promjene)
                       JOIN(Pro:PK_Promjena,Sta:Sif_promjene)
                         PROJECT(Pro:Datum)
                         PROJECT(Pro:Kla_sa)
                         PROJECT(Pro:UrBr)
                         PROJECT(Pro:Oib)
                         PROJECT(Pro:Sifra_vrste_promjene)
                         JOIN(Uce:PK_Ucenik,Pro:Oib)
                           PROJECT(Uce:Ime)
                           PROJECT(Uce:Oib)
                           PROJECT(Uce:Prezime)
                         END
                         JOIN(Vrs:PK_Vrsta_promjene_ispita,Pro:Sifra_vrste_promjene)
                           PROJECT(Vrs:Naziv_promjene_ispita)
                         END
                       END
                       JOIN(Pre:PK_Predmet_odjava,Sta:Sif_predmeta_o)
                         PROJECT(Pre:Naziv_predmeta_o)
                       END
                       JOIN(Pre1:PK_Predmet_prijava,Sta:Sif_predmeta_p)
                         PROJECT(Pre1:Naziv_predmeta_p)
                       END
                     END
ProgressWindow       WINDOW('Report Stavka_promjene'),AT(,,142,59),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Report'), |
  TIP('Cancel Report')
                     END

Report               REPORT('Stavka_promjene Report'),AT(6,130,200,43),PRE(RPT),PAPER(PAPER:A4),FONT('MS Sans Serif', |
  8,,FONT:regular,CHARSET:DEFAULT),MM
                       HEADER,AT(6,6,200,121),USE(?Header),FONT('Times New Roman',11,,FONT:regular,CHARSET:EASTEUROPE)
                         STRING('Tehnièka <154>kola Ruðera Bo<154>koviæa Vinkovci'),AT(15,11),USE(?STRING1),FONT(,, |
  ,FONT:bold)
                         STRING('Klasa:'),AT(15,21,16,4),USE(?STRING1:2)
                         STRING('Urud<158>beni broj:'),AT(15,27,26,4),USE(?STRING1:3)
                         STRING('Vinkovci, '),AT(15,33,16,4),USE(?STRING1:4)
                         STRING('Stanka Vraza 15, 32100 Vinkovci'),AT(15,16,55,4),USE(?STRING1:5)
                         STRING('Na temelju èlanka 17. Pravilnika o polaganju dr<158>avne mature (<132>Narodne n' & |
  'ovine<147> broj 1/13),'),AT(15,46,162,4),USE(?STRING1:6)
                         STRING('<138>kolsko ispitno povjerenstvo na sjednici odr<158>anoj dana'),AT(15,52,87,6),USE(?STRING1:7)
                         STRING('donosi'),AT(127,52,16,4),USE(?STRING1:8)
                         STRING('O D L U K U'),AT(94,67,26,4),USE(?STRING1:9),FONT(,,,FONT:bold)
                         STRING('o opravdanosti zamolbe za sljedeæeg uèenika:'),AT(15,82,79,7),USE(?STRING1:10)
                         STRING('Ime:'),AT(15,88,9,4),USE(?STRING1:11)
                         STRING('Prezime:'),AT(15,93,16,4),USE(?STRING1:12)
                         STRING('OIB:'),AT(15,99,13,4),USE(?STRING1:13)
                         STRING(@K###-##/##-##/##K),AT(43,21,30),USE(Pro:Kla_sa)
                         STRING(@K####-##-##-###K),AT(43,27,27),USE(Pro:UrBr)
                         STRING(@D06.),AT(35,33,24),USE(Pro:Datum)
                         STRING(@D06.),AT(104,52,20,4),USE(Pro:Datum,,?Pro:Datum:2)
                         STRING(@s70),AT(33,93,115),USE(Uce:Prezime)
                         STRING(@s50),AT(33,88,110),USE(Uce:Ime)
                         STRING(@s15),AT(33,99,49),USE(Uce:Oib)
                         STRING(@s30),AT(15,116,91),USE(Vrs:Naziv_promjene_ispita)
                       END
Detail                 DETAIL,AT(0,0,200,14),USE(?Detail),FONT('Times New Roman',11,,,CHARSET:EASTEUROPE)
                         STRING(@s50),AT(40,1,83),USE(Pre:Naziv_predmeta_o)
                         STRING('Odjava:'),AT(15,1),USE(?STRING2)
                         STRING('Nova prijava:'),AT(15,7,22,6),USE(?STRING2:2)
                         STRING(@s50),AT(40,7,85),USE(Pre1:Naziv_predmeta_p)
                       END
                       FOOTER,AT(7,174,199,75),USE(?Footer),FONT('Times New Roman',11,,,CHARSET:EASTEUROPE)
                         STRING('Date:'),AT(4,85,9,3),USE(?ReportDatePrompt:2),FONT('Arial',8,,FONT:regular),DISABLE, |
  HIDE,TRN
                         STRING('<<-- Date Stamp -->'),AT(13,85,23,3),USE(?ReportDateStamp:2),FONT('Arial',8,,FONT:regular), |
  DISABLE,HIDE,TRN
                         STRING('Time:'),AT(42,85,7,3),USE(?ReportTimePrompt:2),FONT('Arial',8,,FONT:regular),DISABLE, |
  HIDE,TRN
                         STRING('<<-- Time Stamp -->'),AT(50,85,23,3),USE(?ReportTimeStamp:2),FONT('Arial',8,,FONT:regular), |
  DISABLE,HIDE,TRN
                         STRING(@pPage <<#p),AT(178,85,18,3),USE(?PageCount:2),FONT('Arial',8,,FONT:regular),PAGENO, |
  DISABLE,HIDE
                         STRING('Predsjednik <154>kolskoga ispitnoga povjerenstva'),AT(111,6),USE(?STRING3)
                         STRING('Mate Vuku<154>iæ, prof.'),AT(111,12,56,6),USE(?STRING3:2)
                         LINE,AT(111,27,68,0),USE(?LINE1)
                         STRING('Dostaviti:'),AT(15,42),USE(?STRING4)
                         STRING('1. Uèenik'),AT(20,48,25,4),USE(?STRING4:2)
                         STRING('2. Nacionalni centar za vanjsko vrednovanje obrazovanja'),AT(20,53,99,6),USE(?STRING4:3)
                         STRING('3. Arhiva <154>kole za dr<158>avnu maturu'),AT(20,58,83,4),USE(?STRING4:4)
                       END
                       FORM,AT(6,6,200,263),USE(?Form),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT)
                         IMAGE,AT(0,0,203,122),USE(?FormImage),TILED
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('IspisPromjena')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Stavka_promjene.SetOpenRelated()
  Relate:Stavka_promjene.Open                              ! File Stavka_promjene used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IspisPromjena',ProgressWindow)             ! Restore window settings from non-volatile store
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:Stavka_promjene, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Sta:Sif_promjene)
  ThisReport.AddSortOrder(Sta:PK_Stavka_promjene)
  ThisReport.AddRange(Sta:Sif_promjene,Relate:Stavka_promjene,Relate:Promjena)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Stavka_promjene.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Stavka_promjene.Close
  END
  IF SELF.Opened
    INIMgr.Update('IspisPromjena',ProgressWindow)          ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportDateStamp:2{PROP:Text} = FORMAT(TODAY(),@D17)
  END
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportTimeStamp:2{PROP:Text} = FORMAT(CLOCK(),@T7)
  END
  RETURN ReturnValue


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detail)
  RETURN ReturnValue

