"DBEXT settings for WINRMSDB, ODBC connection
let g:dbext_default_profile_MyODBC ='type=ODBC:user=' . $DB2INSTANCE.':passwd=' . $DB2InstancePW.':dbname=WINRMSDB:bin_path=E:\SQLLIB\bin:dsnname=WINRMSDB'
let g:dbext_default_profile = 'MyODBC'
