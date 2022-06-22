DECLARE @DbName NVARCHAR(128);
DECLARE @SchemaName SYSNAME;
DECLARE @ProcName SYSNAME=N'S_LOAN_INT_OUTSTANDING_REPORT';

SELECT CONVERT(TIME(3),DATEADD(ms,ROUND(last_elapsed_time/1000.0,0),0)) 
       AS LastExecutionTime
FROM sys.dm_exec_procedure_stats
WHERE OBJECT_NAME(object_id,database_id)=@ProcName AND
      (OBJECT_SCHEMA_NAME(object_id,database_id)=@SchemaName OR @SchemaName IS NULL) AND
      (DB_NAME(database_id)=@DbName OR @DbName IS NULL)