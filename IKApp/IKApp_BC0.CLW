  MEMBER('IKApp.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
IKApp_BC0:DctInit    PROCEDURE
IKApp_BC0:DctKill    PROCEDURE
IKApp_BC0:FilesInit  PROCEDURE
  END

Hide:Access:Ucenik   CLASS(FileManager),TYPE               ! FileManager for Ucenik
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Ucenik   CLASS(RelationManager),TYPE           ! RelationManager for Ucenik
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Predmet_odjava CLASS(FileManager),TYPE         ! FileManager for Predmet_odjava
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Predmet_odjava CLASS(RelationManager),TYPE     ! RelationManager for Predmet_odjava
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Odjava   CLASS(FileManager),TYPE               ! FileManager for Odjava
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Odjava   CLASS(RelationManager),TYPE           ! RelationManager for Odjava
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Stavka_odjave CLASS(FileManager),TYPE          ! FileManager for Stavka_odjave
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Stavka_odjave CLASS(RelationManager),TYPE      ! RelationManager for Stavka_odjave
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Predmet_prijava CLASS(FileManager),TYPE        ! FileManager for Predmet_prijava
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Predmet_prijava CLASS(RelationManager),TYPE    ! RelationManager for Predmet_prijava
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Promjena CLASS(FileManager),TYPE               ! FileManager for Promjena
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Promjena CLASS(RelationManager),TYPE           ! RelationManager for Promjena
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Stavka_promjene CLASS(FileManager),TYPE        ! FileManager for Stavka_promjene
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Stavka_promjene CLASS(RelationManager),TYPE    ! RelationManager for Stavka_promjene
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Izostanak CLASS(FileManager),TYPE              ! FileManager for Izostanak
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Izostanak CLASS(RelationManager),TYPE          ! RelationManager for Izostanak
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Ispitni_rok CLASS(FileManager),TYPE            ! FileManager for Ispitni_rok
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Ispitni_rok CLASS(RelationManager),TYPE        ! RelationManager for Ispitni_rok
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Razlog_izostanka CLASS(FileManager),TYPE       ! FileManager for Razlog_izostanka
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Razlog_izostanka CLASS(RelationManager),TYPE   ! RelationManager for Razlog_izostanka
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Vrsta_promjene_ispita CLASS(FileManager),TYPE  ! FileManager for Vrsta_promjene_ispita
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Vrsta_promjene_ispita CLASS(RelationManager),TYPE ! RelationManager for Vrsta_promjene_ispita
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END


_Hide:Access:Ucenik  &Hide:Access:Ucenik,AUTO,THREAD
_Hide:Relate:Ucenik  &Hide:Relate:Ucenik,AUTO,THREAD
_Hide:Access:Predmet_odjava &Hide:Access:Predmet_odjava,AUTO,THREAD
_Hide:Relate:Predmet_odjava &Hide:Relate:Predmet_odjava,AUTO,THREAD
_Hide:Access:Odjava  &Hide:Access:Odjava,AUTO,THREAD
_Hide:Relate:Odjava  &Hide:Relate:Odjava,AUTO,THREAD
_Hide:Access:Stavka_odjave &Hide:Access:Stavka_odjave,AUTO,THREAD
_Hide:Relate:Stavka_odjave &Hide:Relate:Stavka_odjave,AUTO,THREAD
_Hide:Access:Predmet_prijava &Hide:Access:Predmet_prijava,AUTO,THREAD
_Hide:Relate:Predmet_prijava &Hide:Relate:Predmet_prijava,AUTO,THREAD
_Hide:Access:Promjena &Hide:Access:Promjena,AUTO,THREAD
_Hide:Relate:Promjena &Hide:Relate:Promjena,AUTO,THREAD
_Hide:Access:Stavka_promjene &Hide:Access:Stavka_promjene,AUTO,THREAD
_Hide:Relate:Stavka_promjene &Hide:Relate:Stavka_promjene,AUTO,THREAD
_Hide:Access:Izostanak &Hide:Access:Izostanak,AUTO,THREAD
_Hide:Relate:Izostanak &Hide:Relate:Izostanak,AUTO,THREAD
_Hide:Access:Ispitni_rok &Hide:Access:Ispitni_rok,AUTO,THREAD
_Hide:Relate:Ispitni_rok &Hide:Relate:Ispitni_rok,AUTO,THREAD
_Hide:Access:Razlog_izostanka &Hide:Access:Razlog_izostanka,AUTO,THREAD
_Hide:Relate:Razlog_izostanka &Hide:Relate:Razlog_izostanka,AUTO,THREAD
_Hide:Access:Vrsta_promjene_ispita &Hide:Access:Vrsta_promjene_ispita,AUTO,THREAD
_Hide:Relate:Vrsta_promjene_ispita &Hide:Relate:Vrsta_promjene_ispita,AUTO,THREAD


IKApp_BC0:DctInit PROCEDURE
  CODE
  _Hide:Access:Ucenik &= NEW(Hide:Access:Ucenik)
  _Hide:Relate:Ucenik &= NEW(Hide:Relate:Ucenik)
  _Hide:Access:Predmet_odjava &= NEW(Hide:Access:Predmet_odjava)
  _Hide:Relate:Predmet_odjava &= NEW(Hide:Relate:Predmet_odjava)
  _Hide:Access:Odjava &= NEW(Hide:Access:Odjava)
  _Hide:Relate:Odjava &= NEW(Hide:Relate:Odjava)
  _Hide:Access:Stavka_odjave &= NEW(Hide:Access:Stavka_odjave)
  _Hide:Relate:Stavka_odjave &= NEW(Hide:Relate:Stavka_odjave)
  _Hide:Access:Predmet_prijava &= NEW(Hide:Access:Predmet_prijava)
  _Hide:Relate:Predmet_prijava &= NEW(Hide:Relate:Predmet_prijava)
  _Hide:Access:Promjena &= NEW(Hide:Access:Promjena)
  _Hide:Relate:Promjena &= NEW(Hide:Relate:Promjena)
  _Hide:Access:Stavka_promjene &= NEW(Hide:Access:Stavka_promjene)
  _Hide:Relate:Stavka_promjene &= NEW(Hide:Relate:Stavka_promjene)
  _Hide:Access:Izostanak &= NEW(Hide:Access:Izostanak)
  _Hide:Relate:Izostanak &= NEW(Hide:Relate:Izostanak)
  _Hide:Access:Ispitni_rok &= NEW(Hide:Access:Ispitni_rok)
  _Hide:Relate:Ispitni_rok &= NEW(Hide:Relate:Ispitni_rok)
  _Hide:Access:Razlog_izostanka &= NEW(Hide:Access:Razlog_izostanka)
  _Hide:Relate:Razlog_izostanka &= NEW(Hide:Relate:Razlog_izostanka)
  _Hide:Access:Vrsta_promjene_ispita &= NEW(Hide:Access:Vrsta_promjene_ispita)
  _Hide:Relate:Vrsta_promjene_ispita &= NEW(Hide:Relate:Vrsta_promjene_ispita)
  Relate:Ucenik &= _Hide:Relate:Ucenik
  Relate:Predmet_odjava &= _Hide:Relate:Predmet_odjava
  Relate:Odjava &= _Hide:Relate:Odjava
  Relate:Stavka_odjave &= _Hide:Relate:Stavka_odjave
  Relate:Predmet_prijava &= _Hide:Relate:Predmet_prijava
  Relate:Promjena &= _Hide:Relate:Promjena
  Relate:Stavka_promjene &= _Hide:Relate:Stavka_promjene
  Relate:Izostanak &= _Hide:Relate:Izostanak
  Relate:Ispitni_rok &= _Hide:Relate:Ispitni_rok
  Relate:Razlog_izostanka &= _Hide:Relate:Razlog_izostanka
  Relate:Vrsta_promjene_ispita &= _Hide:Relate:Vrsta_promjene_ispita


IKApp_BC0:FilesInit PROCEDURE
  CODE
  _Hide:Relate:Ucenik.Init
  _Hide:Relate:Predmet_odjava.Init
  _Hide:Relate:Odjava.Init
  _Hide:Relate:Stavka_odjave.Init
  _Hide:Relate:Predmet_prijava.Init
  _Hide:Relate:Promjena.Init
  _Hide:Relate:Stavka_promjene.Init
  _Hide:Relate:Izostanak.Init
  _Hide:Relate:Ispitni_rok.Init
  _Hide:Relate:Razlog_izostanka.Init
  _Hide:Relate:Vrsta_promjene_ispita.Init


IKApp_BC0:DctKill PROCEDURE
  CODE
  _Hide:Relate:Ucenik.Kill
  DISPOSE(_Hide:Relate:Ucenik)
  _Hide:Relate:Predmet_odjava.Kill
  DISPOSE(_Hide:Relate:Predmet_odjava)
  _Hide:Relate:Odjava.Kill
  DISPOSE(_Hide:Relate:Odjava)
  _Hide:Relate:Stavka_odjave.Kill
  DISPOSE(_Hide:Relate:Stavka_odjave)
  _Hide:Relate:Predmet_prijava.Kill
  DISPOSE(_Hide:Relate:Predmet_prijava)
  _Hide:Relate:Promjena.Kill
  DISPOSE(_Hide:Relate:Promjena)
  _Hide:Relate:Stavka_promjene.Kill
  DISPOSE(_Hide:Relate:Stavka_promjene)
  _Hide:Relate:Izostanak.Kill
  DISPOSE(_Hide:Relate:Izostanak)
  _Hide:Relate:Ispitni_rok.Kill
  DISPOSE(_Hide:Relate:Ispitni_rok)
  _Hide:Relate:Razlog_izostanka.Kill
  DISPOSE(_Hide:Relate:Razlog_izostanka)
  _Hide:Relate:Vrsta_promjene_ispita.Kill
  DISPOSE(_Hide:Relate:Vrsta_promjene_ispita)


Hide:Relate:Ucenik.Init PROCEDURE
  CODE
  _Hide:Access:Ucenik.Init
  SELF.Init(Access:Ucenik,1)


Hide:Access:Ucenik.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Uce:Record
  SELF.FileNameValue = 'Ucenik'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Ucenik
  PARENT.Init
  Access:Ucenik &= SELF


Hide:Access:Ucenik.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Ucenik &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Ucenik.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Ucenik,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(Uce:PK_Ucenik,'Uce:PK_Ucenik',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Ucenik.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Odjava,RI:RESTRICT,RI:RESTRICT,Odj:VK_Ucenik)
  SELF.AddRelationLink(Uce:Oib,Odj:Oib)

  SELF.AddRelation(Relate:Promjena,RI:RESTRICT,RI:RESTRICT,Pro:VK_Ucenik)
  SELF.AddRelationLink(Uce:Oib,Pro:Oib)

  SELF.AddRelation(Relate:Izostanak,RI:RESTRICT,RI:RESTRICT,Opr:VK_Ucenik)
  SELF.AddRelationLink(Uce:Oib,Opr:Oib)


Hide:Relate:Ucenik.Kill PROCEDURE

  CODE
  _Hide:Access:Ucenik.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:Ucenik &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Ucenik)                             ! destroy the file manager


