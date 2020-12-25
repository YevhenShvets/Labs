using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ASP_project_lb
{
    public class SqlConnect
    {
        static string connetionString = @"Data Source=DESKTOP-ON4UJJU;Initial Catalog=asp_database;User ID=asp_user;Password=asp_password";

        public static bool saveUser(string username, string email, string password)
        {
            String sql = "";
            int row = -1;

            sql = "INSERT INTO [User] (username, email, password) VALUES (@name, @email, @pass);";
            using (SqlConnection conn = new SqlConnection(connetionString))
            {
                using (SqlCommand comm = new SqlCommand())
                {
                    comm.Connection = conn;
                    comm.CommandType = CommandType.Text;
                    comm.CommandText = sql;
                    comm.Parameters.AddWithValue("@name", username);
                    comm.Parameters.AddWithValue("@email", email);
                    comm.Parameters.AddWithValue("@pass", password);
                    try
                    {
                        if(conn.State != ConnectionState.Open) conn.Open();
                        row = comm.ExecuteNonQuery();
                    }
                    catch (SqlException ex)
                    {
                    }
                    finally
                    {
                        conn.Close();
                    }
                }
            }

            if (row >= 0) return true;
            else return false;
        }
        public static string selectUser(string email)
        {
            String Output = "";
            String sql;
            sql = "SELECT id, username, email, password FROM [User] WHERE email=@email;";
            using (SqlConnection conn = new SqlConnection(connetionString))
            {
                using (SqlCommand comm = new SqlCommand())
                {
                    comm.Connection = conn;
                    comm.CommandType = CommandType.Text;
                    comm.CommandText = sql;
                    comm.Parameters.AddWithValue("@email", email);
                    try
                    {
                        if (conn.State != ConnectionState.Open) conn.Open();
                        SqlDataReader dataReader = comm.ExecuteReader();

                        while (dataReader.Read())
                        {
                            Output = dataReader.GetValue(0) + "-" + dataReader.GetValue(1) + "-" + dataReader.GetValue(2) + "-" + dataReader.GetValue(3);
                            break;
                        }
                        dataReader.Close();
                    }
                    catch (SqlException ex)
                    {
                    }
                    finally
                    {
                        conn.Close();
                    }
                }
            }
            return Output;
        }
        public static List<string> allUsers()
        {
            List<string> Output = new List<string>();
            String sql;
            sql = "SELECT id, username, email, password FROM [User];";
            using (SqlConnection conn = new SqlConnection(connetionString))
            {
                using (SqlCommand comm = new SqlCommand())
                {
                    comm.Connection = conn;
                    comm.CommandType = CommandType.Text;
                    comm.CommandText = sql;
                    try
                    {
                        if (conn.State != ConnectionState.Open) conn.Open();
                        SqlDataReader dataReader = comm.ExecuteReader();

                        while (dataReader.Read())
                        {
                            Output.Add(dataReader.GetValue(0) + "-" + dataReader.GetValue(1) + "-" + dataReader.GetValue(2) + "-" + dataReader.GetValue(3));
                        }
                        dataReader.Close();
                    }
                    catch (SqlException ex)
                    {
                    }
                    finally
                    {
                        conn.Close();
                    }
                }
            }
            return Output;
        }

    }
}