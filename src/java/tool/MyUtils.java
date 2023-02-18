package tool;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

/**
 * 
 * @author ADMIN
 */
public final class MyUtils {
    private static final String IGNORE_CASE_PATTERN = "(?i)";

    private MyUtils() {
    }

    private static Scanner sc;

    /**
     * The tool use to valid string input and it must match a pattern
     *
     * @param welcome - the first message show to announce User input
     * @param nameS - name of a string variable
     * @param pattern - pattern use to check input
     * @param msg - announce when The user input wrong format
     * @return - a valid string
     */
    public static String getStringReg(String welcome, String nameS, String pattern,
                                String msg, boolean ignorcaseSpace) {
        sc = new Scanner(System.in);
        boolean cont = true;
        System.out.print(welcome);
        String result;
        do {
            result = sc.nextLine();
            result = result.trim();
            if(!ignorcaseSpace)
                if(result.isEmpty())
                    return result;
            if (result.isEmpty()) {
                System.out.print(nameS + " can't empty\nInput again: ");
            } else {
                if (result.matches(pattern)) {
                    cont = false;
                } else {
                    System.out.print("Input wrong format " + msg + "\nInput again: ");
                }
            }
        } while (cont == true);
        return result;
    }

    /**
     *Get a valid String
     * @param welcome -  the first message show to announce User input
     * @param msg - announce when the User input an empty
     * @return - a valid string
     */
    public static String getString(String welcome, String msg, boolean ignorcaseSpace) {
        sc = new Scanner(System.in);
        boolean cont = true;
        System.out.print(welcome);
        String result;
        do {
            result = sc.nextLine();
            result = result.trim();
            if(!ignorcaseSpace){
                if(result.isEmpty())
                    return result;
            }
            if (result.isEmpty()) {
                System.out.print(msg + "\nRe input: ");
            }else
                cont = false;
        } while (cont == true);
        return result;
    }

    /**
     * Valid input of User, allow only double large than min variable and small
     * than max variable and handle problem when User input a String
     *
     * @param welcome - the first message show to announce User input
     * @param min - bounded below
     * @param max - bounded above
     * @return a valid 'double' value
     */
    public static double getDouble(String welcome, double min, double max, boolean ignorcaseSpace) {
        boolean cont = true;
        System.out.print(welcome);
        double result = 0;
        do {
            try {
                String resultString = sc.nextLine();
                    resultString = resultString.trim();
                if(!ignorcaseSpace)
                    if(resultString.isEmpty() || resultString == null)
                        return min-1;
                result = Double.parseDouble(resultString);
                if (result < min || result > max) {
                    System.out.print("Input must large than " + min + " and smaller than "
                                    + max + "\nInput again: ");
                } else {
                    cont = false;
                }
            } catch (NumberFormatException e) {
                System.out.print("PLease input number: ");
            }
        } while (cont == true);
        return result;
    }

    /**
     * Get variable with data type is integer, and large than 'min' value and
     * handle problem when User input a String
     *
     * @param welcome -  the first message show to announce User input
     * @param min - bounded below
     * @return - a valid 'int' value
     */
    public static int getInt(String welcome, int min, int max, boolean ignorcaseSpace) {
        boolean cont = true;
        sc = new Scanner(System.in);
        System.out.print(welcome);
        int result = 0;
        do {
            try {
                if(!ignorcaseSpace){
                    String temp = sc.nextLine();
                    temp.trim();
                    if(temp.isEmpty())
                        return min-1;
                    result = Integer.valueOf(temp);
                }else{
                    String temp = sc.nextLine();
                    result = Integer.valueOf(temp);
                }
                if (result < min || result > max) {
                    System.out.print("Input must be large than or equal " + min + 
                                    "And smaller than "+ max + "\nInput again: ");
                } else {
                    cont = false;
                }
            } catch (NumberFormatException e) {
                System.out.print("PLease input number: ");
            }
        } while (cont == true);
        return result;
    }

    /**
     *the tool will read line by line from the file and add it to ArrayList.
     * @param pathFile - input path of the file
     * @return A ArrayList contains String from the file
     */
    public static List<String> getDataFromFile(String pathFile) {
        ArrayList result = new ArrayList();
        try {
            File f = new File(pathFile);
            if (!f.exists()) {
                System.out.println("File not Exists!!!");
                return null;
            }
            FileReader fr = new FileReader(f);
            BufferedReader bf = new BufferedReader(fr);
            while (true) {
                String test = bf.readLine();
                if (test == null) {
                    break;
                } else {
                    result.add(test);
                }
            }
            fr.close();
            bf.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * valid Date
     * @param message -  the first message show to announce User input
     * @param createDate - a bounded below, the user can't input date before this date
     * @return - a valid date
     */
    public static Date getValidDate(String message, Date createDate, boolean isIgnoreCase){
        Date date = new Date();
        Date dateInput  = new Date();
        SimpleDateFormat formater = new SimpleDateFormat("dd-MM-yyyy");
        boolean flag = true;
        do {
            String dateString = getString(message, "Date can't blank", isIgnoreCase);
            formater.setLenient(false);
            if(!isIgnoreCase)
                if(dateString.isEmpty() || dateString ==null)
                    return null;
            try {
                dateInput = formater.parse(dateString);
                if(dateInput.after(date)) throw new Exception();
                if(createDate != null)
                    if(dateInput.before(createDate)) throw new Exception();
                flag = true;
            } catch (ParseException ex) {
                System.out.println("Please follow format dd-mm-yyyy");
                flag = false;
            } catch (Exception e){
                System.out.println("Date input can't after current date or before create date");
                flag = false;
            }
        } while (!flag);
        return dateInput;
    }
    
    /**
     * this method use to parse(Date) to String
     * @param date - Date wanna change to String
     * @param format - pattern use for format date
     * @return - a valid String date in correct format
     */
    public static String getDateInFormat(Date date,String format){
        SimpleDateFormat formatter = new SimpleDateFormat(format);
        return formatter.format(date);
    }
    
    /**
     * The tool use to parse(String) to Date
     * @param welcome -  the first message show to announce User input
     * @param format - pattern use for format date
     * @param date - a string date wanna parse to object date
     * @return - a valid date in correct format
     */
    public static Date getDateFromString(String welcome, String format, String date){
        Date dateReturn = new Date();
        SimpleDateFormat formater = new SimpleDateFormat(format);
        if( !welcome.equals("null")){
            dateReturn =  getValidDate("Input date wanna find: ", null, true);
        }else{
            try {
                dateReturn =  formater.parse(date);
            } catch (ParseException ex) {
                System.out.println(ex.getMessage());
            }
        }
      return dateReturn;  
    }
    
    /**
     * valid string input
     * @param input
     * @param pattern - pattern wanna check an string
     * @param ignoreCase - true if want ignore case
     * @return - true if valid
     */
    public static boolean validateStringReg(String input, String pattern, boolean ignoreCase){
        input.trim();
        if(input != null && pattern != null){
            if(ignoreCase)
                pattern = IGNORE_CASE_PATTERN + pattern;
            return  input.matches(pattern);
        }
        return false;
    }
}