Hide:Relate:Predmet_odjava.Init PROCEDURE
  CODE
  _Hide:Access:Predmet_odjava.Init
  SELF.Init(Access:Predmet_odjava,1)


Hide:Access:Predmet_odjava.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Pre:Record
  SELF.FileNameValue = 'Predmet_odjava'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Predmet_odjava
  PARENT.Init
  Access:Predmet_odjava &= SELF


Hide:Access:Predmet_odjava.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Predmet_odjava &= NULL                            ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Predmet_odjava.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Predmet_odjava,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(Pre:PK_Predmet_odjava,'Pre:PK_Predmet_odjava',1)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Predmet_odjava.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Stavka_odjave,RI:RESTRICT,RI:RESTRICT,Sta1:VK_Predmet_odjava)
  SELF.AddRelationLink(Pre:Sif_predmeta_o,Sta1:Sif_predmeta_o)

  SELF.AddRelation(Relate:Stavka_promjene,RI:RESTRICT,RI:RESTRICT,Sta:VK_Predmet_odjava)
  SELF.AddRelationLink(Pre:Sif_predmeta_o,Sta:Sif_predmeta_o)

  SELF.AddRelation(Relate:Izostanak,RI:RESTRICT,RI:RESTRICT,Opr:VK_Predmet_odjava)
  SELF.AddRelationLink(Pre:Sif_predmeta_o,Opr:Sifra_predmeta_o)


