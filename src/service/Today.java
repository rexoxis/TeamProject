package service;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class Today {

    // 현재시간 출력 메소드
//    public String getTime(){
//
//        GregorianCalendar today = new GregorianCalendar();
//        String ampm = "오전";
//        int hour = today.get(today.HOUR);
//        int minute = today.get(today.MINUTE);
//        int second = today.get(today.SECOND);
//        StringBuilder sb = new StringBuilder();
//
//        if(hour / 12 == 0){
//            ampm = "오전";
//        } else {
//            ampm = "오후";
//            hour = hour - 12;
//        }
//
//        sb.append("현재 접속시간 : ").append(hour).append(":").append(minute)
//                .append(":").append(second).append(ampm);
//        return sb.toString();
//    }
//
//    public String getTime2(){
//
//        Date today = new Date();
//        String hour = today.getHours()+"";
//        String minute = today.getMinutes()+"";
//        String second = today.getSeconds()+"";
//        StringBuilder sb = new StringBuilder();
//
//        if(today.getHours() < 10)
//            hour = "0"+hour;
//        if(today.getMinutes() < 10)
//            minute = "0"+minute;
//        if(today.getSeconds() < 10)
//            second = "0"+second;
//
//        sb.append(hour).append(":").append(minute).append(":").append(second);
//
//        return sb.toString();
//    }

    // 현재 날짜 시간을 붙여서 출력
    public String getDateTime(){
        StringBuilder sb = new StringBuilder();
        Calendar today = Calendar.getInstance();

        String year = today.get(Calendar.YEAR)+"";
        String month = (today.get(Calendar.MONTH)+1)+"";
        String day = today.get(Calendar.DATE)+"";

//        String hour = today.get(Calendar.HOUR)+"";
        String hour = today.get(Calendar.HOUR_OF_DAY)+""; // 24시간
        String min = today.get(Calendar.MINUTE)+"";
        String sec = today.get(Calendar.SECOND)+"";

        if(today.get(Calendar.HOUR_OF_DAY)<10)
            hour = "0"+hour;

        if(today.get(Calendar.MINUTE)<10)
            min = "0"+min;

        if(today.get(Calendar.SECOND)<10)
            sec = "0"+sec;

        if((today.get(Calendar.MONTH)+1)<10)
            month = "0"+month;

        if(today.get(Calendar.DATE)<10)
            day = "0"+day;

        sb.append(year).append(month).append(day).append(hour).append(min).append(sec);

        return sb.toString();
    }

//    public String getDate(){
//        Date today = new Date();
//        StringBuilder sb = new StringBuilder();
//        int year = today.getYear()+1900;
//        int month = today.getMonth() + 1;
//        int date = today.getDate();
//
//        sb.append(year).append(".").append(month).append(".").append(date);
//        return sb.toString();
//    }
}
