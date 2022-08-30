   PROGRAM



   INCLUDE('ABERROR.INC'),ONCE
   INCLUDE('ABFILE.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ERRORS.CLW'),ONCE
   INCLUDE('KEYCODES.CLW'),ONCE
   INCLUDE('ABFUZZY.INC'),ONCE

   MAP
     MODULE('IKAPP_BC.CLW')
DctInit     PROCEDURE                                      ! Initializes the dictionary definition module
DctKill     PROCEDURE                                      ! Kills the dictionary definition module
     END
!--- Application Global and Exported Procedure Definitions --------------------------------------------
     MODULE('IKAPP001.CLW')
Main                   PROCEDURE   !Wizard Application for C:\Users\Kruno\Desktop\IK\IKDB.dct
     END
   END

SilentRunning        BYTE(0)                               ! Set true when application is running in 'silent mode'

!region File Declaration
Ucenik               FILE,DRIVER('TOPSPEED'),PRE(Uce),CREATE,BINDABLE,THREAD !                    
PK_Ucenik                KEY(Uce:Oib),NOCASE,PRIMARY       !                    
Record                   RECORD,PRE()
Oib                         STRING(15)                     !                    
Ime                         STRING(50)                     !                    
Prezime                     STRING(70)                     !                    
                         END
                     END                       

Predmet_odjava       FILE,DRIVER('TOPSPEED'),PRE(Pre),CREATE,BINDABLE,THREAD !                    
PK_Predmet_odjava        KEY(Pre:Sif_predmeta_o),NOCASE,PRIMARY !                    
Record                   RECORD,PRE()
Sif_predmeta_o              LONG                           !                    
Naziv_predmeta_o            STRING(50)                     !                    
                         END
                     END                       

Odjava               FILE,DRIVER('TOPSPEED'),PRE(Odj),CREATE,BINDABLE,THREAD !                    
PK_Odjava                KEY(Odj:Sif_odjave),NOCASE,PRIMARY !                    
VK_Ucenik                KEY(Odj:Oib),DUP,NOCASE           !                    
Record                   RECORD,PRE()
Sif_odjave                  LONG                           !                    
Klas_a                      STRING(31)                     !                    
UrBr                        STRING(14)                     !                    
Datum                       DATE                           !                    
Oib                         STRING(15)                     !                    
                         END
                     END                       

Stavka_odjave        FILE,DRIVER('TOPSPEED'),PRE(Sta1),CREATE,BINDABLE,THREAD !                    
PK_Stavka_odjave         KEY(Sta1:Sif_odjave,Sta1:Sif_predmeta_o),NOCASE,PRIMARY !                    
VK_Odjava                KEY(Sta1:Sif_odjave),DUP,NOCASE   !                    
VK_Predmet_odjava        KEY(Sta1:Sif_predmeta_o),DUP,NOCASE !                    
Record                   RECORD,PRE()
Sif_odjave                  LONG                           !                    
Sif_predmeta_o              LONG                           !                    
                         END
                     END                       

Predmet_prijava      FILE,DRIVER('TOPSPEED'),PRE(Pre1),CREATE,BINDABLE,THREAD !                    
PK_Predmet_prijava       KEY(Pre1:Sif_predmeta_p),NOCASE,PRIMARY !                    
Record                   RECORD,PRE()
Sif_predmeta_p              LONG                           !                    
Naziv_predmeta_p            STRING(50)                     !                    
                         END
                     END                       

Promjena             FILE,DRIVER('TOPSPEED'),PRE(Pro),CREATE,BINDABLE,THREAD !                    
PK_Promjena              KEY(Pro:Sif_promjene),NOCASE,PRIMARY !                    
VK_Vrsta_promjene_ispita KEY(Pro:Sifra_vrste_promjene),DUP,NOCASE !                    
VK_Ucenik                KEY(Pro:Oib),DUP,NOCASE           !                    
Record                   RECORD,PRE()
Sif_promjene                LONG                           !                    
Sifra_vrste_promjene        LONG                           !                    
Kla_sa                      STRING(15)                     !                    
UrBr                        STRING(20)                     !                    
Datum                       DATE                           !                    
Oib                         STRING(15)                     !                    
                         END
                     END                       

Stavka_promjene      FILE,DRIVER('TOPSPEED'),PRE(Sta),CREATE,BINDABLE,THREAD !                    
PK_Stavka_promjene       KEY(Sta:Sif_promjene,Sta:Sif_predmeta_o,Sta:Sif_predmeta_p),NOCASE,PRIMARY !                    
VK_Promjena              KEY(Sta:Sif_promjene),DUP,NOCASE  !                    
VK_Predmet_odjava        KEY(Sta:Sif_predmeta_o),DUP,NOCASE !                    
VK_Predmet_prijava       KEY(Sta:Sif_predmeta_p),DUP,NOCASE !                    
Record                   RECORD,PRE()
Sif_promjene                LONG                           !                    
Sif_predmeta_o              LONG                           !                    
Sif_predmeta_p              LONG                           !                    
                         END
                     END                       