Hide:Relate:Predmet_odjava.Kill PROCEDURE

  CODE
  _Hide:Access:Predmet_odjava.Kill                         ! Kill the file manager
  PARENT.Kill
  Relate:Predmet_odjava &= NULL                            ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Predmet_odjava)                     ! destroy the file manager


Hide:Relate:Odjava.Init PROCEDURE
  CODE
  _Hide:Access:Odjava.Init
  SELF.Init(Access:Odjava,1)


Hide:Access:Odjava.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Odj:Record
  SELF.FileNameValue = 'Odjava'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Odjava
  PARENT.Init
  Access:Odjava &= SELF


Hide:Access:Odjava.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Odjava &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Odjava.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Odjava,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(Odj:PK_Odjava,'Odj:PK_Odjava',1)
    SELF.AddKey(Odj:VK_Ucenik,'Odj:VK_Ucenik',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Odjava.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Ucenik)

  SELF.AddRelation(Relate:Stavka_odjave,RI:RESTRICT,RI:RESTRICT,Sta1:VK_Odjava)
  SELF.AddRelationLink(Odj:Sif_odjave,Sta1:Sif_odjave)


Hide:Relate:Odjava.Kill PROCEDURE

  CODE
  _Hide:Access:Odjava.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:Odjava &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Odjava)                             ! destroy the file manager


