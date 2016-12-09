from MysqlRoles import RoleManage
import pymysql

def test_missing_overview():
    rm = RoleManage("127.0.0.1")
    # check none missed
    assert rm.user_check()[0] == 0

def test_a_user():
        client_con = pymysql.connect(host="localhost",
                                     db='mysql',
                                     autocommit=True)
        with client_con.cursor() as cursor:
            pass
        client_con.close()
