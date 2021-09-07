package com.hcm.springbootdemo.utils;

import lombok.extern.slf4j.Slf4j;

import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.*;

@Slf4j
public class DateUtil {

    private static final String SIMPLE = "yyyy-MM-dd HH:mm:ss";
    private static final String DATE_24_NO_SPLIT = "yyyyMMddHHmmss";
    private static final String SIMPLE_NO_TIME_NO_SPLIT = "yyyyMMdd";
    private static final String SIMPLE_NO_TIME = "yyyy-MM-dd";
    private static final String YEAR_AND_MONTH = "yyyy-MM";
    private static final String YEAR_AND_MONTH_NO_SPLIT = "yyyyMM";
    private static final String YEAR = "yyyy";

    /**
     * 获取24小时制当前日期字符串
     *
     * @return
     */
    public static String getStrDate24() {
        SimpleDateFormat formatter = new SimpleDateFormat(SIMPLE);
        Date currentTime = new Date();
        return formatter.format(currentTime);
    }

    public static String getStrDate24NOSPLIT() {
        SimpleDateFormat formatter = new SimpleDateFormat(DATE_24_NO_SPLIT);
        Date currentTime = new Date();
        return formatter.format(currentTime);
    }

    /**
     * 获取 年月日 时间
     *
     * @return
     */
    public static String getStrDateToday() {
        SimpleDateFormat formatter = new SimpleDateFormat(SIMPLE_NO_TIME_NO_SPLIT);
        Date currentTime = new Date();
        return formatter.format(currentTime);
    }

    /**
     * 获取 年月日 时间
     *
     * @return
     */
    public static String getStrDateToday(Date currentTime) {
        SimpleDateFormat formatter = new SimpleDateFormat(SIMPLE_NO_TIME_NO_SPLIT);
        return formatter.format(currentTime);
    }

    /**
     * 获取 年月 时间
     *
     * @return
     */
    public static String getStrDateMonth(Date currentTime) {
        SimpleDateFormat formatter = new SimpleDateFormat(YEAR_AND_MONTH_NO_SPLIT);
        return formatter.format(currentTime);
    }

    /**
     * 获取 年月日 时间
     *
     * @return
     */
    public static String getStrDateFToday() {
        SimpleDateFormat formatter = new SimpleDateFormat(SIMPLE_NO_TIME);
        Date currentTime = new Date();
        return formatter.format(currentTime);
    }


    /**
     * 获取 年月日 时间
     *
     * @return
     */
    public static String getStrDateFToday(Date currentTime) {
        SimpleDateFormat formatter = new SimpleDateFormat(SIMPLE_NO_TIME);
        return formatter.format(currentTime);
    }

    /**
     * 获取 年
     *
     * @return
     */
    public static String getStrDateY() {
        SimpleDateFormat formatter = new SimpleDateFormat(YEAR);
        Date currentTime = new Date();
        return formatter.format(currentTime);
    }