Hide:Relate:Stavka_odjave.Init PROCEDURE
  CODE
  _Hide:Access:Stavka_odjave.Init
  SELF.Init(Access:Stavka_odjave,1)


Hide:Access:Stavka_odjave.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Sta1:Record
  SELF.FileNameValue = 'Stavka_odjave'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Stavka_odjave
  PARENT.Init
  Access:Stavka_odjave &= SELF


Hide:Access:Stavka_odjave.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Stavka_odjave &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Stavka_odjave.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Stavka_odjave,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(Sta1:PK_Stavka_odjave,'Sta1:PK_Stavka_odjave',0)
    SELF.AddKey(Sta1:VK_Odjava,'Sta1:VK_Odjava',0)
    SELF.AddKey(Sta1:VK_Predmet_odjava,'Sta1:VK_Predmet_odjava',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Stavka_odjave.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Odjava)

  SELF.AddRelation(Relate:Predmet_odjava)


Hide:Relate:Stavka_odjave.Kill PROCEDURE

  CODE
  _Hide:Access:Stavka_odjave.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:Stavka_odjave &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Stavka_odjave)                      ! destroy the file manager


Hide:Relate:Predmet_prijava.Init PROCEDURE
  CODE
  _Hide:Access:Predmet_prijava.Init
  SELF.Init(Access:Predmet_prijava,1)


Hide:Access:Predmet_prijava.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Pre1:Record
  SELF.FileNameValue = 'Predmet_prijava'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Predmet_prijava
  PARENT.Init
  Access:Predmet_prijava &= SELF


Hide:Access:Predmet_prijava.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Predmet_prijava &= NULL                           ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Predmet_prijava.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Predmet_prijava,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(Pre1:PK_Predmet_prijava,'Pre1:PK_Predmet_prijava',1)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Predmet_prijava.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Stavka_promjene,RI:RESTRICT,RI:RESTRICT,Sta:VK_Predmet_prijava)
  SELF.AddRelationLink(Pre1:Sif_predmeta_p,Sta:Sif_predmeta_p)