Izostanak            FILE,DRIVER('TOPSPEED'),PRE(Opr),CREATE,BINDABLE,THREAD !                    
PK_Opravdani_izostanak   KEY(Opr:Sifra_izostanka),NOCASE,PRIMARY !                    
VK_Ucenik                KEY(Opr:Oib),DUP,NOCASE           !                    
VK_Predmet_odjava        KEY(Opr:Sifra_predmeta_o),DUP,NOCASE !                    
VK_Ispitni_rok           KEY(Opr:Sif_ispitnog_roka),DUP,NOCASE !                    
VK_Razlog_izostanka      KEY(Opr:Sif_razloga),DUP,NOCASE   !                    
Record                   RECORD,PRE()
Sifra_izostanka             LONG                           !                    
K__lasa                     STRING(31)                     !                    
Urbr                        STRING(14)                     !                    
Datum                       DATE                           !                    
Datum_ispita                DATE                           !                    
Oib                         STRING(15)                     !                    
Sif_ispitnog_roka           LONG                           !                    
Sifra_predmeta_o            LONG                           !                    
Sif_razloga                 LONG                           !                    
                         END
                     END                       

Ispitni_rok          FILE,DRIVER('TOPSPEED'),PRE(Isp),CREATE,BINDABLE,THREAD !                    
PK_Ispitni_rok           KEY(Isp:Sifra_ispitnog_roka),NOCASE,PRIMARY !                    
Record                   RECORD,PRE()
Sifra_ispitnog_roka         LONG                           !                    
Naziv_ispitnog_roka_dativ   STRING(29)                     !                    
                         END
                     END                       

Razlog_izostanka     FILE,DRIVER('TOPSPEED'),PRE(Raz),CREATE,BINDABLE,THREAD !                    
PK_Razlog_izostanka      KEY(Raz:Sifra_razloga),NOCASE,PRIMARY !                    
Record                   RECORD,PRE()
Sifra_razloga               LONG                           !                    
Razlog                      STRING(50)                     !                    
                         END
                     END                       

Vrsta_promjene_ispita FILE,DRIVER('TOPSPEED'),PRE(Vrs),CREATE,BINDABLE,THREAD !                    
PK_Vrsta_promjene_ispita KEY(Vrs:Sifra_vrste_promjene),NOCASE,PRIMARY !                    
Record                   RECORD,PRE()
Sifra_vrste_promjene        LONG                           !                    
Naziv_promjene_ispita       STRING(30)                     !                    
                         END
                     END                       

!endregion

Access:Ucenik        &FileManager,THREAD                   ! FileManager for Ucenik
Relate:Ucenik        &RelationManager,THREAD               ! RelationManager for Ucenik
Access:Predmet_odjava &FileManager,THREAD                  ! FileManager for Predmet_odjava
Relate:Predmet_odjava &RelationManager,THREAD              ! RelationManager for Predmet_odjava
Access:Odjava        &FileManager,THREAD                   ! FileManager for Odjava
Relate:Odjava        &RelationManager,THREAD               ! RelationManager for Odjava
Access:Stavka_odjave &FileManager,THREAD                   ! FileManager for Stavka_odjave
Relate:Stavka_odjave &RelationManager,THREAD               ! RelationManager for Stavka_odjave
Access:Predmet_prijava &FileManager,THREAD                 ! FileManager for Predmet_prijava
Relate:Predmet_prijava &RelationManager,THREAD             ! RelationManager for Predmet_prijava
Access:Promjena      &FileManager,THREAD                   ! FileManager for Promjena
Relate:Promjena      &RelationManager,THREAD               ! RelationManager for Promjena
Access:Stavka_promjene &FileManager,THREAD                 ! FileManager for Stavka_promjene
Relate:Stavka_promjene &RelationManager,THREAD             ! RelationManager for Stavka_promjene
Access:Izostanak     &FileManager,THREAD                   ! FileManager for Izostanak
Relate:Izostanak     &RelationManager,THREAD               ! RelationManager for Izostanak
Access:Ispitni_rok   &FileManager,THREAD                   ! FileManager for Ispitni_rok
Relate:Ispitni_rok   &RelationManager,THREAD               ! RelationManager for Ispitni_rok
Access:Razlog_izostanka &FileManager,THREAD                ! FileManager for Razlog_izostanka
Relate:Razlog_izostanka &RelationManager,THREAD            ! RelationManager for Razlog_izostanka
Access:Vrsta_promjene_ispita &FileManager,THREAD           ! FileManager for Vrsta_promjene_ispita
Relate:Vrsta_promjene_ispita &RelationManager,THREAD       ! RelationManager for Vrsta_promjene_ispita

FuzzyMatcher         FuzzyClass                            ! Global fuzzy matcher
GlobalErrorStatus    ErrorStatusClass,THREAD
GlobalErrors         ErrorClass                            ! Global error manager
INIMgr               INIClass                              ! Global non-volatile storage manager
GlobalRequest        BYTE(0),THREAD                        ! Set when a browse calls a form, to let it know action to perform
GlobalResponse       BYTE(0),THREAD                        ! Set to the response from the form
VCRRequest           LONG(0),THREAD                        ! Set to the request from the VCR buttons

Dictionary           CLASS,THREAD
Construct              PROCEDURE
Destruct               PROCEDURE
                     END


  CODE
  GlobalErrors.Init(GlobalErrorStatus)
  FuzzyMatcher.Init                                        ! Initilaize the browse 'fuzzy matcher'
  FuzzyMatcher.SetOption(MatchOption:NoCase, 1)            ! Configure case matching
  FuzzyMatcher.SetOption(MatchOption:WordOnly, 0)          ! Configure 'word only' matching
  INIMgr.Init('.\IKApp.INI', NVD_INI)                      ! Configure INIManager to use INI file
  DctInit
  Main
  INIMgr.Update
  INIMgr.Kill                                              ! Destroy INI manager
  FuzzyMatcher.Kill                                        ! Destroy fuzzy matcher


Dictionary.Construct PROCEDURE

  CODE
  IF THREAD()<>1
     DctInit()
  END


Dictionary.Destruct PROCEDURE

  CODE
  DctKill()

