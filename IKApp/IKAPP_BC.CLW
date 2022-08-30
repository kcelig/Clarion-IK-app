  MEMBER('IKApp.clw')

  PRAGMA('define(init_priority=>3)')

  MAP
    MODULE('IKApp_BC0.CLW')
IKApp_BC0:DctInit             PROCEDURE
IKApp_BC0:DctKill             PROCEDURE
IKApp_BC0:FilesInit           PROCEDURE
    END
  END

DctInit PROCEDURE
  CODE
  IKApp_BC0:DctInit
  IKApp_BC0:FilesInit


DctKill PROCEDURE
  CODE
  IKApp_BC0:DctKill