    /**
     * 得到最近的三个月份，格式201301,201212,201211
     *
     * @return
     */
    public static String[] recentlyThreeMonth() {
        String[] timeRes = new String[3];
        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH) + 1;
        if (month < 10) {
            timeRes[0] = year + "0" + month;
        } else {
            timeRes[0] = year + "" + month;
        }
        for (int i = 1; i < 3; i++) {
            if ((month - 1) <= 0) {
                month = month + 12 - 1;
                year = year - 1;
            } else {
                month = month - 1;
            }
            if (month < 10) {
                timeRes[i] = year + "0" + month;
            } else {
                timeRes[i] = year + "" + month;
            }
        }
        return timeRes;
    }

    /**
     * 将传入月份取出此月的下个月1号
     *
     * @param strDate yyyy-MM-dd
     * @return
     */
    public static String getNextMonthByMonth(String strDate) {
        SimpleDateFormat formatter = new SimpleDateFormat(SIMPLE_NO_TIME);
        String[] stringParam = strDate.split("-");
        int[] intParam = new int[3];
        for (int i = 0; i < stringParam.length; i++) {
            intParam[i] = Integer.parseInt(stringParam[i]);
        }
        Calendar calendar = Calendar.getInstance();
        calendar.set(intParam[0], intParam[1], 1);
        return formatter.format(calendar.getTime());
    }

    /**
     * 得到二个日期间的间隔天数
     */
    public static int getTwoDayint(String sj1, String sj2) {
        SimpleDateFormat myFormatter = new SimpleDateFormat(SIMPLE_NO_TIME);
        long day = 0;
        try {
            Date date = myFormatter.parse(sj1);
            Date mydate = myFormatter.parse(sj2);
            day = (date.getTime() - mydate.getTime()) / (24 * 60 * 60 * 1000);
            return Math.abs(Integer.parseInt(String.valueOf(day)));
        } catch (Exception e) {
            return 0;
        }
    }

    /**
     * 将短时间格式字符串转换为时间 yyyy-MM-dd
     *
     * @param strDate
     * @return
     */
    public static Date strToDate(String strDate) {
        SimpleDateFormat formatter = new SimpleDateFormat(SIMPLE_NO_TIME);
        ParsePosition pos = new ParsePosition(0);
        return formatter.parse(strDate, pos);
    }

    /**
     * 将短时间格式字符串转换为时间 yyyy-MM
     *
     * @param strDate
     * @return
     */
    public static String strToDateYYYYMM(Date strDate) {
        SimpleDateFormat formatter = new SimpleDateFormat(YEAR_AND_MONTH);
        return formatter.format(strDate);
    }

    /**
     * 获取当前日期转为格式 yyyy-MM
     *
     * @return
     */
    public static String strToDateYYYYMM() {
        SimpleDateFormat formatter = new SimpleDateFormat(YEAR_AND_MONTH);
        Date date = new Date();
        return formatter.format(date);
    }

    /**
     * 将短时间格式字符串转换为时间 yyyyMMdd
     *
     * @param strDate
     * @return
     */
    public static Date strToDateF(String strDate) {
        SimpleDateFormat formatter = new SimpleDateFormat(SIMPLE_NO_TIME_NO_SPLIT);
        ParsePosition pos = new ParsePosition(0);
        return formatter.parse(strDate, pos);
    }

    /**
     * 得到一个时间延后或前移几天的时间,nowdate为时间,delay为前移或后延的天数
     */
    public static String getNextDay(Date d, String delay) {
        try {
            SimpleDateFormat format = new SimpleDateFormat(SIMPLE_NO_TIME);
            String mdate = "";
            long myTime = d.getTime() / 1000 + Integer.parseInt(delay) * 24
                    * 60 * 60;
            d.setTime(myTime * 1000);
            mdate = format.format(d);
            return mdate;
        } catch (Exception e) {
            return "";
        }
    }

    /**
     * 得到一个时间延后或前移几天的时间,nowdate为时间,delay为前移或后延的天数
     */
    public static String getNextDayF(String nowdate, String delay) {
        try {
            SimpleDateFormat format = new SimpleDateFormat(SIMPLE_NO_TIME_NO_SPLIT);
            String mdate = "";
            Date d = strToDateF(nowdate);
            long myTime = d.getTime() / 1000 + Integer.parseInt(delay) * 24
                    * 60 * 60;
            d.setTime(myTime * 1000);
            mdate = format.format(d);
            return mdate;
        } catch (Exception e) {
            return "";
        }
    }

    /**
     * 得到二个日期间的间隔天数
     */
    public static int getTwoDay(String sj1, String sj2) {
        SimpleDateFormat myFormatter = new SimpleDateFormat(SIMPLE_NO_TIME);
        long day = 0;
        try {
            Date date = myFormatter.parse(sj1);
            Date mydate = myFormatter.parse(sj2);
            day = (date.getTime() - mydate.getTime()) / (24 * 60 * 60 * 1000);
            return Math.abs(Integer.parseInt(String.valueOf(day)));
        } catch (Exception e) {
            return 0;
        }
    }

    /**
     * 按传入的monthCount（几个月）参数,输出得到几个月的月份，格式201301,201212,201211
     *
     * @return
     */
    public static String[] recentlyThreeMonth(int monthCount) {
        String[] timeRes = new String[monthCount];
        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH) + 1;
        if (month < 10) {
            //chenxiaoyi 20160511修改  begin
            timeRes[0] = year + "-0" + month;
        } else {
            timeRes[0] = year + "-" + month;
            //chenxiaoyi 20160511修改  end
        }
        for (int i = 1; i < monthCount; i++) {
            if ((month - 1) <= 0) {
                month = month + 12 - 1;
                year = year - 1;
            } else {
                month = month - 1;
            }
            if (month < 10) {
                timeRes[i] = year + "-0" + month;
            } else {
                timeRes[i] = year + "-" + month;
            }
        }
        return timeRes;
    }

    /**
     * 获取当年的第一天
     *
     * @return
     */
    public static Date getCurrYearFirst() {
        Calendar currCal = Calendar.getInstance();
        int currentYear = currCal.get(Calendar.YEAR);
        return getYearFirst(currentYear);
    }

    /**
     * 获取某年第一天日期
     *
     * @param n 年份
     * @return Date
     */
    public static Date getYearFirst(int n) {
        Calendar calendar = Calendar.getInstance();
        calendar.clear();
        calendar.set(Calendar.YEAR, n);
        return calendar.getTime();
    }

    /**
     * 获取当月的第一天
     *
     * @param
     * @return
     */
    public static Date getCurrMonthFirst() {
        Calendar currCal = Calendar.getInstance();
        currCal.set(Calendar.DAY_OF_MONTH, 1);
        return currCal.getTime();
    }

    /**
     * 获取当前日期，前n个月的年月份日期
     *
     * @param
     * @return
     */
    public static Date getDateBefore(int n) {
        Date date = new Date();
        Calendar currCal = Calendar.getInstance();
        currCal.setTime(date);
        currCal.add(Calendar.MONTH, -n);
        return currCal.getTime();
    }


    /**
     * 获取当前日期，前n年的年月份日期
     *
     * @param
     * @return
     */
    public static String getYearBefore(int n) {
        Date date = new Date();
        Calendar currCal = Calendar.getInstance();
        currCal.setTime(date);
        currCal.add(Calendar.YEAR, -n);
        SimpleDateFormat formatter = new SimpleDateFormat(YEAR);
        return formatter.format(currCal.getTime());
    }

    /**
     * 获取当前时间前一天的24小时制
     *
     * @return
     */
    public static Date getDateDayBefore24() {
        Date date = new Date();
        Calendar currCal = Calendar.getInstance();
        currCal.setTime(date);
        currCal.add(Calendar.DATE, -1);
        return currCal.getTime();
    }

    /**
     * 获取当前时间前一月的24小时制
     *
     * @return
     */
    public static Date getDateMonthBefore24() {
        Date date = new Date();
        Calendar currCal = Calendar.getInstance();
        currCal.setTime(date);
        currCal.add(Calendar.MONTH, -1);
        return currCal.getTime();
    }

    /**
     * getDateWithDayBegin 获取当天时间的起始时间
     *
     * @return String DOM对象
     * @Exception 异常对象
     */
    public static String getDateWithDayBegin() {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat(SIMPLE);
        String dateString = sdf.format(date);
        String[] temp = dateString.split(" ");
        return temp[0] + " " + "00:00:00";
    }

    /**
     * getDateBeforeSeveralHours 获取当前时间的前几个小时
     *
     * @param hours 小时数
     * @return String DOM对象
     * @Exception 异常对象
     */
    public static String getDateBeforeSeveralHours(int hours) {
        long currentTimeMillis = System.currentTimeMillis();
        long beforeTime = currentTimeMillis - hours * 60 * 60 * 1000;
        Date date = new Date(beforeTime);
        SimpleDateFormat sdf = new SimpleDateFormat(SIMPLE);
        return sdf.format(date);
    }

    public static String getDateAfterSeveralHours(int hours) {
        long currentTimeMillis = System.currentTimeMillis();
        long beforeTime = currentTimeMillis + hours * 60 * 60 * 1000;
        Date date = new Date(beforeTime);
        SimpleDateFormat sdf = new SimpleDateFormat(SIMPLE);
        return sdf.format(date);
    }

    /**
     * getDateWithDayEnd 获取当天时间的结束时间
     *
     * @return String DOM对象
     * @Exception 异常对象
     */
    public static String getDateWithDayEnd() {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat(SIMPLE);
        String dateString = sdf.format(date);
        String[] temp = dateString.split(" ");
        return temp[0] + " " + "23:59:59";
    }

    /**
     * 获取两个时间段内的所有日期(如2017-0721到2017-0722只获取2017-0721的时间)
     *
     * @param beginTime
     * @param endTime
     * @return
     */
    public static List<String> findDates(Date beginTime, Date endTime) {
        List<String> dateList = new ArrayList();
        SimpleDateFormat sdf = new SimpleDateFormat(SIMPLE_NO_TIME);
        Calendar calBegin = Calendar.getInstance();
        calBegin.setTime(DateUtil.getDateBefore24(beginTime));
        Calendar calEnd = Calendar.getInstance();
        calEnd.setTime(DateUtil.getDateBefore24(endTime));
        while (calEnd.after(calBegin)) {
            calBegin.add(Calendar.DAY_OF_MONTH, 1);
            dateList.add(sdf.format(calBegin.getTime()));
        }
        return dateList;
    }

    /**
     * 获取某个时间前一天的Date
     *
     * @return
     */
    public static Date getDateBefore24(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int day = calendar.get(Calendar.DATE);
        calendar.set(Calendar.DATE, day - 1);
        return calendar.getTime();
    }

    /**
     * 获取前几天的日期 yyyy-MM-dd
     *
     * @param nowDate
     * @param beforeNum 往前位移多少天
     * @return
     */
    public static String getDateBefore(Date nowDate, int beforeNum) {
        SimpleDateFormat sdf = new SimpleDateFormat(SIMPLE_NO_TIME);
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(nowDate);
        calendar.add(Calendar.DAY_OF_MONTH, -beforeNum);
        return sdf.format(calendar.getTime());
    }

    /**
     * 比较两个时间的大小 传入类型为yyyy-MM-dd格式
     *
     * @param date1
     * @param date2
     * @return
     */
    public static int compareDate(String date1, String date2) {
        SimpleDateFormat dateFormat = new SimpleDateFormat(SIMPLE_NO_TIME);
        try {
            Date dt1 = dateFormat.parse(date1);
            Date dt2 = dateFormat.parse(date2);
            if (dt1.getTime() > dt2.getTime()) {
                return 1;
            } else if (dt1.getTime() < dt2.getTime()) {
                return -1;
            } else {
                return 0;
            }
        } catch (ParseException e) {
            log.error("时间date1：[{}]与时间date2：[{}]比较大小时出现异常：[{}]", date1, date2, e.getMessage(), e);
        }
        return 0;
    }

    /**
     * 获取两个月份之间的月份数量YYYY-MM
     *
     * @param minDate
     * @param maxDate
     * @return
     * @throws ParseException
     */
    public static HashSet<String> getMonthBetween(String minDate, String maxDate) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat(YEAR_AND_MONTH);
        SimpleDateFormat returnSdf = new SimpleDateFormat(YEAR_AND_MONTH);
        return getMonthBetweenCommon(sdf, minDate, maxDate, returnSdf);
    }


    /**
     * 获取两个月份之间的月份数量YYYYMM（目前使用：短信统计表（统计查询），详情一块未使用）
     *
     * @param minDate
     * @param maxDate
     * @return
     * @throws ParseException
     */
    public static HashSet<String> getMonthBetweenYYYYMM(String minDate, String maxDate) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat(YEAR_AND_MONTH);
        SimpleDateFormat returnSdf = new SimpleDateFormat(YEAR_AND_MONTH_NO_SPLIT);
        return getMonthBetweenCommon(sdf, minDate, maxDate, returnSdf);
    }

    /**
     * @param sdf       传入的日期格式
     * @param minDate
     * @param maxDate
     * @param returnSdf 返回的日期格式
     * @return
     * @throws ParseException
     */
    private static HashSet<String> getMonthBetweenCommon(SimpleDateFormat sdf, String minDate, String maxDate,
                                                         SimpleDateFormat returnSdf) throws ParseException {
        HashSet<String> result = new HashSet<>();
        Calendar min = Calendar.getInstance();
        Calendar max = Calendar.getInstance();
        min.setTime(sdf.parse(minDate));
        min.set(min.get(Calendar.YEAR), min.get(Calendar.MONTH), 1);
        max.setTime(sdf.parse(maxDate));
        max.set(max.get(Calendar.YEAR), max.get(Calendar.MONTH), 2);
        while (min.before(max)) {
            result.add(returnSdf.format(min.getTime()));
            min.add(Calendar.MONTH, 1);
        }
        return result;
    }

    /**
     * 获取某个日期的上个月第一天
     *
     * @return
     */
    public static String getLastMonthByDate(String dateStr) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat(SIMPLE_NO_TIME);
        Date date = sdf.parse(dateStr);//初始日期
        Calendar calendar = Calendar.getInstance();//获取当前日期
        calendar.setTime(date);
        calendar.add(Calendar.MONTH, -1);
        calendar.set(Calendar.DAY_OF_MONTH, 1);//设置为1号,当前日期既为本月第一天
        return sdf.format(calendar.getTime());
    }

    /**
     * 获取自调用时刻起三月前的日期字符串
     */
    public static String getThreeMonthAgoDate() {
        SimpleDateFormat format = new SimpleDateFormat(SIMPLE);
        Calendar c = Calendar.getInstance();
        c.setTime(new Date());
        c.add(Calendar.MONTH, -3);
        Date m = c.getTime();
        String mon = format.format(m);
        return mon;
    }

    public static Date getDateWithFormatStr(String dateStr) throws ParseException {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(SIMPLE);
        return simpleDateFormat.parse(dateStr);
    }

    /**
     * 返回负数标识时间解析异常
     *
     * @param beginTime 开始时间
     * @param endTime   结束时间
     * @return
     */
    public static long getIntervalTime(String beginTime, String endTime) {
        try {
            Date begin = getDateWithFormatStr(beginTime);
            Date end = getDateWithFormatStr(endTime);
            long begin2 = begin.getTime();
            long end2 = end.getTime();
            return end2 - begin2;
        } catch (ParseException e) {
            return -1L;
        }
    }

    public static String getMonthByStrDate(String strDate) throws ParseException {
        SimpleDateFormat format1 = new SimpleDateFormat(SIMPLE_NO_TIME);
        SimpleDateFormat format2 = new SimpleDateFormat(YEAR_AND_MONTH_NO_SPLIT);
        Date date = format1.parse(strDate);
        return format2.format(date);
    }
}