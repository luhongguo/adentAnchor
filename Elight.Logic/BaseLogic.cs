using SqlSugar;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Elight.Utility.Extension.DataCache;
using Elight.Utility.Extension.SqlSugar;

namespace Elight.Logic.Base
{
    public class BaseLogic
    {
        public static readonly bool _RedisCache = Convert.ToBoolean(ConfigurationManager.AppSettings["RedisCache"]);
        public static readonly string _RedisHost = ConfigurationManager.AppSettings["RedisHost"];
        public static readonly int _RedisPort = Convert.ToInt32(ConfigurationManager.AppSettings["RedisPort"]);
        public static readonly string _SQLServerConnString = ConfigurationManager.AppSettings["SQLServerConnString"];
        public static readonly string _MySQLConnString = ConfigurationManager.AppSettings["MySQLConnString"];
        public static readonly string _OracleConnString = ConfigurationManager.AppSettings["OracleConnString"];
        public static readonly string _SQLiteConnString = ConfigurationManager.AppSettings["SQLiteConnString"];
        public static readonly string _DBType = ConfigurationManager.AppSettings["DBType"];

        public static SqlSugarClient GetInstance()
        {
            SqlSugarClient db = null;

            ICacheService cacheService = null;
            if (_RedisCache)
            {
                cacheService = new RedisCache(_RedisHost, _RedisPort);
            }
            else
            {
                cacheService = new HttpRuntimeCache();
            }

            if (_DBType == "SQLServer")
            {
                db = new SqlSugarClient(new ConnectionConfig()
                {
                    ConnectionString = _SQLServerConnString,
                    DbType = DbType.SqlServer,
                    IsAutoCloseConnection = true,
                    ConfigureExternalServices = new ConfigureExternalServices()
                    {
                        SqlFuncServices = ExtMethods.GetExpMethods,
                        DataInfoCacheService = cacheService
                    }
                });
            }
            else if (_DBType == "MySQL")
            {
                db = new SqlSugarClient(new ConnectionConfig()
                {
                    ConnectionString = _MySQLConnString,
                    DbType = DbType.MySql,
                    IsAutoCloseConnection = true,
                    ConfigureExternalServices = new ConfigureExternalServices()
                    {
                        SqlFuncServices = ExtMethods.GetExpMethods,
                        DataInfoCacheService = cacheService
                    }
                });
            }
            else if (_DBType == "SQLite")
            {
                db = new SqlSugarClient(new ConnectionConfig()
                {
                    ConnectionString = _SQLiteConnString,
                    DbType = DbType.Sqlite,
                    IsAutoCloseConnection = true,
                    ConfigureExternalServices = new ConfigureExternalServices()
                    {
                        SqlFuncServices = ExtMethods.GetExpMethods,
                        DataInfoCacheService = cacheService
                    }
                });
            }
            else if (_DBType == "Oracle")
            {
                db = new SqlSugarClient(new ConnectionConfig()
                {
                    ConnectionString = _SQLServerConnString,
                    DbType = DbType.Oracle,
                    IsAutoCloseConnection = true,
                    ConfigureExternalServices = new ConfigureExternalServices()
                    {
                        SqlFuncServices = ExtMethods.GetExpMethods,
                        DataInfoCacheService = cacheService
                    }
                });
            }
            // 暂时不支持
            //else if (_DBType == "Postgresql")
            //{
            //    db = new SqlSugarClient(new ConnectionConfig()
            //    {
            //        ConnectionString = _PostgreSqlConnString,
            //        DbType = DbType.PostgreSQL,
            //        IsAutoCloseConnection = true,
            //        ConfigureExternalServices = new ConfigureExternalServices()
            //        {
            //            SqlFuncServices = ExtMethods.GetExpMethods,
            //            DataInfoCacheService = cacheService
            //        }
            //    });
            //}
            else
            {
                db = new SqlSugarClient(new ConnectionConfig()
                {
                    ConnectionString = _MySQLConnString,
                    DbType = DbType.MySql,
                    IsAutoCloseConnection = true,
                    ConfigureExternalServices = new ConfigureExternalServices()
                    {
                        SqlFuncServices = ExtMethods.GetExpMethods,
                        DataInfoCacheService = cacheService
                    }
                });
            }
            db.Ado.IsEnableLogEvent = true;
            db.Ado.LogEventStarting = (sql, pars) =>
            {
                Console.WriteLine(sql + "\r\n" + db.Utilities.SerializeObject(pars.ToDictionary(it => it.ParameterName, it => it.Value)));
                Console.WriteLine();
            };
            return db;
        }
    }
}
