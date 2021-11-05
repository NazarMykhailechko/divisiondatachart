import branchapp.dto.DivsAll;
import com.google.gson.Gson;


import java.io.*;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

import static java.util.stream.Collectors.toList;

public class Test {

    public static void main(String[] args) throws FileNotFoundException, UnsupportedEncodingException {
        Gson gson = new Gson();
        DivsAll[] dto1 = new Gson().fromJson(new InputStreamReader(new FileInputStream("src/main/data111.json"),"UTF-8"), DivsAll[].class);

//        List<DivsAll> divsAllList = Arrays.asList(dto);
//
//        List<DivsAll> temp = divsAllList.stream().filter(d -> d.getDates().equals("01_01_2016") &&
//                !d.getX().equals("АКОРДБАНК")).limit(29).collect(Collectors.toList());//.forEach(System.out::println);
//
//        List<DivsAll> accord = divsAllList.stream().filter(d -> d.getDates().equals("01_01_2016") &&
//                d.getX().equals("АКОРДБАНК")).collect(Collectors.toList());
//
//        //temp.forEach(System.out::println);
//        //accord.forEach(System.out::println);
//        temp.addAll(accord);
//        //temp.forEach(System.out::println);
//
//        List<DivsAll> result = temp.stream().sorted(Comparator.comparingInt(DivsAll::getValue).reversed()).collect(Collectors.toList());
//        //result.forEach(System.out::println);
//
//        DivsAll[] res = result.toArray(new DivsAll[0]);*/
//
//
//        /*divsAllList.stream().filter(d -> d.getDates().equals("01_01_2016") &&
//                (d.getDates().equals("01_01_2016") && d.getX().equals("АКОРДБАНК"))).forEach(System.out::println);*/
//
//        //divsAllList.forEach(System.out::println);
//
///*
//        for (DivsAll d : dto) {
//            System.out.println(d);
//        }
//*/
//
///*        System.out.println(new SimpleDateFormat("dd.MM.yyyy").format(new Date()));
//        URL url = new URL("https://bank.gov.ua/NBU_BankInfo/get_dptlist?json");*/
//
///*        //InputStreamReader reader = new InputStreamReader(url.openStream());
//        BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream()));*/
//        Gson gson = new Gson();

       String str = "[{'x':'ОЩАДБАНК','value':4586,'fill':'#dc143c','dates':'01_01_2016'},{'x':'ОЩАДБАНК','value':4526,'fill':'#dc143c','dates':'01_02_2016'},{'x':'ОЩАДБАНК','value':4464,'fill':'#dc143c','dates':'01_03_2016'},{'x':'ОЩАДБАНК','value':4449,'fill':'#dc143c','dates':'01_04_2016'},{'x':'ОЩАДБАНК','value':4430,'fill':'#dc143c','dates':'01_05_2016'},{'x':'ОЩАДБАНК','value':4354,'fill':'#dc143c','dates':'01_06_2016'},{'x':'ОЩАДБАНК','value':4324,'fill':'#dc143c','dates':'01_07_2016'},{'x':'ОЩАДБАНК','value':4281,'fill':'#dc143c','dates':'01_08_2016'},{'x':'ОЩАДБАНК','value':4258,'fill':'#dc143c','dates':'01_09_2016'},{'x':'ОЩАДБАНК','value':4220,'fill':'#dc143c','dates':'01_10_2016'},{'x':'ОЩАДБАНК','value':4194,'fill':'#dc143c','dates':'01_11_2016'},{'x':'ОЩАДБАНК','value':4168,'fill':'#dc143c','dates':'01_12_2016'},{'x':'ПРИВАТБАНК','value':2620,'fill':'#dc143c','dates':'01_01_2016'},{'x':'ПРИВАТБАНК','value':2618,'fill':'#dc143c','dates':'01_03_2016'},{'x':'ПРИВАТБАНК','value':2618,'fill':'#dc143c','dates':'01_02_2016'},{'x':'ПРИВАТБАНК','value':2592,'fill':'#dc143c','dates':'01_04_2016'},{'x':'ПРИВАТБАНК','value':2571,'fill':'#dc143c','dates':'01_12_2016'},{'x':'ПРИВАТБАНК','value':2568,'fill':'#dc143c','dates':'01_11_2016'},{'x':'ПРИВАТБАНК','value':2567,'fill':'#dc143c','dates':'01_10_2016'},{'x':'ПРИВАТБАНК','value':2565,'fill':'#dc143c','dates':'01_09_2016'},{'x':'ПРИВАТБАНК','value':2564,'fill':'#dc143c','dates':'01_08_2016'},{'x':'ПРИВАТБАНК','value':2563,'fill':'#dc143c','dates':'01_07_2016'},{'x':'ПРИВАТБАНК','value':2563,'fill':'#dc143c','dates':'01_06_2016'},{'x':'ПРИВАТБАНК','value':2563,'fill':'#dc143c','dates':'01_05_2016'}]";

        //DivsAll[] dto1 = new Gson().fromJson(str, DivsAll[].class);

        List<DivsAll> bankBranchList = Arrays.asList(dto1);
        List<String> uniqueFields = bankBranchList.stream().map(m->"{\"title\":" + "\"" + m.getDates().replace("_",".") + "\"}").distinct().collect(toList());
        System.out.println(uniqueFields.toString().replace("[","[{\"title\":\"Назва банку\"},"));
/*        String json1 = gson.toJson(uniqueFields);
        System.out.println(json1);*/


        Map<String, List<Integer>> counting = bankBranchList.stream().sorted(Comparator.comparing(DivsAll::getX).thenComparing(DivsAll::getDates)).collect(
                Collectors.groupingBy(DivsAll::getX, Collectors.mapping(DivsAll::getValue, toList())));

        //System.out.println(counting);

        String json = gson.toJson(counting);

        //System.out.println(json);
        System.out.println(json.replace("\"","[\"").replace("[\":[","\","));

/*        StringBuilder sb = new StringBuilder();

        for (Map.Entry<String, Long> entry : counting.entrySet()) {
            sb.append("{'glb':'").append(entry.getKey()).append("','count'").append(":").append(entry.getValue()).append("},");
            //System.out.println("{" + entry.getKey() + ":" + entry.getValue());
        }

        String JSONdata = "[" + sb.substring(0, sb.length() - 1) + "]";

        System.out.println(JSONdata);

        BankBranchCount[] bbc = new Gson().fromJson(JSONdata, BankBranchCount[].class);

        for (BankBranchCount bankBranchCount : bbc) {
            System.out.println(bankBranchCount);
        }*/

    }

}