Hide:Relate:Predmet_prijava.Kill PROCEDURE

  CODE
  _Hide:Access:Predmet_prijava.Kill                        ! Kill the file manager
  PARENT.Kill
  Relate:Predmet_prijava &= NULL                           ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Predmet_prijava)                    ! destroy the file manager


Hide:Relate:Promjena.Init PROCEDURE
  CODE
  _Hide:Access:Promjena.Init
  SELF.Init(Access:Promjena,1)


Hide:Access:Promjena.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Pro:Record
  SELF.FileNameValue = 'Promjena'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Promjena
  PARENT.Init
  Access:Promjena &= SELF


Hide:Access:Promjena.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Promjena &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Promjena.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Promjena,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(Pro:PK_Promjena,'Pro:PK_Promjena',1)
    SELF.AddKey(Pro:VK_Vrsta_promjene_ispita,'Pro:VK_Vrsta_promjene_ispita',0)
    SELF.AddKey(Pro:VK_Ucenik,'Pro:VK_Ucenik',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Promjena.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Ucenik)

  SELF.AddRelation(Relate:Stavka_promjene,RI:RESTRICT,RI:RESTRICT,Sta:VK_Promjena)
  SELF.AddRelationLink(Pro:Sif_promjene,Sta:Sif_promjene)

  SELF.AddRelation(Relate:Vrsta_promjene_ispita)


Hide:Relate:Promjena.Kill PROCEDURE

  CODE
  _Hide:Access:Promjena.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:Promjena &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Promjena)                           ! destroy the file manager


Hide:Relate:Stavka_promjene.Init PROCEDURE
  CODE
  _Hide:Access:Stavka_promjene.Init
  SELF.Init(Access:Stavka_promjene,1)


Hide:Access:Stavka_promjene.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Sta:Record
  SELF.FileNameValue = 'Stavka_promjene'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Stavka_promjene
  PARENT.Init
  Access:Stavka_promjene &= SELF


Hide:Access:Stavka_promjene.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Stavka_promjene &= NULL                           ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Stavka_promjene.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Stavka_promjene,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(Sta:PK_Stavka_promjene,'Sta:PK_Stavka_promjene',0)
    SELF.AddKey(Sta:VK_Promjena,'Sta:VK_Promjena',0)
    SELF.AddKey(Sta:VK_Predmet_odjava,'Sta:VK_Predmet_odjava',0)
    SELF.AddKey(Sta:VK_Predmet_prijava,'Sta:VK_Predmet_prijava',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Stavka_promjene.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Promjena)

  SELF.AddRelation(Relate:Predmet_odjava)

  SELF.AddRelation(Relate:Predmet_prijava)


Hide:Relate:Stavka_promjene.Kill PROCEDURE

  CODE
  _Hide:Access:Stavka_promjene.Kill                        ! Kill the file manager
  PARENT.Kill
  Relate:Stavka_promjene &= NULL                           ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Stavka_promjene)                    ! destroy the file manager


Hide:Relate:Izostanak.Init PROCEDURE
  CODE
  _Hide:Access:Izostanak.Init
  SELF.Init(Access:Izostanak,1)


Hide:Access:Izostanak.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Opr:Record
  SELF.FileNameValue = 'Izostanak'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Izostanak
  PARENT.Init
  Access:Izostanak &= SELF


Hide:Access:Izostanak.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Izostanak &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Izostanak.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Izostanak,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(Opr:PK_Opravdani_izostanak,'Opr:PK_Opravdani_izostanak',1)
    SELF.AddKey(Opr:VK_Ucenik,'Opr:VK_Ucenik',0)
    SELF.AddKey(Opr:VK_Predmet_odjava,'Opr:VK_Predmet_odjava',0)
    SELF.AddKey(Opr:VK_Ispitni_rok,'Opr:VK_Ispitni_rok',0)
    SELF.AddKey(Opr:VK_Razlog_izostanka,'Opr:VK_Razlog_izostanka',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Izostanak.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Predmet_odjava)

  SELF.AddRelation(Relate:Ispitni_rok)

  SELF.AddRelation(Relate:Razlog_izostanka)

  SELF.AddRelation(Relate:Ucenik)


