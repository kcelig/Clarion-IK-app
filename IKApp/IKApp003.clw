

   MEMBER('IKApp.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('IKAPP003.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('IKAPP002.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Select a Vrsta_promjene_ispita Record
!!! </summary>
SelectVrsta_promjene_ispita PROCEDURE 

CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(Vrsta_promjene_ispita)
                       PROJECT(Vrs:Naziv_promjene_ispita)
                       PROJECT(Vrs:Sifra_vrste_promjene)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Vrs:Naziv_promjene_ispita LIKE(Vrs:Naziv_promjene_ispita) !List box control field - type derived from field
Vrs:Sifra_vrste_promjene LIKE(Vrs:Sifra_vrste_promjene) !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Vrsta promjene ispita'),AT(,,416,208),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('SelectVrsta_promjene_ispita'),SYSTEM
                       LIST,AT(8,30,397,132),USE(?Browse:1),FORMAT('80L(5)|M~Vrsta promjene ispita~@s30@'),FROM(Queue:Browse:1), |
  IMM,MSG('Browsing the Vrsta_promjene_ispita file')
                       BUTTON('Odaberi'),AT(357,167,49,14),USE(?Select:2),LEFT,ICON('WASELECT.ICO'),FLAT,MSG('Select the Record'), |
  TIP('Select the Record')
                       SHEET,AT(4,4,410,185),USE(?CurrentTab)
                         TAB('Popis promjena'),USE(?Tab:2)
                         END
                       END
                       BUTTON('Zatvori'),AT(357,192,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(235,192,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),DISABLE,FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort0:StepClass StepClass                            ! Default Step Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('SelectVrsta_promjene_ispita')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:Vrsta_promjene_ispita.Open                        ! File Vrsta_promjene_ispita used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Vrsta_promjene_ispita,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,Vrs:PK_Vrsta_promjene_ispita)         ! Add the sort order for Vrs:PK_Vrsta_promjene_ispita for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,Vrs:Sifra_vrste_promjene,1,BRW1) ! Initialize the browse locator using  using key: Vrs:PK_Vrsta_promjene_ispita , Vrs:Sifra_vrste_promjene
  BRW1.AddField(Vrs:Naziv_promjene_ispita,BRW1.Q.Vrs:Naziv_promjene_ispita) ! Field Vrs:Naziv_promjene_ispita is a hot field or requires assignment from browse
  BRW1.AddField(Vrs:Sifra_vrste_promjene,BRW1.Q.Vrs:Sifra_vrste_promjene) ! Field Vrs:Sifra_vrste_promjene is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectVrsta_promjene_ispita',QuickWindow)  ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
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
    INIMgr.Update('SelectVrsta_promjene_ispita',QuickWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Form Promjena
!!! </summary>
UpdatePromjena PROCEDURE 

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
BRW11::View:Browse   VIEW(Stavka_promjene)
                       PROJECT(Sta:Sif_promjene)
                       PROJECT(Sta:Sif_predmeta_o)
                       PROJECT(Sta:Sif_predmeta_p)
                       JOIN(Pre:PK_Predmet_odjava,Sta:Sif_predmeta_o)
                         PROJECT(Pre:Naziv_predmeta_o)
                         PROJECT(Pre:Sif_predmeta_o)
                       END
                       JOIN(Pre1:PK_Predmet_prijava,Sta:Sif_predmeta_p)
                         PROJECT(Pre1:Naziv_predmeta_p)
                         PROJECT(Pre1:Sif_predmeta_p)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
Pre:Naziv_predmeta_o   LIKE(Pre:Naziv_predmeta_o)     !List box control field - type derived from field
Pre1:Naziv_predmeta_p  LIKE(Pre1:Naziv_predmeta_p)    !List box control field - type derived from field
Sta:Sif_promjene       LIKE(Sta:Sif_promjene)         !Primary key field - type derived from field
Sta:Sif_predmeta_o     LIKE(Sta:Sif_predmeta_o)       !Primary key field - type derived from field
Sta:Sif_predmeta_p     LIKE(Sta:Sif_predmeta_p)       !Primary key field - type derived from field
Pre:Sif_predmeta_o     LIKE(Pre:Sif_predmeta_o)       !Related join file key field - type derived from field
Pre1:Sif_predmeta_p    LIKE(Pre1:Sif_predmeta_p)      !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
History::Pro:Record  LIKE(Pro:RECORD),THREAD
QuickWindow          WINDOW('Promjena ispita'),AT(,,522,345),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdatePromjena'),SYSTEM
                       SHEET,AT(4,4,513,321),USE(?CurrentTab)
                         TAB('Promjena'),USE(?Tab:1)
                           PROMPT('<138>ifra promjene:'),AT(11,25),USE(?Pro:Sif_promjene:Prompt),TRN
                           ENTRY(@n-14),AT(99,25,64,10),USE(Pro:Sif_promjene),RIGHT(1),DISABLE,READONLY
                           PROMPT('Vrsta promjene:'),AT(11,94),USE(?Pro:Sifra_vrste_promjene:Prompt),TRN
                           ENTRY(@n-14),AT(99,93,64,10),USE(Pro:Sifra_vrste_promjene),RIGHT(1)
                           PROMPT('Klasa:'),AT(11,39),USE(?Pro:Kla_sa:Prompt),TRN
                           ENTRY(@K###-##/##-##/##K),AT(99,40,104,10),USE(Pro:Kla_sa)
                           PROMPT('Urud<158>beni broj:'),AT(11,54),USE(?Pro:UrBr:Prompt),TRN
                           ENTRY(@K####-##-##-###K),AT(99,55,104,10),USE(Pro:UrBr)
                           PROMPT('Datum:'),AT(11,69),USE(?Pro:Datum:Prompt),TRN
                           ENTRY(@D06.),AT(99,70,104,10),USE(Pro:Datum)
                           PROMPT('Uèenik:'),AT(11,118),USE(?Pro:Oib:Prompt),TRN
                           ENTRY(@s15),AT(99,119,64,10),USE(Pro:Oib)
                           BUTTON('...'),AT(207,69,12,12),USE(?Calendar)
                           BUTTON('...'),AT(169,117,12,12),USE(?CallLookup)
                           ENTRY(@s50),AT(185,119),USE(Uce:Ime),DISABLE,READONLY
                           ENTRY(@s70),AT(185,136),USE(Uce:Prezime),DISABLE,READONLY
                           BUTTON('...'),AT(169,91,12,12),USE(?CallLookup:2)
                           ENTRY(@s30),AT(185,92),USE(Vrs:Naziv_promjene_ispita),DISABLE,READONLY
                         END
                         TAB('Stavka promjene'),USE(?TAB1)
                           LIST,AT(13,30,493,270),USE(?List),FORMAT('200L(5)|M~Odjavljeni predmet~@s50@200L(5)|M~P' & |
  'rijavljeni predmet~@s50@'),FROM(Queue:Browse),IMM
                           BUTTON('Dodaj'),AT(381,304,42,12),USE(?Insert)
                           BUTTON('Uredi'),AT(423,304,42,12),USE(?Change)
                           BUTTON('Obri<154>i'),AT(465,304,42,12),USE(?Delete)
                         END
                       END
                       BUTTON('Potvrdi'),AT(406,327,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('Odustani'),AT(458,327,57,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       BUTTON('&Help'),AT(270,329,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),DISABLE,FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeSelected           PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Calendar8            CalendarClass
BRW11                CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
                     END

BRW11::Sort0:Locator StepLocatorClass                      ! Default Locator
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
  GlobalErrors.SetProcedureName('UpdatePromjena')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Pro:Sif_promjene:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Pro:Record,History::Pro:Record)
  SELF.AddHistoryField(?Pro:Sif_promjene,1)
  SELF.AddHistoryField(?Pro:Sifra_vrste_promjene,2)
  SELF.AddHistoryField(?Pro:Kla_sa,3)
  SELF.AddHistoryField(?Pro:UrBr,4)
  SELF.AddHistoryField(?Pro:Datum,5)
  SELF.AddHistoryField(?Pro:Oib,6)
  SELF.AddUpdateFile(Access:Promjena)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Promjena.SetOpenRelated()
  Relate:Promjena.Open                                     ! File Promjena used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Promjena
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
  BRW11.Init(?List,Queue:Browse.ViewPosition,BRW11::View:Browse,Queue:Browse,Relate:Stavka_promjene,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?Pro:Sif_promjene{PROP:ReadOnly} = True
    ?Pro:Sifra_vrste_promjene{PROP:ReadOnly} = True
    ?Pro:Kla_sa{PROP:ReadOnly} = True
    ?Pro:UrBr{PROP:ReadOnly} = True
    ?Pro:Datum{PROP:ReadOnly} = True
    ?Pro:Oib{PROP:ReadOnly} = True
    DISABLE(?Calendar)
    DISABLE(?CallLookup)
    ?Uce:Ime{PROP:ReadOnly} = True
    ?Uce:Prezime{PROP:ReadOnly} = True
    DISABLE(?CallLookup:2)
    ?Vrs:Naziv_promjene_ispita{PROP:ReadOnly} = True
    DISABLE(?Insert)
    DISABLE(?Change)
    DISABLE(?Delete)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW11.Q &= Queue:Browse
  BRW11.AddSortOrder(,Sta:PK_Stavka_promjene)              ! Add the sort order for Sta:PK_Stavka_promjene for sort order 1
  BRW11.AddRange(Sta:Sif_promjene,Relate:Stavka_promjene,Relate:Promjena) ! Add file relationship range limit for sort order 1
  BRW11.AddLocator(BRW11::Sort0:Locator)                   ! Browse has a locator for sort order 1
  BRW11::Sort0:Locator.Init(,Sta:Sif_predmeta_o,1,BRW11)   ! Initialize the browse locator using  using key: Sta:PK_Stavka_promjene , Sta:Sif_predmeta_o
  BRW11.AddField(Pre:Naziv_predmeta_o,BRW11.Q.Pre:Naziv_predmeta_o) ! Field Pre:Naziv_predmeta_o is a hot field or requires assignment from browse
  BRW11.AddField(Pre1:Naziv_predmeta_p,BRW11.Q.Pre1:Naziv_predmeta_p) ! Field Pre1:Naziv_predmeta_p is a hot field or requires assignment from browse
  BRW11.AddField(Sta:Sif_promjene,BRW11.Q.Sta:Sif_promjene) ! Field Sta:Sif_promjene is a hot field or requires assignment from browse
  BRW11.AddField(Sta:Sif_predmeta_o,BRW11.Q.Sta:Sif_predmeta_o) ! Field Sta:Sif_predmeta_o is a hot field or requires assignment from browse
  BRW11.AddField(Sta:Sif_predmeta_p,BRW11.Q.Sta:Sif_predmeta_p) ! Field Sta:Sif_predmeta_p is a hot field or requires assignment from browse
  BRW11.AddField(Pre:Sif_predmeta_o,BRW11.Q.Pre:Sif_predmeta_o) ! Field Pre:Sif_predmeta_o is a hot field or requires assignment from browse
  BRW11.AddField(Pre1:Sif_predmeta_p,BRW11.Q.Pre1:Sif_predmeta_p) ! Field Pre1:Sif_predmeta_p is a hot field or requires assignment from browse
  INIMgr.Fetch('UpdatePromjena',QuickWindow)               ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  ToolBarForm.HelpButton=?Help
  SELF.AddItem(ToolbarForm)
  BRW11.AskProcedure = 3
  BRW11.AddToolbarTarget(Toolbar)                          ! Browse accepts toolbar control
  BRW11.ToolbarItem.HelpButton = ?Help
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Promjena.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdatePromjena',QuickWindow)            ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  Uce:Oib = Pro:Oib                                        ! Assign linking field value
  Access:Ucenik.Fetch(Uce:PK_Ucenik)
  Vrs:Sifra_vrste_promjene = Pro:Sifra_vrste_promjene      ! Assign linking field value
  Access:Vrsta_promjene_ispita.Fetch(Vrs:PK_Vrsta_promjene_ispita)
  PARENT.Reset(Force)


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    EXECUTE Number
      SelectVrsta_promjene_ispita
      SelectUcenik
      UpdateStavka_promjene
    END
    ReturnValue = GlobalResponse
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
    OF ?Calendar
      ThisWindow.Update
      Calendar8.SelectOnClose = True
      Calendar8.Ask('Select a Date',Pro:Datum)
      IF Calendar8.Response = RequestCompleted THEN
      Pro:Datum=Calendar8.SelectedDate
      DISPLAY(?Pro:Datum)
      END
      ThisWindow.Reset(True)
    OF ?CallLookup
      ThisWindow.Update
      Uce:Oib = Pro:Oib
      IF SELF.Run(2,SelectRecord) = RequestCompleted       ! Call lookup procedure and verify RequestCompleted
        Pro:Oib = Uce:Oib
      END
      ThisWindow.Reset(1)
    OF ?CallLookup:2
      ThisWindow.Update
      Vrs:Sifra_vrste_promjene = Pro:Sifra_vrste_promjene
      IF SELF.Run(1,SelectRecord) = RequestCompleted       ! Call lookup procedure and verify RequestCompleted
        Pro:Sifra_vrste_promjene = Vrs:Sifra_vrste_promjene
      END
      ThisWindow.Reset(1)
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


ThisWindow.TakeSelected PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all Selected events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeSelected()
    CASE FIELD()
    OF ?Pro:Sifra_vrste_promjene
      Vrs:Sifra_vrste_promjene = Pro:Sifra_vrste_promjene
      IF Access:Vrsta_promjene_ispita.TryFetch(Vrs:PK_Vrsta_promjene_ispita)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          Pro:Sifra_vrste_promjene = Vrs:Sifra_vrste_promjene
        END
      END
      ThisWindow.Reset
    OF ?Pro:Oib
      Uce:Oib = Pro:Oib
      IF Access:Ucenik.TryFetch(Uce:PK_Ucenik)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          Pro:Oib = Uce:Oib
        END
      END
      ThisWindow.Reset
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window


BRW11.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END

!!! <summary>
!!! Generated from procedure template - Window
!!! Select a Promjena Record
!!! </summary>
SelectPromjena PROCEDURE 

CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(Promjena)
                       PROJECT(Pro:Sif_promjene)
                       PROJECT(Pro:Sifra_vrste_promjene)
                       PROJECT(Pro:Kla_sa)
                       PROJECT(Pro:UrBr)
                       PROJECT(Pro:Datum)
                       PROJECT(Pro:Oib)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Pro:Sif_promjene       LIKE(Pro:Sif_promjene)         !List box control field - type derived from field
Pro:Sifra_vrste_promjene LIKE(Pro:Sifra_vrste_promjene) !List box control field - type derived from field
Pro:Kla_sa             LIKE(Pro:Kla_sa)               !List box control field - type derived from field
Pro:UrBr               LIKE(Pro:UrBr)                 !List box control field - type derived from field
Pro:Datum              LIKE(Pro:Datum)                !List box control field - type derived from field
Pro:Oib                LIKE(Pro:Oib)                  !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a Promjena Record'),AT(,,358,198),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('SelectPromjena'),SYSTEM
                       LIST,AT(8,30,342,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~Sif promjene~C(0)@n-14@8' & |
  '0R(4)|M~Sifra vrste promjene~C(0)@n-14@80L(2)|M~Kla sa~L(2)@K###-##/##-##/#K@80L(2)|' & |
  'M~Ur Br~L(2)@K####-##-##-###K@80R(2)|M~Datum~C(0)@D06.@64L(2)|M~Oib~L(2)@s15@'),FROM(Queue:Browse:1), |
  IMM,MSG('Browsing the Promjena file')
                       BUTTON('&Select'),AT(301,158,49,14),USE(?Select:2),LEFT,ICON('WASELECT.ICO'),FLAT,MSG('Select the Record'), |
  TIP('Select the Record')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('&1) PK_Promjena'),USE(?Tab:2)
                         END
                         TAB('&2) VK_Vrsta_promjene_ispita'),USE(?Tab:3)
                         END
                         TAB('&3) VK_Ucenik'),USE(?Tab:4)
                         END
                       END
                       BUTTON('&Close'),AT(252,180,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(305,180,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort0:StepClass StepLongClass                        ! Default Step Manager
BRW1::Sort1:StepClass StepLongClass                        ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
BRW1::Sort2:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 3
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('SelectPromjena')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:Promjena.SetOpenRelated()
  Relate:Promjena.Open                                     ! File Promjena used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Promjena,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon Pro:Sifra_vrste_promjene for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,Pro:VK_Vrsta_promjene_ispita) ! Add the sort order for Pro:VK_Vrsta_promjene_ispita for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,Pro:Sifra_vrste_promjene,1,BRW1) ! Initialize the browse locator using  using key: Pro:VK_Vrsta_promjene_ispita , Pro:Sifra_vrste_promjene
  BRW1::Sort2:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon Pro:Oib for sort order 2
  BRW1.AddSortOrder(BRW1::Sort2:StepClass,Pro:VK_Ucenik)   ! Add the sort order for Pro:VK_Ucenik for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,Pro:Oib,1,BRW1)                ! Initialize the browse locator using  using key: Pro:VK_Ucenik , Pro:Oib
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon Pro:Sif_promjene for sort order 3
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,Pro:PK_Promjena) ! Add the sort order for Pro:PK_Promjena for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(,Pro:Sif_promjene,1,BRW1)       ! Initialize the browse locator using  using key: Pro:PK_Promjena , Pro:Sif_promjene
  BRW1.AddField(Pro:Sif_promjene,BRW1.Q.Pro:Sif_promjene)  ! Field Pro:Sif_promjene is a hot field or requires assignment from browse
  BRW1.AddField(Pro:Sifra_vrste_promjene,BRW1.Q.Pro:Sifra_vrste_promjene) ! Field Pro:Sifra_vrste_promjene is a hot field or requires assignment from browse
  BRW1.AddField(Pro:Kla_sa,BRW1.Q.Pro:Kla_sa)              ! Field Pro:Kla_sa is a hot field or requires assignment from browse
  BRW1.AddField(Pro:UrBr,BRW1.Q.Pro:UrBr)                  ! Field Pro:UrBr is a hot field or requires assignment from browse
  BRW1.AddField(Pro:Datum,BRW1.Q.Pro:Datum)                ! Field Pro:Datum is a hot field or requires assignment from browse
  BRW1.AddField(Pro:Oib,BRW1.Q.Pro:Oib)                    ! Field Pro:Oib is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectPromjena',QuickWindow)               ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Promjena.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectPromjena',QuickWindow)            ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSE
    RETURN SELF.SetSort(3,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Select a Predmet_prijava Record
!!! </summary>
SelectPredmet_prijava PROCEDURE 

CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(Predmet_prijava)
                       PROJECT(Pre1:Naziv_predmeta_p)
                       PROJECT(Pre1:Sif_predmeta_p)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Pre1:Naziv_predmeta_p  LIKE(Pre1:Naziv_predmeta_p)    !List box control field - type derived from field
Pre1:Sif_predmeta_p    LIKE(Pre1:Sif_predmeta_p)      !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Predmeti/ispiti'),AT(,,417,272),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('SelectPredmet_prijava'),SYSTEM
                       LIST,AT(8,30,397,195),USE(?Browse:1),VSCROLL,FORMAT('80L(5)|M~Naziv predmeta~@s50@'),FROM(Queue:Browse:1), |
  IMM,MSG('Browsing the Predmet_prijava file')
                       BUTTON('Odaberi'),AT(356,230,49,14),USE(?Select:2),LEFT,ICON('WASELECT.ICO'),FLAT,MSG('Select the Record'), |
  TIP('Select the Record')
                       SHEET,AT(4,4,411,249),USE(?CurrentTab)
                         TAB('Popis predmeta'),USE(?Tab:2)
                         END
                       END
                       BUTTON('Zatvori'),AT(312,256,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(247,257,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),DISABLE,FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort0:StepClass StepLongClass                        ! Default Step Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('SelectPredmet_prijava')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:Predmet_prijava.Open                              ! File Predmet_prijava used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Predmet_prijava,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon Pre1:Sif_predmeta_p for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,Pre1:PK_Predmet_prijava) ! Add the sort order for Pre1:PK_Predmet_prijava for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,Pre1:Sif_predmeta_p,1,BRW1)    ! Initialize the browse locator using  using key: Pre1:PK_Predmet_prijava , Pre1:Sif_predmeta_p
  BRW1.AddField(Pre1:Naziv_predmeta_p,BRW1.Q.Pre1:Naziv_predmeta_p) ! Field Pre1:Naziv_predmeta_p is a hot field or requires assignment from browse
  BRW1.AddField(Pre1:Sif_predmeta_p,BRW1.Q.Pre1:Sif_predmeta_p) ! Field Pre1:Sif_predmeta_p is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectPredmet_prijava',QuickWindow)        ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Predmet_prijava.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectPredmet_prijava',QuickWindow)     ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Form Stavka_promjene
!!! </summary>
UpdateStavka_promjene PROCEDURE 

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
History::Sta:Record  LIKE(Sta:RECORD),THREAD
QuickWindow          WINDOW('Stavka promjene'),AT(,,523,344),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdateStavka_promjene'),SYSTEM
                       SHEET,AT(4,4,515,321),USE(?CurrentTab)
                         TAB('Stavka promjene'),USE(?Tab:1)
                           PROMPT('Sif promjene:'),AT(371,27),USE(?Sta:Sif_promjene:Prompt),DISABLE,HIDE,TRN
                           ENTRY(@n-14),AT(435,27,64,10),USE(Sta:Sif_promjene),RIGHT(1),DISABLE,HIDE
                           PROMPT('Predmet za odjaviti:'),AT(11,28),USE(?Sta:Sif_predmeta_o:Prompt),TRN
                           ENTRY(@n-14),AT(89,28,64,10),USE(Sta:Sif_predmeta_o),RIGHT(1)
                           PROMPT('Predmet za prijaviti:'),AT(11,47),USE(?Sta:Sif_predmeta_p:Prompt),TRN
                           ENTRY(@n-14),AT(89,46,64,10),USE(Sta:Sif_predmeta_p),RIGHT(1)
                           BUTTON('...'),AT(158,26,12,12),USE(?CallLookup)
                           ENTRY(@s50),AT(175,27),USE(Pre:Naziv_predmeta_o)
                           BUTTON('...'),AT(158,44,12,12),USE(?CallLookup:2)
                           ENTRY(@s50),AT(175,45),USE(Pre1:Naziv_predmeta_p)
                         END
                       END
                       BUTTON('Potvrdi'),AT(413,327,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('Odustani'),AT(467,327,55,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       BUTTON('&Help'),AT(265,329,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),DISABLE,FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeSelected           PROCEDURE(),BYTE,PROC,DERIVED
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
  GlobalErrors.SetProcedureName('UpdateStavka_promjene')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Sta:Sif_promjene:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Sta:Record,History::Sta:Record)
  SELF.AddHistoryField(?Sta:Sif_promjene,1)
  SELF.AddHistoryField(?Sta:Sif_predmeta_o,2)
  SELF.AddHistoryField(?Sta:Sif_predmeta_p,3)
  SELF.AddUpdateFile(Access:Stavka_promjene)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Stavka_promjene.SetOpenRelated()
  Relate:Stavka_promjene.Open                              ! File Stavka_promjene used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Stavka_promjene
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
    ?Sta:Sif_promjene{PROP:ReadOnly} = True
    ?Sta:Sif_predmeta_o{PROP:ReadOnly} = True
    ?Sta:Sif_predmeta_p{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?Pre:Naziv_predmeta_o{PROP:ReadOnly} = True
    DISABLE(?CallLookup:2)
    ?Pre1:Naziv_predmeta_p{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateStavka_promjene',QuickWindow)        ! Restore window settings from non-volatile store
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
    Relate:Stavka_promjene.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateStavka_promjene',QuickWindow)     ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  Pre:Sif_predmeta_o = Sta:Sif_predmeta_o                  ! Assign linking field value
  Access:Predmet_odjava.Fetch(Pre:PK_Predmet_odjava)
  Pre1:Sif_predmeta_p = Sta:Sif_predmeta_p                 ! Assign linking field value
  Access:Predmet_prijava.Fetch(Pre1:PK_Predmet_prijava)
  PARENT.Reset(Force)


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    EXECUTE Number
      SelectPredmet_odjava
      SelectPredmet_prijava
    END
    ReturnValue = GlobalResponse
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
    OF ?CallLookup
      ThisWindow.Update
      Pre:Sif_predmeta_o = Sta:Sif_predmeta_o
      IF SELF.Run(1,SelectRecord) = RequestCompleted       ! Call lookup procedure and verify RequestCompleted
        Sta:Sif_predmeta_o = Pre:Sif_predmeta_o
      END
      ThisWindow.Reset(1)
    OF ?CallLookup:2
      ThisWindow.Update
      Pre1:Sif_predmeta_p = Sta:Sif_predmeta_p
      IF SELF.Run(2,SelectRecord) = RequestCompleted       ! Call lookup procedure and verify RequestCompleted
        Sta:Sif_predmeta_p = Pre1:Sif_predmeta_p
      END
      ThisWindow.Reset(1)
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


ThisWindow.TakeSelected PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all Selected events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeSelected()
    CASE FIELD()
    OF ?Sta:Sif_predmeta_o
      Pre:Sif_predmeta_o = Sta:Sif_predmeta_o
      IF Access:Predmet_odjava.TryFetch(Pre:PK_Predmet_odjava)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          Sta:Sif_predmeta_o = Pre:Sif_predmeta_o
        END
      END
      ThisWindow.Reset
    OF ?Sta:Sif_predmeta_p
      Pre1:Sif_predmeta_p = Sta:Sif_predmeta_p
      IF Access:Predmet_prijava.TryFetch(Pre1:PK_Predmet_prijava)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          Sta:Sif_predmeta_p = Pre1:Sif_predmeta_p
        END
      END
      ThisWindow.Reset
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
!!! Generated from procedure template - Window
!!! Select a Ispitni_rok Record
!!! </summary>
SelectIspitni_rok PROCEDURE 

CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(Ispitni_rok)
                       PROJECT(Isp:Naziv_ispitnog_roka_dativ)
                       PROJECT(Isp:Sifra_ispitnog_roka)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Isp:Naziv_ispitnog_roka_dativ LIKE(Isp:Naziv_ispitnog_roka_dativ) !List box control field - type derived from field
Isp:Sifra_ispitnog_roka LIKE(Isp:Sifra_ispitnog_roka) !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Odabir ispitnog roka'),AT(,,416,271),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('SelectIspitni_rok'),SYSTEM
                       LIST,AT(8,30,395,194),USE(?Browse:1),FORMAT('80L(5)|M~Ispitni rok~@s29@'),FROM(Queue:Browse:1), |
  IMM,MSG('Browsing the Ispitni_rok file')
                       BUTTON('Odaberi'),AT(354,229,49,14),USE(?Select:2),LEFT,ICON('WASELECT.ICO'),FLAT,MSG('Select the Record'), |
  TIP('Select the Record')
                       SHEET,AT(4,4,410,247),USE(?CurrentTab)
                         TAB('Popis rokova'),USE(?Tab:2)
                         END
                       END
                       BUTTON('Zatvori'),AT(354,255,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(225,252,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),DISABLE,FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort0:StepClass StepClass                            ! Default Step Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('SelectIspitni_rok')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:Ispitni_rok.Open                                  ! File Ispitni_rok used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Ispitni_rok,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,Isp:PK_Ispitni_rok)                   ! Add the sort order for Isp:PK_Ispitni_rok for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,Isp:Sifra_ispitnog_roka,1,BRW1) ! Initialize the browse locator using  using key: Isp:PK_Ispitni_rok , Isp:Sifra_ispitnog_roka
  BRW1.AddField(Isp:Naziv_ispitnog_roka_dativ,BRW1.Q.Isp:Naziv_ispitnog_roka_dativ) ! Field Isp:Naziv_ispitnog_roka_dativ is a hot field or requires assignment from browse
  BRW1.AddField(Isp:Sifra_ispitnog_roka,BRW1.Q.Isp:Sifra_ispitnog_roka) ! Field Isp:Sifra_ispitnog_roka is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectIspitni_rok',QuickWindow)            ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Ispitni_rok.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectIspitni_rok',QuickWindow)         ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Select a Razlog_izostanka Record
!!! </summary>
SelectRazlog_izostanka PROCEDURE 

CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(Razlog_izostanka)
                       PROJECT(Raz:Razlog)
                       PROJECT(Raz:Sifra_razloga)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Raz:Razlog             LIKE(Raz:Razlog)               !List box control field - type derived from field
Raz:Sifra_razloga      LIKE(Raz:Sifra_razloga)        !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Odabir razloga izostanka'),AT(,,416,271),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('SelectRazlog_izostanka'),SYSTEM
                       LIST,AT(8,30,396,194),USE(?Browse:1),FORMAT('80L(5)|M~Razlog izostanka~@s50@'),FROM(Queue:Browse:1), |
  IMM,MSG('Browsing the Razlog_izostanka file')
                       BUTTON('Odaberi'),AT(355,229,49,14),USE(?Select:2),LEFT,ICON('WASELECT.ICO'),FLAT,MSG('Select the Record'), |
  TIP('Select the Record')
                       SHEET,AT(4,4,410,248),USE(?CurrentTab)
                         TAB('Popis razloga'),USE(?Tab:2)
                         END
                       END
                       BUTTON('Zatvori'),AT(355,254,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(223,254,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),DISABLE,FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort0:StepClass StepClass                            ! Default Step Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('SelectRazlog_izostanka')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:Razlog_izostanka.Open                             ! File Razlog_izostanka used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Razlog_izostanka,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,Raz:PK_Razlog_izostanka)              ! Add the sort order for Raz:PK_Razlog_izostanka for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,Raz:Sifra_razloga,1,BRW1)      ! Initialize the browse locator using  using key: Raz:PK_Razlog_izostanka , Raz:Sifra_razloga
  BRW1.AddField(Raz:Razlog,BRW1.Q.Raz:Razlog)              ! Field Raz:Razlog is a hot field or requires assignment from browse
  BRW1.AddField(Raz:Sifra_razloga,BRW1.Q.Raz:Sifra_razloga) ! Field Raz:Sifra_razloga is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectRazlog_izostanka',QuickWindow)       ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Razlog_izostanka.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectRazlog_izostanka',QuickWindow)    ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Form Izostanak
!!! </summary>
UpdateIzostanak PROCEDURE 

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
History::Opr:Record  LIKE(Opr:RECORD),THREAD
QuickWindow          WINDOW('Izostanak uèenika'),AT(,,524,345),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdateIzostanak'),SYSTEM
                       SHEET,AT(4,4,518,321),USE(?CurrentTab)
                         TAB('Unos/izmjena'),USE(?Tab:1)
                           PROMPT('<138>ifra  izostanka:'),AT(8,25,,11),USE(?Opr:Sifra_izostanka:Prompt),TRN
                           ENTRY(@n-14),AT(92,25,64,10),USE(Opr:Sifra_izostanka),RIGHT(1),DISABLE,READONLY
                           PROMPT('Klasa:'),AT(8,40,,11),USE(?Opr:K__lasa:Prompt),TRN
                           ENTRY(@K###-##/##-##/##K),AT(92,39,104,10),USE(Opr:K__lasa)
                           PROMPT('Urud<158>beni broj:'),AT(8,54,,11),USE(?Opr:Urbr:Prompt),TRN
                           ENTRY(@K####-##-##-###K),AT(92,55,104,10),USE(Opr:Urbr)
                           PROMPT('Datum:'),AT(8,69,,11),USE(?Opr:Datum:Prompt),TRN
                           ENTRY(@D06.),AT(92,70,104,10),USE(Opr:Datum)
                           PROMPT('Datum polaganja ispita:'),AT(8,103,,11),USE(?Opr:Datum_ispita:Prompt),TRN
                           ENTRY(@D06.),AT(92,104,104,10),USE(Opr:Datum_ispita)
                           PROMPT('Uèenik:'),AT(8,118,,11),USE(?Opr:Oib:Prompt),TRN
                           ENTRY(@s15),AT(92,119,64,10),USE(Opr:Oib)
                           PROMPT('Ispitni rok:'),AT(8,167,,11),USE(?Opr:Sif_ispitnog_roka:Prompt),TRN
                           ENTRY(@n-14),AT(92,167,64,10),USE(Opr:Sif_ispitnog_roka),RIGHT(1)
                           PROMPT('Ispit:'),AT(8,180,,11),USE(?Opr:Sifra_predmeta_o:Prompt),TRN
                           ENTRY(@n-14),AT(92,183,64,10),USE(Opr:Sifra_predmeta_o),RIGHT(1)
                           PROMPT('Razlog izostanka:'),AT(8,207,,11),USE(?Opr:Sif_razloga:Prompt),TRN
                           ENTRY(@n-14),AT(91,207,64,10),USE(Opr:Sif_razloga),RIGHT(1)
                           BUTTON('...'),AT(201,68,12,12),USE(?Calendar)
                           BUTTON('...'),AT(201,103,12,12),USE(?Calendar:2)
                           BUTTON('...'),AT(161,117,12,12),USE(?CallLookup)
                           ENTRY(@s50),AT(183,119),USE(Uce:Ime),DISABLE,READONLY
                           ENTRY(@s70),AT(183,136),USE(Uce:Prezime),DISABLE,READONLY
                           BUTTON('...'),AT(160,165,12,12),USE(?CallLookup:2)
                           ENTRY(@s29),AT(183,166),USE(Isp:Naziv_ispitnog_roka_dativ),DISABLE,READONLY
                           BUTTON('...'),AT(160,182,12,12),USE(?CallLookup:3)
                           ENTRY(@s50),AT(183,182),USE(Pre:Naziv_predmeta_o),DISABLE,READONLY
                           BUTTON('...'),AT(160,206,12,12),USE(?CallLookup:4)
                           ENTRY(@s50),AT(183,206),USE(Raz:Razlog),DISABLE,READONLY
                         END
                       END
                       BUTTON('Potvrdi'),AT(414,329,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('Odustani'),AT(467,329,53,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       BUTTON('&Help'),AT(91,329,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),DISABLE,FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeSelected           PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Calendar8            CalendarClass
Calendar9            CalendarClass
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
  GlobalErrors.SetProcedureName('UpdateIzostanak')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Opr:Sifra_izostanka:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Opr:Record,History::Opr:Record)
  SELF.AddHistoryField(?Opr:Sifra_izostanka,1)
  SELF.AddHistoryField(?Opr:K__lasa,2)
  SELF.AddHistoryField(?Opr:Urbr,3)
  SELF.AddHistoryField(?Opr:Datum,4)
  SELF.AddHistoryField(?Opr:Datum_ispita,5)
  SELF.AddHistoryField(?Opr:Oib,6)
  SELF.AddHistoryField(?Opr:Sif_ispitnog_roka,7)
  SELF.AddHistoryField(?Opr:Sifra_predmeta_o,8)
  SELF.AddHistoryField(?Opr:Sif_razloga,9)
  SELF.AddUpdateFile(Access:Izostanak)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Izostanak.Open                                    ! File Izostanak used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Izostanak
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
    ?Opr:Sifra_izostanka{PROP:ReadOnly} = True
    ?Opr:K__lasa{PROP:ReadOnly} = True
    ?Opr:Urbr{PROP:ReadOnly} = True
    ?Opr:Datum{PROP:ReadOnly} = True
    ?Opr:Datum_ispita{PROP:ReadOnly} = True
    ?Opr:Oib{PROP:ReadOnly} = True
    ?Opr:Sif_ispitnog_roka{PROP:ReadOnly} = True
    ?Opr:Sifra_predmeta_o{PROP:ReadOnly} = True
    ?Opr:Sif_razloga{PROP:ReadOnly} = True
    DISABLE(?Calendar)
    DISABLE(?Calendar:2)
    DISABLE(?CallLookup)
    ?Uce:Ime{PROP:ReadOnly} = True
    ?Uce:Prezime{PROP:ReadOnly} = True
    DISABLE(?CallLookup:2)
    ?Isp:Naziv_ispitnog_roka_dativ{PROP:ReadOnly} = True
    DISABLE(?CallLookup:3)
    ?Pre:Naziv_predmeta_o{PROP:ReadOnly} = True
    DISABLE(?CallLookup:4)
    ?Raz:Razlog{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateIzostanak',QuickWindow)              ! Restore window settings from non-volatile store
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
    Relate:Izostanak.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateIzostanak',QuickWindow)           ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  Uce:Oib = Opr:Oib                                        ! Assign linking field value
  Access:Ucenik.Fetch(Uce:PK_Ucenik)
  Isp:Sifra_ispitnog_roka = Opr:Sif_ispitnog_roka          ! Assign linking field value
  Access:Ispitni_rok.Fetch(Isp:PK_Ispitni_rok)
  Pre:Sif_predmeta_o = Opr:Sifra_predmeta_o                ! Assign linking field value
  Access:Predmet_odjava.Fetch(Pre:PK_Predmet_odjava)
  Raz:Sifra_razloga = Opr:Sif_razloga                      ! Assign linking field value
  Access:Razlog_izostanka.Fetch(Raz:PK_Razlog_izostanka)
  PARENT.Reset(Force)


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    EXECUTE Number
      SelectUcenik
      SelectIspitni_rok
      SelectPredmet_odjava
      SelectRazlog_izostanka
    END
    ReturnValue = GlobalResponse
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
    OF ?Calendar
      ThisWindow.Update
      Calendar8.SelectOnClose = True
      Calendar8.Ask('Select a Date',Opr:Datum)
      IF Calendar8.Response = RequestCompleted THEN
      Opr:Datum=Calendar8.SelectedDate
      DISPLAY(?Opr:Datum)
      END
      ThisWindow.Reset(True)
    OF ?Calendar:2
      ThisWindow.Update
      Calendar9.SelectOnClose = True
      Calendar9.Ask('Select a Date',Opr:Datum_ispita)
      IF Calendar9.Response = RequestCompleted THEN
      Opr:Datum_ispita=Calendar9.SelectedDate
      DISPLAY(?Opr:Datum_ispita)
      END
      ThisWindow.Reset(True)
    OF ?CallLookup
      ThisWindow.Update
      Uce:Oib = Opr:Oib
      IF SELF.Run(1,SelectRecord) = RequestCompleted       ! Call lookup procedure and verify RequestCompleted
        Opr:Oib = Uce:Oib
      END
      ThisWindow.Reset(1)
    OF ?CallLookup:2
      ThisWindow.Update
      Isp:Sifra_ispitnog_roka = Opr:Sif_ispitnog_roka
      IF SELF.Run(2,SelectRecord) = RequestCompleted       ! Call lookup procedure and verify RequestCompleted
        Opr:Sif_ispitnog_roka = Isp:Sifra_ispitnog_roka
      END
      ThisWindow.Reset(1)
    OF ?CallLookup:3
      ThisWindow.Update
      Pre:Sif_predmeta_o = Opr:Sifra_predmeta_o
      IF SELF.Run(3,SelectRecord) = RequestCompleted       ! Call lookup procedure and verify RequestCompleted
        Opr:Sifra_predmeta_o = Pre:Sif_predmeta_o
      END
      ThisWindow.Reset(1)
    OF ?CallLookup:4
      ThisWindow.Update
      Raz:Sifra_razloga = Opr:Sif_razloga
      IF SELF.Run(4,SelectRecord) = RequestCompleted       ! Call lookup procedure and verify RequestCompleted
        Opr:Sif_razloga = Raz:Sifra_razloga
      END
      ThisWindow.Reset(1)
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


ThisWindow.TakeSelected PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all Selected events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeSelected()
    CASE FIELD()
    OF ?Opr:Oib
      Uce:Oib = Opr:Oib
      IF Access:Ucenik.TryFetch(Uce:PK_Ucenik)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          Opr:Oib = Uce:Oib
        END
      END
      ThisWindow.Reset
    OF ?Opr:Sif_ispitnog_roka
      Isp:Sifra_ispitnog_roka = Opr:Sif_ispitnog_roka
      IF Access:Ispitni_rok.TryFetch(Isp:PK_Ispitni_rok)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          Opr:Sif_ispitnog_roka = Isp:Sifra_ispitnog_roka
        END
      END
      ThisWindow.Reset
    OF ?Opr:Sifra_predmeta_o
      Pre:Sif_predmeta_o = Opr:Sifra_predmeta_o
      IF Access:Predmet_odjava.TryFetch(Pre:PK_Predmet_odjava)
        IF SELF.Run(3,SelectRecord) = RequestCompleted
          Opr:Sifra_predmeta_o = Pre:Sif_predmeta_o
        END
      END
      ThisWindow.Reset
    OF ?Opr:Sif_razloga
      Raz:Sifra_razloga = Opr:Sif_razloga
      IF Access:Razlog_izostanka.TryFetch(Raz:PK_Razlog_izostanka)
        IF SELF.Run(4,SelectRecord) = RequestCompleted
          Opr:Sif_razloga = Raz:Sifra_razloga
        END
      END
      ThisWindow.Reset
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
!!! Generated from procedure template - Window
!!! Form Ispitni_rok
!!! </summary>
UpdateIspitni_rok PROCEDURE 

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
History::Isp:Record  LIKE(Isp:RECORD),THREAD
QuickWindow          WINDOW('Ispitni rok'),AT(,,417,274),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdateIspitni_rok'),SYSTEM
                       SHEET,AT(4,4,410,249),USE(?CurrentTab)
                         TAB('Unos/izmjena'),USE(?Tab:1)
                           PROMPT('<138>ifra roka:'),AT(12,30),USE(?Isp:Sifra_ispitnog_roka:Prompt),TRN
                           ENTRY(@n-14),AT(82,30,64,10),USE(Isp:Sifra_ispitnog_roka),RIGHT(1),READONLY
                           PROMPT('Naziv ispitnog roka:'),AT(12,44),USE(?Isp:Naziv_ispitnog_roka_dativ:Prompt),TRN
                           ENTRY(@s29),AT(82,44,120,10),USE(Isp:Naziv_ispitnog_roka_dativ)
                         END
                       END
                       BUTTON('Potvrdi'),AT(309,257,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('Odustani'),AT(357,257,55,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       BUTTON('&Help'),AT(153,255,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),DISABLE,FLAT,HIDE,MSG('See Help Window'), |
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
  GlobalErrors.SetProcedureName('UpdateIspitni_rok')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Isp:Sifra_ispitnog_roka:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Isp:Record,History::Isp:Record)
  SELF.AddHistoryField(?Isp:Sifra_ispitnog_roka,1)
  SELF.AddHistoryField(?Isp:Naziv_ispitnog_roka_dativ,2)
  SELF.AddUpdateFile(Access:Ispitni_rok)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Ispitni_rok.Open                                  ! File Ispitni_rok used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Ispitni_rok
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
    ?Isp:Sifra_ispitnog_roka{PROP:ReadOnly} = True
    ?Isp:Naziv_ispitnog_roka_dativ{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateIspitni_rok',QuickWindow)            ! Restore window settings from non-volatile store
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
    Relate:Ispitni_rok.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateIspitni_rok',QuickWindow)         ! Save window data to non-volatile store
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
!!! Generated from procedure template - Window
!!! Form Razlog_izostanka
!!! </summary>
UpdateRazlog_izostanka PROCEDURE 

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
History::Raz:Record  LIKE(Raz:RECORD),THREAD
QuickWindow          WINDOW('Razlog izostanka'),AT(,,415,183),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdateRazlog_izostanka'),SYSTEM
                       SHEET,AT(4,4,409,159),USE(?CurrentTab)
                         TAB('Unos/izmjena'),USE(?Tab:1)
                           PROMPT('<138>ifra razloga:'),AT(12,25),USE(?Raz:Sifra_razloga:Prompt),TRN
                           ENTRY(@n-14),AT(74,26,64,10),USE(Raz:Sifra_razloga),RIGHT(1),DISABLE,READONLY
                           PROMPT('Razlog izostanka:'),AT(12,39),USE(?Raz:Razlog:Prompt),TRN
                           ENTRY(@s50),AT(74,39,204,10),USE(Raz:Razlog)
                         END
                       END
                       BUTTON('Potvrdi'),AT(307,167,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('Odustani'),AT(360,167,51,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       BUTTON('&Help'),AT(179,164,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),DISABLE,FLAT,HIDE,MSG('See Help Window'), |
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
  GlobalErrors.SetProcedureName('UpdateRazlog_izostanka')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Raz:Sifra_razloga:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Raz:Record,History::Raz:Record)
  SELF.AddHistoryField(?Raz:Sifra_razloga,1)
  SELF.AddHistoryField(?Raz:Razlog,2)
  SELF.AddUpdateFile(Access:Razlog_izostanka)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Razlog_izostanka.Open                             ! File Razlog_izostanka used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Razlog_izostanka
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
    ?Raz:Sifra_razloga{PROP:ReadOnly} = True
    ?Raz:Razlog{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateRazlog_izostanka',QuickWindow)       ! Restore window settings from non-volatile store
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
    Relate:Razlog_izostanka.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateRazlog_izostanka',QuickWindow)    ! Save window data to non-volatile store
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

