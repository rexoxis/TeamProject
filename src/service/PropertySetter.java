package service;

import java.lang.reflect.Method;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.HashMap;

// vo 클래스에 set 메소드를 찾아 값을 저장 해주는 기능
// 첫번째 매개변수로는 결과값이 담겨있는 rs 객체를 넘겨줌
// 두번째 매개변수로는 실제로 값을 담을 vo객체를 넘겨줌
// 세번째 매개변수는
public class PropertySetter {

    public static void setProperties(ResultSet rs, Object vo, boolean nullToEmpty, boolean useTrim) throws SQLException{
        ResultSetMetaData rsmd = rs.getMetaData();
        int columnCount = rsmd.getColumnCount();

        String columnName = "";
        String columnType = "";
        int underbarindex = -1;
        String tabName = "";

        HashMap<String,String> type = new HashMap<>(columnCount);

        for (int i = 0; i < columnCount; i++){
            columnName = rsmd.getColumnName(i+1);
            underbarindex = columnName.indexOf("_");
            if(underbarindex < columnName.length()-1){
                if(tabName == null){
                    tabName = columnName.substring(0, underbarindex+1);
                }
                columnType = rsmd.getColumnTypeName(i+1);
                type.put(columnName.substring(underbarindex+1).toUpperCase(), columnType);
            }
        }

        // vo 클래스 property 검사
        Class voClass = vo.getClass();
        Method[] methods = voClass.getDeclaredMethods();
        Class[] parameters = null; // 메소드의 파라미터
        String methodName = null;

        for(int i = 0; i < methods.length; i++){
            methodName = methods[i].getName();
            parameters = methods[i].getParameterTypes();

            if(methodName.indexOf("set") == 0 && methodName.length() > 3 && parameters.length == 1){
                String propertyName = methodName.substring(3,4).toLowerCase() +
                        ((methodName.length() > 4) ? methodName.substring(4) : "");

                String columnTypeString = type.get(propertyName.toUpperCase());

                if(columnTypeString != null){
                    try {
                        Object[] callParameter = null; // 호출시 전달할 인자

                        switch (columnTypeString.toUpperCase()) {
                            case "VARCHAR" : case "VARCHAR2" : case "CHAR" : case "DATE" : case "CLOB" :
                                if (parameters[0] == String.class) {
                                    String varcharVal = rs.getString(tabName + propertyName);
                                    if (varcharVal == null) {
                                        if (nullToEmpty) {
                                            callParameter = new Object[]{""};
                                        }
                                    } else {
                                        callParameter = new Object[]{
                                                (useTrim ? varcharVal.trim() : varcharVal)
                                        };
                                    }
                                }
                                break;

                            case "NUMERIC" : case "INTEGER" : case "NUMBER" :
                                if (parameters[0] == int.class) {
                                    int intVal = rs.getInt(tabName + propertyName);
                                    if (intVal == 0) {
                                        if (nullToEmpty) {
                                            callParameter = new Object[]{0};
                                        }
                                    } else {
                                        callParameter = new Object[]{
                                                (useTrim ? intVal : intVal)
                                        };
                                    }
                                }
                                break;
                        } // switch end

                        if(callParameter != null){
                            // 메소드 호출
                            methods[i].invoke(vo,callParameter);
                        }
                    } catch (Exception e){
                        System.out.println("Class PropertySetter Error !!");
                    }
                }
            }

        }
    }

}
