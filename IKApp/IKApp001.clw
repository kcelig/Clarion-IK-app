

   MEMBER('IKApp.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('IKAPP001.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('IKAPP002.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('IKAPP003.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('IKAPP004.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Frame
!!! Wizard Application for C:\Users\Kruno\Desktop\IK\IKDB.dct
!!! </summary>
Main PROCEDURE 

AppFrame             APPLICATION('Ispitni koordinator'),AT(,,505,318),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,ICON('WAFRAME.ICO'),MAX,STATUS(-1,80,120,45),SYSTEM,IMM
                       MENUBAR,USE(?Menubar)
                         MENU('&Postavke programa'),USE(?FileMenu)
                           ITEM('&Postavke pisaèa ...'),USE(?PrintSetup),FONT('Microsoft Sans Serif',8,,,CHARSET:EASTEUROPE), |
  MSG('Setup printer'),STD(STD:PrintSetup)
                           ITEM,USE(?SEPARATOR1),SEPARATOR
                           ITEM('Izlaz iz programa'),USE(?Exit),MSG('Exit this application'),STD(STD:Close)
                         END
                         MENU('&Uredi'),USE(?EditMenu)
                           ITEM('Isijeci'),USE(?Cut),MSG('Cut Selection To Clipboard'),STD(STD:Cut)
                           ITEM('Kopiraj'),USE(?Copy),MSG('Copy Selection To Clipboard'),STD(STD:Copy)
                           ITEM('Zalijepi'),USE(?Paste),MSG('Paste From Clipboard'),STD(STD:Paste)
                         END
                         MENU('&Evidencija'),USE(?BrowseMenu)
                           ITEM('Uèenici'),USE(?BrowseUcenik),FONT('Microsoft Sans Serif',8,,,CHARSET:EASTEUROPE),MSG('Browse Ucenik')
                           ITEM('Predmeti'),USE(?BrowsePredmet_odjava),MSG('Browse Predmet_odjava')
                           ITEM('Ispitni rok'),USE(?BrowseIspitni_rok),MSG('Browse Ispitni_rok')
                         END
                         MENU('Odjava'),USE(?WindowMenu),STD(STD:WindowList)
                           ITEM('Odjava ispita'),USE(?BrowseOdjava),MSG('Browse Odjava')
                         END
                         MENU('Promjena ispita'),USE(?MENU1)
                           ITEM('Promjena ispita'),USE(?BrowsePromjena),MSG('Browse Promjena')
                           ITEM('Vrsta promjene'),USE(?BrowseVrsta_promjene_ispita),MSG('Browse Vrsta_promjene_ispita')
                         END
                         MENU('Izostanak'),USE(?HelpMenu)
                           ITEM('Izostanak s ispita'),USE(?BrowseIzostanak),MSG('Browse Izostanak')
                           ITEM('Razlog izostanka'),USE(?BrowseRazlog_izostanka),MSG('Browse Razlog_izostanka')
                         END
                       END
                       TOOLBAR,AT(0,0,505,52),USE(?Toolbar)
                         BUTTON,AT(317,31,14,14),USE(?Toolbar:Top, Toolbar:Top),ICON('WAVCRFIRST.ICO'),DISABLE,FLAT, |
  HIDE,TIP('Go to the First Page')
                         BUTTON,AT(331,31,14,14),USE(?Toolbar:PageUp, Toolbar:PageUp),ICON('WAVCRPRIOR.ICO'),DISABLE, |
  FLAT,HIDE,TIP('Go to the Prior Page')
                         BUTTON,AT(345,31,14,14),USE(?Toolbar:Up, Toolbar:Up),ICON('WAVCRUP.ICO'),DISABLE,FLAT,HIDE, |
  TIP('Go to the Prior Record')
                         BUTTON,AT(359,31,14,14),USE(?Toolbar:Locate, Toolbar:Locate),ICON('WAFIND.ICO'),DISABLE,FLAT, |
  HIDE,TIP('Locate record')
                         BUTTON,AT(373,31,14,14),USE(?Toolbar:Down, Toolbar:Down),ICON('WAVCRDOWN.ICO'),DISABLE,FLAT, |
  HIDE,TIP('Go to the Next Record')
                         BUTTON,AT(387,31,14,14),USE(?Toolbar:PageDown, Toolbar:PageDown),ICON('WAVCRNEXT.ICO'),DISABLE, |
  FLAT,HIDE,TIP('Go to the Next Page')
                         BUTTON,AT(401,31,14,14),USE(?Toolbar:Bottom, Toolbar:Bottom),ICON('WAVCRLAST.ICO'),DISABLE, |
  FLAT,HIDE,TIP('Go to the Last Page')
                         BUTTON,AT(415,31,14,14),USE(?Toolbar:Select, Toolbar:Select),ICON('WAMARK.ICO'),DISABLE,FLAT, |
  HIDE,TIP('Select This Record')
                         BUTTON,AT(429,31,14,14),USE(?Toolbar:Insert, Toolbar:Insert),ICON('WAINSERT.ICO'),DISABLE, |
  FLAT,HIDE,TIP('Insert a New Record')
                         BUTTON,AT(443,31,14,14),USE(?Toolbar:Change, Toolbar:Change),ICON('WACHANGE.ICO'),DISABLE, |
  FLAT,HIDE,TIP('Edit This Record')
                         BUTTON,AT(457,31,14,14),USE(?Toolbar:Delete, Toolbar:Delete),ICON('WADELETE.ICO'),DISABLE, |
  FLAT,HIDE,TIP('Delete This Record')
                         BUTTON,AT(471,31,14,14),USE(?Toolbar:History, Toolbar:History),ICON('WADITTO.ICO'),DISABLE, |
  FLAT,HIDE,TIP('Previous value')
                         BUTTON,AT(485,31,14,14),USE(?Toolbar:Help, Toolbar:Help),ICON('WAVCRHELP.ICO'),DISABLE,FLAT, |
  HIDE,TIP('Get Help')
                         BUTTON('Uèenici'),AT(10,2,,43),USE(?BUTTON1),ICON(ICON:Pick),FLAT
                         BUTTON('Predmeti'),AT(53,2,39,43),USE(?BUTTON1:2),ICON(ICON:Thumbnail),FLAT
                         BUTTON('Odjava'),AT(95,2,39,43),USE(?BUTTON1:3),ICON(ICON:PrevPage),FLAT
                         BUTTON('Promjena'),AT(138,2,39,43),USE(?BUTTON1:4),ICON(ICON:NextPage),FLAT
                         BUTTON('Izostanci'),AT(181,2,39,43),USE(?BUTTON1:5),ICON(ICON:JumpPage),FLAT
                       END
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
Menu::Menubar ROUTINE                                      ! Code for menu items on ?Menubar
Menu::FileMenu ROUTINE                                     ! Code for menu items on ?FileMenu
Menu::EditMenu ROUTINE                                     ! Code for menu items on ?EditMenu
Menu::BrowseMenu ROUTINE                                   ! Code for menu items on ?BrowseMenu
  CASE ACCEPTED()
  OF ?BrowseUcenik
    START(BrowseUcenik, 050000)
  OF ?BrowsePredmet_odjava
    START(BrowsePredmet_odjava, 050000)
  OF ?BrowseIspitni_rok
    START(BrowseIspitni_rok, 050000)
  END
Menu::WindowMenu ROUTINE                                   ! Code for menu items on ?WindowMenu
  CASE ACCEPTED()
  OF ?BrowseOdjava
    START(BrowseOdjava, 050000)
  END
Menu::MENU1 ROUTINE                                        ! Code for menu items on ?MENU1
  CASE ACCEPTED()
  OF ?BrowsePromjena
    START(BrowsePromjena, 050000)
  OF ?BrowseVrsta_promjene_ispita
    START(BrowseVrsta_promjene_ispita, 050000)
  END
Menu::HelpMenu ROUTINE                                     ! Code for menu items on ?HelpMenu
  CASE ACCEPTED()
  OF ?BrowseIzostanak
    START(BrowseIzostanak, 050000)
  OF ?BrowseRazlog_izostanka
    START(BrowseRazlog_izostanka, 050000)
  END

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Main')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = 1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.Open(AppFrame)                                      ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Main',AppFrame)                            ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  COMPILE ('**CW7**',_VER_C70)
      AppFrame{PROP:TabBarVisible}  = False
  !**CW7**
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.Opened
    INIMgr.Update('Main',AppFrame)                         ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
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
    CASE ACCEPTED()
    OF ?Toolbar:Top
    OROF ?Toolbar:PageUp
    OROF ?Toolbar:Up
    OROF ?Toolbar:Locate
    OROF ?Toolbar:Down
    OROF ?Toolbar:PageDown
    OROF ?Toolbar:Bottom
    OROF ?Toolbar:Select
    OROF ?Toolbar:Insert
    OROF ?Toolbar:Change
    OROF ?Toolbar:Delete
    OROF ?Toolbar:History
    OROF ?Toolbar:Help
      IF SYSTEM{PROP:Active} <> THREAD()
        POST(EVENT:Accepted,ACCEPTED(),SYSTEM{Prop:Active} )
        CYCLE
      END
    ELSE
      DO Menu::Menubar                                     ! Process menu items on ?Menubar menu
      DO Menu::FileMenu                                    ! Process menu items on ?FileMenu menu
      DO Menu::EditMenu                                    ! Process menu items on ?EditMenu menu
      DO Menu::BrowseMenu                                  ! Process menu items on ?BrowseMenu menu
      DO Menu::WindowMenu                                  ! Process menu items on ?WindowMenu menu
      DO Menu::MENU1                                       ! Process menu items on ?MENU1 menu
      DO Menu::HelpMenu                                    ! Process menu items on ?HelpMenu menu
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?BUTTON1
      START(BrowseUcenik, 25000)
    OF ?BUTTON1:2
      START(BrowsePredmet_odjava, 25000)
    OF ?BUTTON1:3
      START(BrowseOdjava, 25000)
    OF ?BUTTON1:4
      START(BrowsePromjena, 25000)
    OF ?BUTTON1:5
      START(BrowseIzostanak, 25000)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Ucenik file
!!! </summary>
BrowseUcenik PROCEDURE 

CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(Ucenik)
                       PROJECT(Uce:Oib)
                       PROJECT(Uce:Prezime)
                       PROJECT(Uce:Ime)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Uce:Oib                LIKE(Uce:Oib)                  !List box control field - type derived from field
Uce:Prezime            LIKE(Uce:Prezime)              !List box control field - type derived from field
Uce:Ime                LIKE(Uce:Ime)                  !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Uèenici'),AT(,,417,272),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('BrowseUcenik'),SYSTEM
                       LIST,AT(8,30,397,196),USE(?Browse:1),VSCROLL,FORMAT('64L(5)|M~OIB~L(2)@s15@142L(5)|M~Pr' & |
  'ezime~L(2)@s70@80L(5)|M~Ime~L(2)@s50@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the U' & |
  'cenik file')
                       BUTTON('&View'),AT(198,230,49,14),USE(?View:2),LEFT,ICON('WAVIEW.ICO'),DISABLE,FLAT,HIDE,MSG('View Record'), |
  TIP('View Record')
                       BUTTON('Dodaj'),AT(251,230,49,14),USE(?Insert:3),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('Uredi'),AT(303,230,49,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT,MSG('Change the Record'), |
  TIP('Change the Record')
                       BUTTON('Obri<154>i'),AT(357,230,49,14),USE(?Delete:3),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       SHEET,AT(4,4,411,249),USE(?CurrentTab)
                         TAB('Popis uèenika'),USE(?Tab:2)
                         END
                       END
                       BUTTON('Zatvori'),AT(363,254,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(7,254,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),DISABLE,FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
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
  GlobalErrors.SetProcedureName('BrowseUcenik')
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
  Relate:Ucenik.SetOpenRelated()
  Relate:Ucenik.Open                                       ! File Ucenik used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Ucenik,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon Uce:Oib for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,Uce:PK_Ucenik)   ! Add the sort order for Uce:PK_Ucenik for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,Uce:Oib,1,BRW1)                ! Initialize the browse locator using  using key: Uce:PK_Ucenik , Uce:Oib
  BRW1.AddField(Uce:Oib,BRW1.Q.Uce:Oib)                    ! Field Uce:Oib is a hot field or requires assignment from browse
  BRW1.AddField(Uce:Prezime,BRW1.Q.Uce:Prezime)            ! Field Uce:Prezime is a hot field or requires assignment from browse
  BRW1.AddField(Uce:Ime,BRW1.Q.Uce:Ime)                    ! Field Uce:Ime is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseUcenik',QuickWindow)                 ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
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
    Relate:Ucenik.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseUcenik',QuickWindow)              ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdateUcenik
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Predmet_odjava file
!!! </summary>
BrowsePredmet_odjava PROCEDURE 

CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(Predmet_odjava)
                       PROJECT(Pre:Naziv_predmeta_o)
                       PROJECT(Pre:Sif_predmeta_o)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Pre:Naziv_predmeta_o   LIKE(Pre:Naziv_predmeta_o)     !List box control field - type derived from field
Pre:Sif_predmeta_o     LIKE(Pre:Sif_predmeta_o)       !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Predmeti/ispiti'),AT(,,416,273),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('BrowsePredmet_odjava'),SYSTEM
                       LIST,AT(8,30,396,197),USE(?Browse:1),VSCROLL,FORMAT('80L(5)|M~Naziv predmeta/ispita~@s50@'), |
  FROM(Queue:Browse:1),IMM,MSG('Browsing the Predmet_odjava file')
                       BUTTON('&View'),AT(197,231,49,14),USE(?View:2),LEFT,ICON('WAVIEW.ICO'),DISABLE,FLAT,HIDE,MSG('View Record'), |
  TIP('View Record')
                       BUTTON('Dodaj'),AT(249,231,49,14),USE(?Insert:3),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('Uredi'),AT(302,231,49,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT,MSG('Change the Record'), |
  TIP('Change the Record')
                       BUTTON('Obri<154>i'),AT(355,231,49,14),USE(?Delete:3),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       SHEET,AT(4,4,410,249),USE(?CurrentTab)
                         TAB('Popis predmeta/ispita'),USE(?Tab:2)
                         END
                       END
                       BUTTON('Zatvori'),AT(355,255,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(197,255,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),DISABLE,FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
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
  GlobalErrors.SetProcedureName('BrowsePredmet_odjava')
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
  Relate:Predmet_odjava.SetOpenRelated()
  Relate:Predmet_odjava.Open                               ! File Predmet_odjava used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Predmet_odjava,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon Pre:Sif_predmeta_o for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,Pre:PK_Predmet_odjava) ! Add the sort order for Pre:PK_Predmet_odjava for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,Pre:Sif_predmeta_o,1,BRW1)     ! Initialize the browse locator using  using key: Pre:PK_Predmet_odjava , Pre:Sif_predmeta_o
  BRW1.AddField(Pre:Naziv_predmeta_o,BRW1.Q.Pre:Naziv_predmeta_o) ! Field Pre:Naziv_predmeta_o is a hot field or requires assignment from browse
  BRW1.AddField(Pre:Sif_predmeta_o,BRW1.Q.Pre:Sif_predmeta_o) ! Field Pre:Sif_predmeta_o is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowsePredmet_odjava',QuickWindow)         ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
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
    Relate:Predmet_odjava.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowsePredmet_odjava',QuickWindow)      ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdatePredmet_odjava
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Odjava file
!!! </summary>
BrowseOdjava PROCEDURE 

CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(Odjava)
                       PROJECT(Odj:Klas_a)
                       PROJECT(Odj:UrBr)
                       PROJECT(Odj:Datum)
                       PROJECT(Odj:Oib)
                       PROJECT(Odj:Sif_odjave)
                       JOIN(Uce:PK_Ucenik,Odj:Oib)
                         PROJECT(Uce:Prezime)
                         PROJECT(Uce:Ime)
                         PROJECT(Uce:Oib)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Odj:Klas_a             LIKE(Odj:Klas_a)               !List box control field - type derived from field
Odj:UrBr               LIKE(Odj:UrBr)                 !List box control field - type derived from field
Odj:Datum              LIKE(Odj:Datum)                !List box control field - type derived from field
Odj:Oib                LIKE(Odj:Oib)                  !List box control field - type derived from field
Uce:Prezime            LIKE(Uce:Prezime)              !List box control field - type derived from field
Uce:Ime                LIKE(Uce:Ime)                  !List box control field - type derived from field
Odj:Sif_odjave         LIKE(Odj:Sif_odjave)           !Primary key field - type derived from field
Uce:Oib                LIKE(Uce:Oib)                  !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW7::View:Browse    VIEW(Stavka_odjave)
                       PROJECT(Sta1:Sif_odjave)
                       PROJECT(Sta1:Sif_predmeta_o)
                       JOIN(Pre:PK_Predmet_odjava,Sta1:Sif_predmeta_o)
                         PROJECT(Pre:Naziv_predmeta_o)
                         PROJECT(Pre:Sif_predmeta_o)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
Pre:Naziv_predmeta_o   LIKE(Pre:Naziv_predmeta_o)     !List box control field - type derived from field
Sta1:Sif_odjave        LIKE(Sta1:Sif_odjave)          !Primary key field - type derived from field
Sta1:Sif_predmeta_o    LIKE(Sta1:Sif_predmeta_o)      !Primary key field - type derived from field
Pre:Sif_predmeta_o     LIKE(Pre:Sif_predmeta_o)       !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Odjave'),AT(,,522,345),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('BrowseOdjava'),SYSTEM
                       LIST,AT(8,30,501,119),USE(?Browse:1),HVSCROLL,FORMAT('63L(5)|M~Klasa~L(2)@K###-##/##-##' & |
  '/##K@65L(5)|M~Urud<158>beni broj~L(2)@K####-##-##-###K@53L(5)|M~Datum odjave~L(2)@D0' & |
  '6.@64L(5)|M~OIB~L(2)@s15@126L(5)|M~Prezime~L(2)@s70@98L(5)|M~Ime~L(2)@s50@'),FROM(Queue:Browse:1), |
  IMM,MSG('Browsing the Odjava file')
                       BUTTON('&View'),AT(301,303,49,14),USE(?View:2),LEFT,ICON('WAVIEW.ICO'),DISABLE,FLAT,HIDE,MSG('View Record'), |
  TIP('View Record')
                       BUTTON('Dodaj'),AT(354,303,49,14),USE(?Insert:3),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('Uredi'),AT(407,303,49,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT,MSG('Change the Record'), |
  TIP('Change the Record')
                       BUTTON('Obri<154>i'),AT(460,303,49,14),USE(?Delete:3),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       SHEET,AT(4,4,515,321),USE(?CurrentTab)
                         TAB('Popis odjava'),USE(?Tab:2)
                           LIST,AT(8,161,501,122),USE(?List),FORMAT('200L(5)|M~Popis odjavljenih predmeta~@s50@'),FROM(Queue:Browse), |
  IMM
                         END
                       END
                       BUTTON('Zatvori'),AT(467,329,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(334,329,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),DISABLE,FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                       BUTTON('Ispis obrasca: Odjava ispita'),AT(5,327,,17),USE(?Print),LEFT,ICON(ICON:Print)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort0:StepClass StepLongClass                        ! Default Step Manager
BRW1::Sort1:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
BRW7                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
                     END

BRW7::Sort0:Locator  StepLocatorClass                      ! Default Locator
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
  GlobalErrors.SetProcedureName('BrowseOdjava')
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
  Relate:Odjava.SetOpenRelated()
  Relate:Odjava.Open                                       ! File Odjava used by this procedure, so make sure it's RelationManager is open
  Access:Ucenik.UseFile                                    ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Odjava,SELF) ! Initialize the browse manager
  BRW7.Init(?List,Queue:Browse.ViewPosition,BRW7::View:Browse,Queue:Browse,Relate:Stavka_odjave,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon Odj:Oib for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,Odj:VK_Ucenik)   ! Add the sort order for Odj:VK_Ucenik for sort order 1
  BRW1.AddRange(Odj:Oib,Relate:Odjava,Relate:Ucenik)       ! Add file relationship range limit for sort order 1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon Odj:Sif_odjave for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,Odj:PK_Odjava)   ! Add the sort order for Odj:PK_Odjava for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,Odj:Sif_odjave,1,BRW1)         ! Initialize the browse locator using  using key: Odj:PK_Odjava , Odj:Sif_odjave
  BRW1.AddField(Odj:Klas_a,BRW1.Q.Odj:Klas_a)              ! Field Odj:Klas_a is a hot field or requires assignment from browse
  BRW1.AddField(Odj:UrBr,BRW1.Q.Odj:UrBr)                  ! Field Odj:UrBr is a hot field or requires assignment from browse
  BRW1.AddField(Odj:Datum,BRW1.Q.Odj:Datum)                ! Field Odj:Datum is a hot field or requires assignment from browse
  BRW1.AddField(Odj:Oib,BRW1.Q.Odj:Oib)                    ! Field Odj:Oib is a hot field or requires assignment from browse
  BRW1.AddField(Uce:Prezime,BRW1.Q.Uce:Prezime)            ! Field Uce:Prezime is a hot field or requires assignment from browse
  BRW1.AddField(Uce:Ime,BRW1.Q.Uce:Ime)                    ! Field Uce:Ime is a hot field or requires assignment from browse
  BRW1.AddField(Odj:Sif_odjave,BRW1.Q.Odj:Sif_odjave)      ! Field Odj:Sif_odjave is a hot field or requires assignment from browse
  BRW1.AddField(Uce:Oib,BRW1.Q.Uce:Oib)                    ! Field Uce:Oib is a hot field or requires assignment from browse
  BRW7.Q &= Queue:Browse
  BRW7.AddSortOrder(,Sta1:VK_Odjava)                       ! Add the sort order for Sta1:VK_Odjava for sort order 1
  BRW7.AddRange(Sta1:Sif_odjave,Relate:Stavka_odjave,Relate:Odjava) ! Add file relationship range limit for sort order 1
  BRW7.AddLocator(BRW7::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW7::Sort0:Locator.Init(,Sta1:Sif_odjave,1,BRW7)        ! Initialize the browse locator using  using key: Sta1:VK_Odjava , Sta1:Sif_odjave
  BRW7.AddField(Pre:Naziv_predmeta_o,BRW7.Q.Pre:Naziv_predmeta_o) ! Field Pre:Naziv_predmeta_o is a hot field or requires assignment from browse
  BRW7.AddField(Sta1:Sif_odjave,BRW7.Q.Sta1:Sif_odjave)    ! Field Sta1:Sif_odjave is a hot field or requires assignment from browse
  BRW7.AddField(Sta1:Sif_predmeta_o,BRW7.Q.Sta1:Sif_predmeta_o) ! Field Sta1:Sif_predmeta_o is a hot field or requires assignment from browse
  BRW7.AddField(Pre:Sif_predmeta_o,BRW7.Q.Pre:Sif_predmeta_o) ! Field Pre:Sif_predmeta_o is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseOdjava',QuickWindow)                 ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW7.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW7.ToolbarItem.HelpButton = ?Help
  BRW1.PrintProcedure = 2
  BRW1.PrintControl = ?Print
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Odjava.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseOdjava',QuickWindow)              ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
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
      UpdateOdjava
      IspisOdjava
    END
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSE
    RETURN SELF.SetSort(2,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Stavka_odjave file
!!! </summary>
BrowseStavka_odjave PROCEDURE 

CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(Stavka_odjave)
                       PROJECT(Sta1:Sif_odjave)
                       PROJECT(Sta1:Sif_predmeta_o)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Sta1:Sif_odjave        LIKE(Sta1:Sif_odjave)          !List box control field - type derived from field
Sta1:Sif_predmeta_o    LIKE(Sta1:Sif_predmeta_o)      !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the Stavka_odjave file'),AT(,,277,198),FONT('MS Sans Serif',8,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,GRAY,IMM,MDI,HLP('BrowseStavka_odjave'),SYSTEM
                       LIST,AT(8,30,261,124),USE(?Browse:1),HVSCROLL,FORMAT('48R(2)|M~Sif odjave~C(0)@N-10@64R' & |
  '(2)|M~Sif predmeta o~C(0)@n-14@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the Stavka_' & |
  'odjave file')
                       BUTTON('&View'),AT(61,158,49,14),USE(?View:2),LEFT,ICON('WAVIEW.ICO'),FLAT,MSG('View Record'), |
  TIP('View Record')
                       BUTTON('&Insert'),AT(114,158,49,14),USE(?Insert:3),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('&Change'),AT(167,158,49,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  MSG('Change the Record'),TIP('Change the Record')
                       BUTTON('&Delete'),AT(220,158,49,14),USE(?Delete:3),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       SHEET,AT(4,4,269,172),USE(?CurrentTab)
                         TAB('&1) PK_Stavka_odjave'),USE(?Tab:2)
                         END
                         TAB('&2) VK_Odjava'),USE(?Tab:3)
                           BUTTON('Select Odjava'),AT(8,158,49,14),USE(?SelectOdjava),LEFT,ICON('WAPARENT.ICO'),FLAT, |
  MSG('Select Parent Field'),TIP('Select Parent Field')
                         END
                         TAB('&3) VK_Predmet_odjava'),USE(?Tab:4)
                           BUTTON('Predmet_o...'),AT(8,158,16,14),USE(?SelectPredmet_odjava),LEFT,ICON('WAPARENT.ICO'), |
  FLAT,MSG('Select Parent Field'),TIP('Select Parent Field')
                         END
                       END
                       BUTTON('&Close'),AT(171,180,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(224,180,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort0:StepClass StepLongClass                        ! Default Step Manager
BRW1::Sort1:StepClass StepLongClass                        ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
BRW1::Sort2:StepClass StepLongClass                        ! Conditional Step Manager - CHOICE(?CurrentTab) = 3
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
  GlobalErrors.SetProcedureName('BrowseStavka_odjave')
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
  Relate:Odjava.SetOpenRelated()
  Relate:Odjava.Open                                       ! File Odjava used by this procedure, so make sure it's RelationManager is open
  Access:Predmet_odjava.UseFile                            ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Stavka_odjave,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon Sta1:Sif_odjave for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,Sta1:VK_Odjava)  ! Add the sort order for Sta1:VK_Odjava for sort order 1
  BRW1.AddRange(Sta1:Sif_odjave,Relate:Stavka_odjave,Relate:Odjava) ! Add file relationship range limit for sort order 1
  BRW1::Sort2:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon Sta1:Sif_predmeta_o for sort order 2
  BRW1.AddSortOrder(BRW1::Sort2:StepClass,Sta1:VK_Predmet_odjava) ! Add the sort order for Sta1:VK_Predmet_odjava for sort order 2
  BRW1.AddRange(Sta1:Sif_predmeta_o,Relate:Stavka_odjave,Relate:Predmet_odjava) ! Add file relationship range limit for sort order 2
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon Sta1:Sif_odjave for sort order 3
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,Sta1:PK_Stavka_odjave) ! Add the sort order for Sta1:PK_Stavka_odjave for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(,Sta1:Sif_odjave,1,BRW1)        ! Initialize the browse locator using  using key: Sta1:PK_Stavka_odjave , Sta1:Sif_odjave
  BRW1.AddField(Sta1:Sif_odjave,BRW1.Q.Sta1:Sif_odjave)    ! Field Sta1:Sif_odjave is a hot field or requires assignment from browse
  BRW1.AddField(Sta1:Sif_predmeta_o,BRW1.Q.Sta1:Sif_predmeta_o) ! Field Sta1:Sif_predmeta_o is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseStavka_odjave',QuickWindow)          ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
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
    Relate:Odjava.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseStavka_odjave',QuickWindow)       ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdateStavka_odjave
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
    OF ?SelectOdjava
      ThisWindow.Update
      GlobalRequest = SelectRecord
      SelectOdjava()
      ThisWindow.Reset
    OF ?SelectPredmet_odjava
      ThisWindow.Update
      GlobalRequest = SelectRecord
      SelectPredmet_odjava()
      ThisWindow.Reset
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


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
!!! Browse the Predmet_prijava file
!!! </summary>
BrowsePredmet_prijava PROCEDURE 

CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(Predmet_prijava)
                       PROJECT(Pre1:Sif_predmeta_p)
                       PROJECT(Pre1:Naziv_predmeta_p)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Pre1:Sif_predmeta_p    LIKE(Pre1:Sif_predmeta_p)      !List box control field - type derived from field
Pre1:Naziv_predmeta_p  LIKE(Pre1:Naziv_predmeta_p)    !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the Predmet_prijava file'),AT(,,417,271),FONT('MS Sans Serif',8,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,GRAY,IMM,MDI,HLP('BrowsePredmet_prijava'),SYSTEM
                       LIST,AT(8,30,400,195),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~Sif predmeta p~C(0)@n-14' & |
  '@80L(2)|M~Naziv predmeta p~L(2)@s50@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the Pr' & |
  'edmet_prijava file')
                       BUTTON('&View'),AT(201,230,49,14),USE(?View:2),LEFT,ICON('WAVIEW.ICO'),FLAT,MSG('View Record'), |
  TIP('View Record')
                       BUTTON('&Insert'),AT(254,230,49,14),USE(?Insert:3),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('&Change'),AT(307,230,49,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  MSG('Change the Record'),TIP('Change the Record')
                       BUTTON('&Delete'),AT(359,230,49,14),USE(?Delete:3),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       SHEET,AT(4,4,411,247),USE(?CurrentTab)
                         TAB('&1) PK_Predmet_prijava'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Close'),AT(313,255,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(365,255,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
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
  GlobalErrors.SetProcedureName('BrowsePredmet_prijava')
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
  BRW1.AddField(Pre1:Sif_predmeta_p,BRW1.Q.Pre1:Sif_predmeta_p) ! Field Pre1:Sif_predmeta_p is a hot field or requires assignment from browse
  BRW1.AddField(Pre1:Naziv_predmeta_p,BRW1.Q.Pre1:Naziv_predmeta_p) ! Field Pre1:Naziv_predmeta_p is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowsePredmet_prijava',QuickWindow)        ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
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
    INIMgr.Update('BrowsePredmet_prijava',QuickWindow)     ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdatePredmet_prijava
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Promjena file
!!! </summary>
BrowsePromjena PROCEDURE 

CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(Promjena)
                       PROJECT(Pro:Kla_sa)
                       PROJECT(Pro:UrBr)
                       PROJECT(Pro:Datum)
                       PROJECT(Pro:Oib)
                       PROJECT(Pro:Sif_promjene)
                       PROJECT(Pro:Sifra_vrste_promjene)
                       JOIN(Uce:PK_Ucenik,Pro:Oib)
                         PROJECT(Uce:Prezime)
                         PROJECT(Uce:Ime)
                         PROJECT(Uce:Oib)
                       END
                       JOIN(Vrs:PK_Vrsta_promjene_ispita,Pro:Sifra_vrste_promjene)
                         PROJECT(Vrs:Naziv_promjene_ispita)
                         PROJECT(Vrs:Sifra_vrste_promjene)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Pro:Kla_sa             LIKE(Pro:Kla_sa)               !List box control field - type derived from field
Pro:UrBr               LIKE(Pro:UrBr)                 !List box control field - type derived from field
Pro:Datum              LIKE(Pro:Datum)                !List box control field - type derived from field
Pro:Oib                LIKE(Pro:Oib)                  !List box control field - type derived from field
Uce:Prezime            LIKE(Uce:Prezime)              !List box control field - type derived from field
Uce:Ime                LIKE(Uce:Ime)                  !List box control field - type derived from field
Vrs:Naziv_promjene_ispita LIKE(Vrs:Naziv_promjene_ispita) !List box control field - type derived from field
Pro:Sif_promjene       LIKE(Pro:Sif_promjene)         !Primary key field - type derived from field
Pro:Sifra_vrste_promjene LIKE(Pro:Sifra_vrste_promjene) !Browse key field - type derived from field
Uce:Oib                LIKE(Uce:Oib)                  !Related join file key field - type derived from field
Vrs:Sifra_vrste_promjene LIKE(Vrs:Sifra_vrste_promjene) !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW7::View:Browse    VIEW(Stavka_promjene)
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
QuickWindow          WINDOW('Promjene'),AT(,,523,346),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('BrowsePromjena'),SYSTEM
                       LIST,AT(8,30,505,118),USE(?Browse:1),HVSCROLL,FORMAT('70L(5)|M~Klasa~L(2)@K###-##/##-##' & |
  '/##K@68L(5)|M~Urud<158>beni broj~L(2)@K####-##-##-###K@54L(5)|M~Datum~L(2)@D06.@64L(' & |
  '5)|M~OIB~L(2)@s15@126L(5)|M~Prezime~L(2)@s70@92L(5)|M~Ime~L(2)@s50@120L(5)|M~Vrsta p' & |
  'romjene~L(2)@s30@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the Promjena file')
                       BUTTON('&View'),AT(305,305,49,14),USE(?View:2),LEFT,ICON('WAVIEW.ICO'),DISABLE,FLAT,HIDE,MSG('View Record'), |
  TIP('View Record')
                       BUTTON('Dodaj'),AT(357,305,49,14),USE(?Insert:3),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('Uredi'),AT(411,305,49,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT,MSG('Change the Record'), |
  TIP('Change the Record')
                       BUTTON('Obri<154>i'),AT(464,305,49,14),USE(?Delete:3),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       SHEET,AT(4,4,517,323),USE(?CurrentTab)
                         TAB('Popis promjena'),USE(?Tab:2)
                           LIST,AT(8,162,505,139),USE(?List),FORMAT('200L(5)|M~Odjavljeni ispit~@s50@200L(5)|M~Pri' & |
  'javljeni ispit~@s50@'),FROM(Queue:Browse),IMM
                         END
                       END
                       BUTTON('Zatvori'),AT(465,329,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(326,329,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),DISABLE,FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                       BUTTON('Ispis obrasca: Promjena ispita'),AT(7,329,125,15),USE(?Print),LEFT,ICON(ICON:Print)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort0:StepClass StepLongClass                        ! Default Step Manager
BRW1::Sort1:StepClass StepLongClass                        ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
BRW1::Sort2:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 3
BRW7                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
                     END

BRW7::Sort0:Locator  StepLocatorClass                      ! Default Locator
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
  GlobalErrors.SetProcedureName('BrowsePromjena')
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
  Access:Ucenik.UseFile                                    ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:Vrsta_promjene_ispita.UseFile                     ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Promjena,SELF) ! Initialize the browse manager
  BRW7.Init(?List,Queue:Browse.ViewPosition,BRW7::View:Browse,Queue:Browse,Relate:Stavka_promjene,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon Pro:Sifra_vrste_promjene for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,Pro:VK_Vrsta_promjene_ispita) ! Add the sort order for Pro:VK_Vrsta_promjene_ispita for sort order 1
  BRW1.AddRange(Pro:Sifra_vrste_promjene,Relate:Promjena,Relate:Vrsta_promjene_ispita) ! Add file relationship range limit for sort order 1
  BRW1::Sort2:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon Pro:Oib for sort order 2
  BRW1.AddSortOrder(BRW1::Sort2:StepClass,Pro:VK_Ucenik)   ! Add the sort order for Pro:VK_Ucenik for sort order 2
  BRW1.AddRange(Pro:Oib,Relate:Promjena,Relate:Ucenik)     ! Add file relationship range limit for sort order 2
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon Pro:Sif_promjene for sort order 3
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,Pro:PK_Promjena) ! Add the sort order for Pro:PK_Promjena for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(,Pro:Sif_promjene,1,BRW1)       ! Initialize the browse locator using  using key: Pro:PK_Promjena , Pro:Sif_promjene
  BRW1.AddField(Pro:Kla_sa,BRW1.Q.Pro:Kla_sa)              ! Field Pro:Kla_sa is a hot field or requires assignment from browse
  BRW1.AddField(Pro:UrBr,BRW1.Q.Pro:UrBr)                  ! Field Pro:UrBr is a hot field or requires assignment from browse
  BRW1.AddField(Pro:Datum,BRW1.Q.Pro:Datum)                ! Field Pro:Datum is a hot field or requires assignment from browse
  BRW1.AddField(Pro:Oib,BRW1.Q.Pro:Oib)                    ! Field Pro:Oib is a hot field or requires assignment from browse
  BRW1.AddField(Uce:Prezime,BRW1.Q.Uce:Prezime)            ! Field Uce:Prezime is a hot field or requires assignment from browse
  BRW1.AddField(Uce:Ime,BRW1.Q.Uce:Ime)                    ! Field Uce:Ime is a hot field or requires assignment from browse
  BRW1.AddField(Vrs:Naziv_promjene_ispita,BRW1.Q.Vrs:Naziv_promjene_ispita) ! Field Vrs:Naziv_promjene_ispita is a hot field or requires assignment from browse
  BRW1.AddField(Pro:Sif_promjene,BRW1.Q.Pro:Sif_promjene)  ! Field Pro:Sif_promjene is a hot field or requires assignment from browse
  BRW1.AddField(Pro:Sifra_vrste_promjene,BRW1.Q.Pro:Sifra_vrste_promjene) ! Field Pro:Sifra_vrste_promjene is a hot field or requires assignment from browse
  BRW1.AddField(Uce:Oib,BRW1.Q.Uce:Oib)                    ! Field Uce:Oib is a hot field or requires assignment from browse
  BRW1.AddField(Vrs:Sifra_vrste_promjene,BRW1.Q.Vrs:Sifra_vrste_promjene) ! Field Vrs:Sifra_vrste_promjene is a hot field or requires assignment from browse
  BRW7.Q &= Queue:Browse
  BRW7.AddSortOrder(,Sta:VK_Promjena)                      ! Add the sort order for Sta:VK_Promjena for sort order 1
  BRW7.AddRange(Sta:Sif_promjene,Relate:Stavka_promjene,Relate:Promjena) ! Add file relationship range limit for sort order 1
  BRW7.AddLocator(BRW7::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW7::Sort0:Locator.Init(,Sta:Sif_promjene,1,BRW7)       ! Initialize the browse locator using  using key: Sta:VK_Promjena , Sta:Sif_promjene
  BRW7.AddField(Pre:Naziv_predmeta_o,BRW7.Q.Pre:Naziv_predmeta_o) ! Field Pre:Naziv_predmeta_o is a hot field or requires assignment from browse
  BRW7.AddField(Pre1:Naziv_predmeta_p,BRW7.Q.Pre1:Naziv_predmeta_p) ! Field Pre1:Naziv_predmeta_p is a hot field or requires assignment from browse
  BRW7.AddField(Sta:Sif_promjene,BRW7.Q.Sta:Sif_promjene)  ! Field Sta:Sif_promjene is a hot field or requires assignment from browse
  BRW7.AddField(Sta:Sif_predmeta_o,BRW7.Q.Sta:Sif_predmeta_o) ! Field Sta:Sif_predmeta_o is a hot field or requires assignment from browse
  BRW7.AddField(Sta:Sif_predmeta_p,BRW7.Q.Sta:Sif_predmeta_p) ! Field Sta:Sif_predmeta_p is a hot field or requires assignment from browse
  BRW7.AddField(Pre:Sif_predmeta_o,BRW7.Q.Pre:Sif_predmeta_o) ! Field Pre:Sif_predmeta_o is a hot field or requires assignment from browse
  BRW7.AddField(Pre1:Sif_predmeta_p,BRW7.Q.Pre1:Sif_predmeta_p) ! Field Pre1:Sif_predmeta_p is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowsePromjena',QuickWindow)               ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW7.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW7.ToolbarItem.HelpButton = ?Help
  BRW1.PrintProcedure = 2
  BRW1.PrintControl = ?Print
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
    INIMgr.Update('BrowsePromjena',QuickWindow)            ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
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
      UpdatePromjena
      IspisPromjena
    END
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


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
!!! Browse the Stavka_promjene file
!!! </summary>
BrowseStavka_promjene PROCEDURE 

CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(Stavka_promjene)
                       PROJECT(Sta:Sif_promjene)
                       PROJECT(Sta:Sif_predmeta_o)
                       PROJECT(Sta:Sif_predmeta_p)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Sta:Sif_promjene       LIKE(Sta:Sif_promjene)         !List box control field - type derived from field
Sta:Sif_predmeta_o     LIKE(Sta:Sif_predmeta_o)       !List box control field - type derived from field
Sta:Sif_predmeta_p     LIKE(Sta:Sif_predmeta_p)       !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the Stavka_promjene file'),AT(,,277,198),FONT('MS Sans Serif',8,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,GRAY,IMM,MDI,HLP('BrowseStavka_promjene'),SYSTEM
                       LIST,AT(8,30,261,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~Sif promjene~C(0)@n-14@6' & |
  '4R(2)|M~Sif predmeta o~C(0)@n-14@64R(2)|M~Sif predmeta p~C(0)@n-14@'),FROM(Queue:Browse:1), |
  IMM,MSG('Browsing the Stavka_promjene file')
                       BUTTON('&View'),AT(61,158,49,14),USE(?View:2),LEFT,ICON('WAVIEW.ICO'),FLAT,MSG('View Record'), |
  TIP('View Record')
                       BUTTON('&Insert'),AT(114,158,49,14),USE(?Insert:3),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('&Change'),AT(167,158,49,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  MSG('Change the Record'),TIP('Change the Record')
                       BUTTON('&Delete'),AT(220,158,49,14),USE(?Delete:3),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       SHEET,AT(4,4,269,172),USE(?CurrentTab)
                         TAB('&1) PK_Stavka_promjene'),USE(?Tab:2)
                         END
                         TAB('&2) VK_Promjena'),USE(?Tab:3)
                           BUTTON('Select Promjena'),AT(8,158,49,14),USE(?SelectPromjena),LEFT,ICON('WAPARENT.ICO'),FLAT, |
  MSG('Select Parent Field'),TIP('Select Parent Field')
                         END
                         TAB('&3) VK_Predmet_odjava'),USE(?Tab:4)
                           BUTTON('Predmet_o...'),AT(8,158,16,14),USE(?SelectPredmet_odjava),LEFT,ICON('WAPARENT.ICO'), |
  FLAT,MSG('Select Parent Field'),TIP('Select Parent Field')
                         END
                         TAB('&4) VK_Predmet_prijava'),USE(?Tab:5)
                           BUTTON('Predmet_p...'),AT(8,158,16,14),USE(?SelectPredmet_prijava),LEFT,ICON('WAPARENT.ICO'), |
  FLAT,MSG('Select Parent Field'),TIP('Select Parent Field')
                         END
                       END
                       BUTTON('&Close'),AT(171,180,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(224,180,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort0:StepClass StepLongClass                        ! Default Step Manager
BRW1::Sort1:StepClass StepLongClass                        ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
BRW1::Sort2:StepClass StepLongClass                        ! Conditional Step Manager - CHOICE(?CurrentTab) = 3
BRW1::Sort3:StepClass StepLongClass                        ! Conditional Step Manager - CHOICE(?CurrentTab) = 4
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
  GlobalErrors.SetProcedureName('BrowseStavka_promjene')
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
  Relate:Predmet_odjava.SetOpenRelated()
  Relate:Predmet_odjava.Open                               ! File Predmet_odjava used by this procedure, so make sure it's RelationManager is open
  Access:Predmet_prijava.UseFile                           ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:Promjena.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Stavka_promjene,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon Sta:Sif_promjene for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,Sta:VK_Promjena) ! Add the sort order for Sta:VK_Promjena for sort order 1
  BRW1.AddRange(Sta:Sif_promjene,Relate:Stavka_promjene,Relate:Promjena) ! Add file relationship range limit for sort order 1
  BRW1::Sort2:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon Sta:Sif_predmeta_o for sort order 2
  BRW1.AddSortOrder(BRW1::Sort2:StepClass,Sta:VK_Predmet_odjava) ! Add the sort order for Sta:VK_Predmet_odjava for sort order 2
  BRW1.AddRange(Sta:Sif_predmeta_o,Relate:Stavka_promjene,Relate:Predmet_odjava) ! Add file relationship range limit for sort order 2
  BRW1::Sort3:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon Sta:Sif_predmeta_p for sort order 3
  BRW1.AddSortOrder(BRW1::Sort3:StepClass,Sta:VK_Predmet_prijava) ! Add the sort order for Sta:VK_Predmet_prijava for sort order 3
  BRW1.AddRange(Sta:Sif_predmeta_p,Relate:Stavka_promjene,Relate:Predmet_prijava) ! Add file relationship range limit for sort order 3
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon Sta:Sif_promjene for sort order 4
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,Sta:PK_Stavka_promjene) ! Add the sort order for Sta:PK_Stavka_promjene for sort order 4
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort0:Locator.Init(,Sta:Sif_promjene,1,BRW1)       ! Initialize the browse locator using  using key: Sta:PK_Stavka_promjene , Sta:Sif_promjene
  BRW1.AddField(Sta:Sif_promjene,BRW1.Q.Sta:Sif_promjene)  ! Field Sta:Sif_promjene is a hot field or requires assignment from browse
  BRW1.AddField(Sta:Sif_predmeta_o,BRW1.Q.Sta:Sif_predmeta_o) ! Field Sta:Sif_predmeta_o is a hot field or requires assignment from browse
  BRW1.AddField(Sta:Sif_predmeta_p,BRW1.Q.Sta:Sif_predmeta_p) ! Field Sta:Sif_predmeta_p is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseStavka_promjene',QuickWindow)        ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
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
    Relate:Predmet_odjava.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseStavka_promjene',QuickWindow)     ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdateStavka_promjene
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
    OF ?SelectPromjena
      ThisWindow.Update
      GlobalRequest = SelectRecord
      SelectPromjena()
      ThisWindow.Reset
    OF ?SelectPredmet_odjava
      ThisWindow.Update
      GlobalRequest = SelectRecord
      SelectPredmet_odjava()
      ThisWindow.Reset
    OF ?SelectPredmet_prijava
      ThisWindow.Update
      GlobalRequest = SelectRecord
      SelectPredmet_prijava()
      ThisWindow.Reset
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSIF CHOICE(?CurrentTab) = 4
    RETURN SELF.SetSort(3,Force)
  ELSE
    RETURN SELF.SetSort(4,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Izostanak file
!!! </summary>
BrowseIzostanak PROCEDURE 

CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(Izostanak)
                       PROJECT(Opr:K__lasa)
                       PROJECT(Opr:Urbr)
                       PROJECT(Opr:Datum)
                       PROJECT(Opr:Oib)
                       PROJECT(Opr:Datum_ispita)
                       PROJECT(Opr:Sifra_izostanka)
                       PROJECT(Opr:Sifra_predmeta_o)
                       PROJECT(Opr:Sif_ispitnog_roka)
                       PROJECT(Opr:Sif_razloga)
                       JOIN(Uce:PK_Ucenik,Opr:Oib)
                         PROJECT(Uce:Prezime)
                         PROJECT(Uce:Ime)
                         PROJECT(Uce:Oib)
                       END
                       JOIN(Isp:PK_Ispitni_rok,Opr:Sif_ispitnog_roka)
                         PROJECT(Isp:Naziv_ispitnog_roka_dativ)
                         PROJECT(Isp:Sifra_ispitnog_roka)
                       END
                       JOIN(Pre:PK_Predmet_odjava,Opr:Sifra_predmeta_o)
                         PROJECT(Pre:Naziv_predmeta_o)
                         PROJECT(Pre:Sif_predmeta_o)
                       END
                       JOIN(Raz:PK_Razlog_izostanka,Opr:Sif_razloga)
                         PROJECT(Raz:Razlog)
                         PROJECT(Raz:Sifra_razloga)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Opr:K__lasa            LIKE(Opr:K__lasa)              !List box control field - type derived from field
Opr:Urbr               LIKE(Opr:Urbr)                 !List box control field - type derived from field
Opr:Datum              LIKE(Opr:Datum)                !List box control field - type derived from field
Opr:Oib                LIKE(Opr:Oib)                  !List box control field - type derived from field
Uce:Prezime            LIKE(Uce:Prezime)              !List box control field - type derived from field
Uce:Ime                LIKE(Uce:Ime)                  !List box control field - type derived from field
Isp:Naziv_ispitnog_roka_dativ LIKE(Isp:Naziv_ispitnog_roka_dativ) !List box control field - type derived from field
Opr:Datum_ispita       LIKE(Opr:Datum_ispita)         !List box control field - type derived from field
Pre:Naziv_predmeta_o   LIKE(Pre:Naziv_predmeta_o)     !List box control field - type derived from field
Raz:Razlog             LIKE(Raz:Razlog)               !List box control field - type derived from field
Opr:Sifra_izostanka    LIKE(Opr:Sifra_izostanka)      !Primary key field - type derived from field
Opr:Sifra_predmeta_o   LIKE(Opr:Sifra_predmeta_o)     !Browse key field - type derived from field
Opr:Sif_ispitnog_roka  LIKE(Opr:Sif_ispitnog_roka)    !Browse key field - type derived from field
Opr:Sif_razloga        LIKE(Opr:Sif_razloga)          !Browse key field - type derived from field
Uce:Oib                LIKE(Uce:Oib)                  !Related join file key field - type derived from field
Isp:Sifra_ispitnog_roka LIKE(Isp:Sifra_ispitnog_roka) !Related join file key field - type derived from field
Pre:Sif_predmeta_o     LIKE(Pre:Sif_predmeta_o)       !Related join file key field - type derived from field
Raz:Sifra_razloga      LIKE(Raz:Sifra_razloga)        !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Izostanci uèenika'),AT(,,672,344),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('BrowseIzostanak'),SYSTEM
                       LIST,AT(8,30,653,270),USE(?Browse:1),HVSCROLL,FORMAT('70L(5)|M~Klasa~L(2)@K###-##/##-##' & |
  '/##K@#1#64L(5)|M~Urud<158>beni broj~L(2)@K####-##-##-###K@46L(5)|M~Datum~L(2)@D06.@5' & |
  '7L(5)|M~OIB~L(2)@s13@114L(5)|M~Prezime uèenika~L(2)@s30@70L(5)|M~Ime uèenika~L(2)@s2' & |
  '0@67L(5)|M~Ispitni rok~L(2)@s15@49L(5)|M~Datum ispita~L(2)@D06.@68L(5)|M~Predmet~L(2' & |
  ')@s15@108L(5)|M~Razlog~L(2)@s25@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the Izostanak file')
                       BUTTON('&View'),AT(301,305,49,14),USE(?View:2),LEFT,ICON('WAVIEW.ICO'),DISABLE,FLAT,HIDE,MSG('View Record'), |
  TIP('View Record')
                       BUTTON('Dodaj'),AT(505,305,49,14),USE(?Insert:3),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('Promjeni'),AT(557,305,49,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  MSG('Change the Record'),TIP('Change the Record')
                       BUTTON('Obri<154>i'),AT(612,305,49,14),USE(?Delete:3),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       SHEET,AT(4,4,665,322),USE(?CurrentTab)
                         TAB('Popis izostanaka'),USE(?Tab:2)
                         END
                       END
                       BUTTON('Zatvori'),AT(618,327,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(349,330,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),DISABLE,FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                       BUTTON('Ispis obrasca: Izostanak s ispita'),AT(7,327,,15),USE(?Print),LEFT,ICON(ICON:Print)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort0:StepClass StepLongClass                        ! Default Step Manager
BRW1::Sort1:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
BRW1::Sort2:StepClass StepLongClass                        ! Conditional Step Manager - CHOICE(?CurrentTab) = 3
BRW1::Sort3:StepClass StepLongClass                        ! Conditional Step Manager - CHOICE(?CurrentTab) = 4
BRW1::Sort4:StepClass StepLongClass                        ! Conditional Step Manager - CHOICE(?CurrentTab) = 5
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
  GlobalErrors.SetProcedureName('BrowseIzostanak')
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
  Relate:Ispitni_rok.SetOpenRelated()
  Relate:Ispitni_rok.Open                                  ! File Ispitni_rok used by this procedure, so make sure it's RelationManager is open
  Access:Predmet_odjava.UseFile                            ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:Razlog_izostanka.UseFile                          ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:Ucenik.UseFile                                    ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Izostanak,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon Opr:Oib for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,Opr:VK_Ucenik)   ! Add the sort order for Opr:VK_Ucenik for sort order 1
  BRW1.AddRange(Opr:Oib,Relate:Izostanak,Relate:Ucenik)    ! Add file relationship range limit for sort order 1
  BRW1::Sort2:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon Opr:Sifra_predmeta_o for sort order 2
  BRW1.AddSortOrder(BRW1::Sort2:StepClass,Opr:VK_Predmet_odjava) ! Add the sort order for Opr:VK_Predmet_odjava for sort order 2
  BRW1.AddRange(Opr:Sifra_predmeta_o,Relate:Izostanak,Relate:Predmet_odjava) ! Add file relationship range limit for sort order 2
  BRW1::Sort3:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon Opr:Sif_ispitnog_roka for sort order 3
  BRW1.AddSortOrder(BRW1::Sort3:StepClass,Opr:VK_Ispitni_rok) ! Add the sort order for Opr:VK_Ispitni_rok for sort order 3
  BRW1.AddRange(Opr:Sif_ispitnog_roka,Relate:Izostanak,Relate:Ispitni_rok) ! Add file relationship range limit for sort order 3
  BRW1::Sort4:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon Opr:Sif_razloga for sort order 4
  BRW1.AddSortOrder(BRW1::Sort4:StepClass,Opr:VK_Razlog_izostanka) ! Add the sort order for Opr:VK_Razlog_izostanka for sort order 4
  BRW1.AddRange(Opr:Sif_razloga,Relate:Izostanak,Relate:Razlog_izostanka) ! Add file relationship range limit for sort order 4
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon Opr:Sifra_izostanka for sort order 5
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,Opr:PK_Opravdani_izostanak) ! Add the sort order for Opr:PK_Opravdani_izostanak for sort order 5
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 5
  BRW1::Sort0:Locator.Init(,Opr:Sifra_izostanka,1,BRW1)    ! Initialize the browse locator using  using key: Opr:PK_Opravdani_izostanak , Opr:Sifra_izostanka
  BRW1.AddField(Opr:K__lasa,BRW1.Q.Opr:K__lasa)            ! Field Opr:K__lasa is a hot field or requires assignment from browse
  BRW1.AddField(Opr:Urbr,BRW1.Q.Opr:Urbr)                  ! Field Opr:Urbr is a hot field or requires assignment from browse
  BRW1.AddField(Opr:Datum,BRW1.Q.Opr:Datum)                ! Field Opr:Datum is a hot field or requires assignment from browse
  BRW1.AddField(Opr:Oib,BRW1.Q.Opr:Oib)                    ! Field Opr:Oib is a hot field or requires assignment from browse
  BRW1.AddField(Uce:Prezime,BRW1.Q.Uce:Prezime)            ! Field Uce:Prezime is a hot field or requires assignment from browse
  BRW1.AddField(Uce:Ime,BRW1.Q.Uce:Ime)                    ! Field Uce:Ime is a hot field or requires assignment from browse
  BRW1.AddField(Isp:Naziv_ispitnog_roka_dativ,BRW1.Q.Isp:Naziv_ispitnog_roka_dativ) ! Field Isp:Naziv_ispitnog_roka_dativ is a hot field or requires assignment from browse
  BRW1.AddField(Opr:Datum_ispita,BRW1.Q.Opr:Datum_ispita)  ! Field Opr:Datum_ispita is a hot field or requires assignment from browse
  BRW1.AddField(Pre:Naziv_predmeta_o,BRW1.Q.Pre:Naziv_predmeta_o) ! Field Pre:Naziv_predmeta_o is a hot field or requires assignment from browse
  BRW1.AddField(Raz:Razlog,BRW1.Q.Raz:Razlog)              ! Field Raz:Razlog is a hot field or requires assignment from browse
  BRW1.AddField(Opr:Sifra_izostanka,BRW1.Q.Opr:Sifra_izostanka) ! Field Opr:Sifra_izostanka is a hot field or requires assignment from browse
  BRW1.AddField(Opr:Sifra_predmeta_o,BRW1.Q.Opr:Sifra_predmeta_o) ! Field Opr:Sifra_predmeta_o is a hot field or requires assignment from browse
  BRW1.AddField(Opr:Sif_ispitnog_roka,BRW1.Q.Opr:Sif_ispitnog_roka) ! Field Opr:Sif_ispitnog_roka is a hot field or requires assignment from browse
  BRW1.AddField(Opr:Sif_razloga,BRW1.Q.Opr:Sif_razloga)    ! Field Opr:Sif_razloga is a hot field or requires assignment from browse
  BRW1.AddField(Uce:Oib,BRW1.Q.Uce:Oib)                    ! Field Uce:Oib is a hot field or requires assignment from browse
  BRW1.AddField(Isp:Sifra_ispitnog_roka,BRW1.Q.Isp:Sifra_ispitnog_roka) ! Field Isp:Sifra_ispitnog_roka is a hot field or requires assignment from browse
  BRW1.AddField(Pre:Sif_predmeta_o,BRW1.Q.Pre:Sif_predmeta_o) ! Field Pre:Sif_predmeta_o is a hot field or requires assignment from browse
  BRW1.AddField(Raz:Sifra_razloga,BRW1.Q.Raz:Sifra_razloga) ! Field Raz:Sifra_razloga is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseIzostanak',QuickWindow)              ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW1.PrintProcedure = 2
  BRW1.PrintControl = ?Print
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
    INIMgr.Update('BrowseIzostanak',QuickWindow)           ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
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
      UpdateIzostanak
      IspisIzostanak
    END
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSIF CHOICE(?CurrentTab) = 4
    RETURN SELF.SetSort(3,Force)
  ELSIF CHOICE(?CurrentTab) = 5
    RETURN SELF.SetSort(4,Force)
  ELSE
    RETURN SELF.SetSort(5,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Ispitni_rok file
!!! </summary>
BrowseIspitni_rok PROCEDURE 

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
QuickWindow          WINDOW('Ispitni rokovi'),AT(,,418,271),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('BrowseIspitni_rok'),SYSTEM
                       LIST,AT(8,30,401,195),USE(?Browse:1),VSCROLL,FORMAT('80L(5)|M~Ispitni rok~@s29@'),FROM(Queue:Browse:1), |
  IMM,MSG('Browsing the Ispitni_rok file')
                       BUTTON('&View'),AT(202,230,49,14),USE(?View:2),LEFT,ICON('WAVIEW.ICO'),DISABLE,FLAT,HIDE,MSG('View Record'), |
  TIP('View Record')
                       BUTTON('Dodaj'),AT(255,230,49,14),USE(?Insert:3),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('Uredi'),AT(308,230,49,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT,MSG('Change the Record'), |
  TIP('Change the Record')
                       BUTTON('Obri<154>i'),AT(361,230,49,14),USE(?Delete:3),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       SHEET,AT(4,4,412,247),USE(?CurrentTab)
                         TAB('Popis ispitnih rokova'),USE(?Tab:2)
                         END
                       END
                       BUTTON('Zatvori'),AT(361,255,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(261,254,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),DISABLE,FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
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
  GlobalErrors.SetProcedureName('BrowseIspitni_rok')
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
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon Isp:Sifra_ispitnog_roka for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,Isp:PK_Ispitni_rok) ! Add the sort order for Isp:PK_Ispitni_rok for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,Isp:Sifra_ispitnog_roka,1,BRW1) ! Initialize the browse locator using  using key: Isp:PK_Ispitni_rok , Isp:Sifra_ispitnog_roka
  BRW1.AddField(Isp:Naziv_ispitnog_roka_dativ,BRW1.Q.Isp:Naziv_ispitnog_roka_dativ) ! Field Isp:Naziv_ispitnog_roka_dativ is a hot field or requires assignment from browse
  BRW1.AddField(Isp:Sifra_ispitnog_roka,BRW1.Q.Isp:Sifra_ispitnog_roka) ! Field Isp:Sifra_ispitnog_roka is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseIspitni_rok',QuickWindow)            ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
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
    INIMgr.Update('BrowseIspitni_rok',QuickWindow)         ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdateIspitni_rok
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