Hide:Relate:Izostanak.Kill PROCEDURE

  CODE
  _Hide:Access:Izostanak.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:Izostanak &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Izostanak)                          ! destroy the file manager


Hide:Relate:Ispitni_rok.Init PROCEDURE
  CODE
  _Hide:Access:Ispitni_rok.Init
  SELF.Init(Access:Ispitni_rok,1)


Hide:Access:Ispitni_rok.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Isp:Record
  SELF.FileNameValue = 'Ispitni_rok'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Ispitni_rok
  PARENT.Init
  Access:Ispitni_rok &= SELF


Hide:Access:Ispitni_rok.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Ispitni_rok &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Ispitni_rok.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Ispitni_rok,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(Isp:PK_Ispitni_rok,'Isp:PK_Ispitni_rok',1)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Ispitni_rok.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Izostanak,RI:RESTRICT,RI:RESTRICT,Opr:VK_Ispitni_rok)
  SELF.AddRelationLink(Isp:Sifra_ispitnog_roka,Opr:Sif_ispitnog_roka)


Hide:Relate:Ispitni_rok.Kill PROCEDURE

  CODE
  _Hide:Access:Ispitni_rok.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:Ispitni_rok &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Ispitni_rok)                        ! destroy the file manager


Hide:Relate:Razlog_izostanka.Init PROCEDURE
  CODE
  _Hide:Access:Razlog_izostanka.Init
  SELF.Init(Access:Razlog_izostanka,1)


Hide:Access:Razlog_izostanka.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Raz:Record
  SELF.FileNameValue = 'Razlog_izostanka'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Razlog_izostanka
  PARENT.Init
  Access:Razlog_izostanka &= SELF


Hide:Access:Razlog_izostanka.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Razlog_izostanka &= NULL                          ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Razlog_izostanka.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Razlog_izostanka,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(Raz:PK_Razlog_izostanka,'Raz:PK_Razlog_izostanka',1)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Razlog_izostanka.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Izostanak,RI:RESTRICT,RI:RESTRICT,Opr:VK_Razlog_izostanka)
  SELF.AddRelationLink(Raz:Sifra_razloga,Opr:Sif_razloga)


Hide:Relate:Razlog_izostanka.Kill PROCEDURE

  CODE
  _Hide:Access:Razlog_izostanka.Kill                       ! Kill the file manager
  PARENT.Kill
  Relate:Razlog_izostanka &= NULL                          ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Razlog_izostanka)                   ! destroy the file manager


Hide:Relate:Vrsta_promjene_ispita.Init PROCEDURE
  CODE
  _Hide:Access:Vrsta_promjene_ispita.Init
  SELF.Init(Access:Vrsta_promjene_ispita,1)


Hide:Access:Vrsta_promjene_ispita.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Vrs:Record
  SELF.FileNameValue = 'Vrsta_promjene_ispita'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Vrsta_promjene_ispita
  PARENT.Init
  Access:Vrsta_promjene_ispita &= SELF


Hide:Access:Vrsta_promjene_ispita.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Vrsta_promjene_ispita &= NULL                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Vrsta_promjene_ispita.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Vrsta_promjene_ispita,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(Vrs:PK_Vrsta_promjene_ispita,'Vrs:PK_Vrsta_promjene_ispita',1)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Vrsta_promjene_ispita.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Promjena,RI:RESTRICT,RI:RESTRICT,Pro:VK_Vrsta_promjene_ispita)
  SELF.AddRelationLink(Vrs:Sifra_vrste_promjene,Pro:Sifra_vrste_promjene)


Hide:Relate:Vrsta_promjene_ispita.Kill PROCEDURE

  CODE
  _Hide:Access:Vrsta_promjene_ispita.Kill                  ! Kill the file manager
  PARENT.Kill
  Relate:Vrsta_promjene_ispita &= NULL                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Vrsta_promjene_ispita)              ! destroy the file manager

