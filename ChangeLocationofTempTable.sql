ALTER DATABASE tempdb
MODIFY FILE ( name=tempdev, filename='D:\SQL_SERVER_2008R2_TEMPDB\tempdb.mdf')
GO
ALTER DATABASE tempdb
MODIFY FILE ( name=templog, filename='D:\SQL_SERVER_2008R2_TEMPDB\templog.ldf')




--GENERATE CODE
SELECT 'ALTER DATABASE tempdb MODIFY FILE (NAME = [' + f.name + '],'
+ ' FILENAME = ''Z:\MSSQL\DATA\' + f.name
+ CASE WHEN f.type = 1 THEN '.ldf' ELSE '.mdf' END
+ ''');'
FROM sys.master_files f
WHERE f.database_id = DB_ID(N'tempdb');